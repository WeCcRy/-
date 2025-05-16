const router = require('koa-router')()
//引入MySQL数据库
const query = require('./MYSQL');
router.prefix('/personal');


// 获取电费信息
router.post('/dianfei', async (ctx, next) => {
    var lynumber = ctx.request.body.lynumber;
    var sushe = ctx.request.body.sushe;
    //根据用户id值更新对应学生的状态，用来控制该学生是否被删除
    let result = await query( `
    SELECT dianfei, status, date
    FROM dianfei
    WHERE lynumber = '${lynumber}' AND sushe = '${sushe}'
    ORDER BY date DESC
    LIMIT 1
  `);
    if (result.length>0) {
        console.log(result);
        var newDataString = JSON.stringify(result);
        var data = JSON.parse(newDataString);
        let newResult = {
            code: 200,
            data
        };
        ctx.body = newResult;
    } else {
        let data={
            dianfei:"无",
            status:"无",
            date:"无"
        }
        let newResult = {
            code: 0,
            data
        };
        ctx.body = newResult;
    }
})

// 获取评分信息
router.post('/pinfen', async (ctx, next) => {
    var lynumber = ctx.request.body.lynumber;
    var sushe = ctx.request.body.sushe;
    //根据用户id值更新对应学生的状态，用来控制该学生是否被删除
    let result = await query( `
    SELECT time, total
    FROM sspf
    WHERE lynumber = '${lynumber}' AND sushe = '${sushe}'
    ORDER BY time DESC
    LIMIT 1
  `);
    if (result.length>0) {
        console.log(result);
        var newDataString = JSON.stringify(result);
        var data = JSON.parse(newDataString);
        let newResult = {
            code: 200,
            data
        };
        ctx.body = newResult;
    } else {
        let data={
            pinfen:"无",
            date:"无"
        }
        let newResult = {
            code: 0,
            data
        };
        ctx.body = newResult;
    }
})

module.exports = router;
