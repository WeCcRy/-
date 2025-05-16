const router = require('koa-router')()
//引入MySQL数据库
const query = require('./MYSQL');
//引入moment
const moment = require('moment');
router.prefix('/myForum');
// 搜索按钮点击事件搜索相应内容并返回
router.post('/search', async (ctx, next) => {
    // 当前页数
    let pagenum = ctx.request.body.pagenum;
    // 当前页每页显示多少条数据
    let pagesize = 10;
    // 总条数
    let total = '';
    // 起始页索引
    let topageIndex = (pagenum - 1) * pagesize;
    let sqlResult = await query(
            'SELECT topicId,topic,hostId,host,date,content,type from forum where state = 1 ORDER BY date DESC limit '+topageIndex + ',' + pagesize + '');
    console.log(sqlResult)
        // 格式化 sqlResult 的数据类型
        var dataString = JSON.stringify(sqlResult);
        var result = JSON.parse(dataString);
        // 得到总页数
        total = result.length;
    if (result.length > 0) {
        let data = {
            code: 200,
            total: total,
            data: result
        };
        ctx.body = data;
    } else {
        let data = {
            code: 0
        };
        ctx.body = data;
    }
})

// 内容发布
router.post('/addTopic', async (ctx, next) => {
    // 当前页数
    let addForm = ctx.request.body.addForm;

    const now = moment();
    const time = now.format('YYYY-MM-DD HH:mm:ss');

    let sqlResult = await query(
        `insert into forum(topicId,topic,hostId,host,date,content,type) values('${addForm.topicId}','${addForm.topic}','${addForm.hostId}','${addForm.hostName}','${time}','${addForm.content}','${addForm.type}')`
        );
    if (sqlResult.affectedRows ==1) {
        let data = {
            code: 200,
            msg:"插入成功"
        };
        ctx.body=data;
    } else {
        let data = {
            code: 0,
            msg:"插入失败"
        };
        ctx.body=data;
    }
})

// 内容删除
router.post('/deleteTopic', async (ctx, next) => {
    // 当前页数
    let topicId = ctx.request.body.topicId;

    let sqlResult = await query(
        `UPDATE forum SET state = 0 WHERE topicId = '${topicId}'`
    );
    if (sqlResult.changedRows ==1) {
        let data = {
            code: 200,
            msg:"删除成功"
        };
        ctx.body=data;
    } else {
        let data = {
            code: 0,
            msg:"删除失败"
        };
        ctx.body=data;
    }
})

// 详细内容查询
router.post('/topicDetail', async (ctx, next) => {
    // 当前页数
    let topicId = ctx.request.body.topicId;

    let sqlResult = await query(
        `select * from forum where topicId='${topicId}'`
    );
    var dataString = JSON.stringify(sqlResult);
    var result = JSON.parse(dataString);

    if (result.length > 0) {
        let data = {
            code: 200,
            result
        };
        ctx.body=data;
    } else {
        let data = {
            code: 0,
        };
        ctx.body=data;
    }
})

// 添加评论
router.post('/addComment', async (ctx, next) => {
    // 当前页数
    let obj = ctx.request.body;
    let sqlResult = await query(
        `INSERT INTO comment (commentId, topicId, content, hostId, host, date) 
        VALUES ('${obj.commentId}', '${obj.topicId}', '${obj.content}', '${obj.hostId}', '${obj.host}', '${obj.date}');`
    );
    if (sqlResult.affectedRows ==1) {
        let data = {
            code: 200,
            msg:"评论成功"
        };
        ctx.body=data;
    } else {
        let data = {
            code: 0,
            msg:"评论失败"
        };
        ctx.body=data;
    }
})

// 拉取评论（带分页）
router.post('/getComment', async (ctx, next) => {
    let topicId = ctx.request.body.topicId;
    let page = ctx.request.body.page || 1; // 默认页码为1
    let pageSize = ctx.request.body.pageSize || 10; // 默认每页显示10条记录

    try {
        // 查询评论总数
        let countResult = await query(`SELECT COUNT(*) AS count FROM comment WHERE topicId = '${topicId}'`);
        let total = countResult[0].count;
        // 计算起始索引
        let startIndex = (page - 1) * pageSize;

        // 查询评论列表
        let sqlResult = await query(
            'SELECT * FROM comment WHERE topicId = ? ORDER BY date ASC LIMIT ?, ?',
            [topicId, startIndex, pageSize]
        );

        // 如果返回的数据少于pageSize，则表示没有更多数据
        // 遍历评论数组，为每个评论对象添加subreply关键字
        for (let i = 0; i < sqlResult.length; i++) {
            // 添加空的subreply数组
            sqlResult[i].subreply = await query(
                `SELECT * FROM commentReply WHERE commentId = '${[sqlResult[i].commentId]}'`,
            );
        }
        if (sqlResult.length < pageSize) {
            let data = {
                code: 200,
                total: total,
                data: sqlResult,
                hasMore: false // 表示没有更多数据
            };
            ctx.body = data;
        } else {
            // 遍历评论数组，为每个评论对象添加subreply关键字
            // for (let i = 0; i < sqlResult.length; i++) {
            //     // 添加空的subreply数组
            //     sqlResult[i].subreply = await query(
            //         'SELECT * FROM commentReply WHERE commentId = ',
            //         [sqlResult[i].commentId]
            //     );
            // }

            let data = {
                code: 200,
                total: total,
                data: sqlResult,
                hasMore: true // 表示还有更多数据
            };
            ctx.body = data;
        }
    } catch (error) {
        console.error("Error fetching comments:", error);
        let data = {
            code: 0,
            error: "Failed to fetch comments"
        };
        ctx.body = data;
    }
});



//addCommentRely 添加评论回复
router.post('/addCommentRely', async (ctx, next) => {
    const now = moment();
    const time = now.format('YYYY-MM-DD HH:mm:ss');
    const reply=ctx.request.body;
    let sqlResult = await query(
        `INSERT INTO commentReply (commentId, replyId,reply,fromId,fromName,toId,toName,date) 
        VALUES ('${reply.commentId}', '${reply.replyId}', '${reply.reply}', '${reply.fromId}', '${reply.fromName}', '${reply.toId}', '${reply.toName}', '${time}');`
    );
    if (sqlResult.affectedRows ==1) {
        let data = {
            code: 200,
            msg:"回复成功"
        };
        ctx.body=data;
    } else {
        let data = {
            code: 0,
            msg:"回复失败"
        };
        ctx.body=data;
    }
})

// 用户获得已发布的话题列表
router.post('/getForumList', async (ctx, next) => {
    const queryInfo=ctx.request.body.queryInfo;
    const hostId=ctx.request.body.userId;
    let length = await query(
        `SELECT * FROM forum where state = 1 and hostId='${hostId}'`
    );
    let total=length.length;
    // 当前页码
    let pagenum = queryInfo.pageNum;
    // 每页显示的条数
    let pagesize = queryInfo.pageSize;
    // 设置起始页
    let toppageIndex = (pagenum - 1) * pagesize;
    let sqlResult = await query(
        `SELECT * FROM forum where state = 1 and hostId='${hostId}' limit ` + toppageIndex + ',' + pagesize + ''
    );
    // 格式化 sqlResult 的数据类型
    var dataString = JSON.stringify(sqlResult);
    var result = JSON.parse(dataString);
    if (result.length>0) {
        let data = {
            code: 200,
            result,
            total
        };
        ctx.body=data;
    } else {
        let data = {
            code: 0,
            result,
            total
        };
        ctx.body=data;
    }
})


module.exports = router
