const router = require('koa-router')()
//引入MySQL数据库
const query = require('./MYSQL');
router.prefix('/yhqx');
// 搜索按钮点击事件搜索相应内容并返回
router.post('/search', async (ctx, next) => {
	let name = ctx.request.body.query;
	// 当前页数
	let pagenum = ctx.request.body.pagenum;
	// 当前页每页显示多少条数据
	let pagesize = ctx.request.body.pagesize;
	// 总条数
	let total = '';
	let a = '';
	let b = '';
	// 起始页索引
	let toppageIndex = (pagenum - 1) * pagesize;
	if(name == ''){
		// 查询总条数 转换为字符串类型
		b = JSON.stringify(await query('SELECT COUNT(*) From user where state =1 AND roler in (0,1)'));
		// 截取字符串，并转化为数字类型，得到总条数
		total = parseInt(b.substring(13, 15));
		//查询数据库
		a = await query('SELECT uname,name,sex,tel,roler FROM user where state = 1 AND roler in (0,1) limit ' + toppageIndex + ',' + pagesize + '');
	}else{
		// 查询数据库
		a = await query(
			`SELECT uname,name,sex,tel,roler FROM user where name = '${name}' and state = 1 limit ${toppageIndex},${pagesize}`
		);
		b = await query(
			`SELECT uname,name,sex,tel,roler FROM user where name = '${name}' and state = 1`
		);
		// 格式化 b 的数据类型
		var dataString1 = JSON.stringify(b);
		var result1 = JSON.parse(dataString1);
		// 得到总页数
		total = result1.length;
	}
	// 格式化 a 的数据类型
	var dataString = JSON.stringify(a);
	var result = JSON.parse(dataString);
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

// 添加按钮点击事件搜索相应内容并返回
router.post('/add', async (ctx, next) => {
	console.log(ctx.request.body);
	let uname = ctx.request.body.userId;
	let name = ctx.request.body.userName;
	let sex = ctx.request.body.sex;
	let tel = ctx.request.body.telephone;
	let roler = ctx.request.body.roler;
	let state = 1;
	// 将信息添加到数据库
	let a = await query(
		`insert into user(uname,name,sex,tel,roler,state) values('${uname}','${name}','${sex}','${tel}','${roler}','${state}')`);
	console.log(a);
	if (a.affectedRows == 1) {
		// 代表插入成功
		let data = {
			code: 200,
			msg:'插入成功'
		};
		ctx.body = data;
	}else{
		let data = {
			code: 0,
			msg:'插入失败'
		};
		ctx.body = data;
	}
})

// 修改按钮点击事件搜索相应内容并返回
router.post('/edit', async (ctx, next) => {
	console.log(ctx.request.body);
	let uname = ctx.request.body.uname;
	let name = ctx.request.body.name;
	let tel = ctx.request.body.tel;
	let roler = ctx.request.body.roler;
	// 根据id修改数据
	let a = await query(`update user set tel = '${tel}',roler = '${roler}' where uname = ${uname}`);
	if (a.changedRows == 1 && a.affectedRows == 1) {
		let data = {
			code: 200,
			msg:'更新成功'
		};
		ctx.body = data;
	}else if(a.changedRows == 0 && a.affectedRows == 1){
			let data = {
				code: 100,
				msg:'与原数据一致'
			};
			ctx.body = data;
		}else if(a.changedRows == 0 && a.affectedRows == 0){
			let data = {
				code: 0,
				msg:'更新失败'
			};
			ctx.body = data;
		}
});
// 根据 uname 删除信息
router.post('/del', async (ctx, next) => {
	var uname = ctx.request.body.uname;
	console.log(uname+"1")
	//根据用户id值更新对应学生的状态，用来控制该学生是否被删除
	let a = await query(`update user set state = 0 where uname = ${uname}`);

	if (a.changedRows == 1) {
		let data = {
			code: 200,
			msg:'删除成功'
		};
		ctx.body = data;
	} else {
		let data = {
			code: 0,
			msg:'删除失败'
		};
		ctx.body = data;
	}

})

module.exports = router
