const router = require('koa-router')()
//引入MySQL数据库
const query = require('./MYSQL');
router.prefix('/studentsList');

// 返回学院列表
router.post('/xyname', async (ctx, next) => {
	//查询数据库
	let a = await query('SELECT * FROM xueyuan');
	// 格式化数据类型
	var dataString = JSON.stringify(a);
	var result = JSON.parse(dataString);
	console.log(result);
	if (result.length > 0) {
		let data = {
			code: 200,
			data: result
		};
		ctx.body = data;
	} else {
		let data = {
			code: 0
		};
		ctx.body = data;
	}
});

// 搜索按钮点击事件搜索相应内容并返回
router.post('/search', async (ctx, next) => {
	console.log(ctx.request.body);
	let uname = ctx.request.body.studentNumber;
	let name = ctx.request.body.studentName;
	let sushe = ctx.request.body.susheNumber;
	let xueyuan = ctx.request.body.xueyuan;
	let lynumber = ctx.request.body.lyNumber;
	let banji = ctx.request.body.className;
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
	if (uname == '' && name == '' && sushe == '' && xueyuan == '' && lynumber == '' && banji == '') {
		// 如果所有搜索条件为空，则执行无条件查询
		// 查询总条数 转换为字符串类型
		b = JSON.stringify(await query('SELECT COUNT(*) FROM user WHERE state = 1 AND roler = 2'));
		// 截取字符串，并转化为数字类型，得到总条数
		total = parseInt(b.substring(13, 15));
		// 查询数据库
		a = await query('SELECT * FROM user WHERE state = 1 AND roler = 2 LIMIT ' + toppageIndex + ',' + pagesize);
	} else {
		// 如果有搜索条件，则执行联合搜索
		// 构建 SQL 查询语句
		let sql = `SELECT * FROM user WHERE state = 1 AND roler = 2`;
		if (uname != '') sql += ` AND uname = '${uname}'`;
		if (name != '') sql += ` AND name = '${name}'`;
		if (sushe != '') sql += ` AND sushe = '${sushe}'`;
		if (xueyuan != '') sql += ` AND xueyuan = '${xueyuan}'`;
		if (lynumber != '') sql += ` AND lynumber = '${lynumber}'`;
		if (banji != '') sql += ` AND banji = '${banji}'`;
		sql += ` LIMIT ${toppageIndex},${pagesize}`;
		// 查询数据库
		a = await query(sql);
		total = a.length;
	}

	// 格式化 a 的数据类型
	var dataString = JSON.stringify(a);
	var result = JSON.parse(dataString);
	console.log(result);

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
});

// 添加学生
router.post('/add', async (ctx, next) => {
	console.log(ctx.request.body);
	let pass = ctx.request.body.pass;
	let state = ctx.request.body.state;
	let uname = ctx.request.body.stuNumber;
	let name = ctx.request.body.stuName;
	let sex = ctx.request.body.sex;
	let tel = ctx.request.body.tel;
	let sushe = ctx.request.body.sushe;
	let xueyuan = ctx.request.body.xueyuan;
	let banji = ctx.request.body.banji;
	let lynumber = ctx.request.body.lyNumber;
	let fdy = ctx.request.body.fdy;
	let fdytel = ctx.request.body.fdytel;
	let family = ctx.request.body.family;
	let familytel = ctx.request.body.familytel;
	// 将信息添加到数据库
	let a = await query(
		`insert into user(pass,state,uname,name,sex,tel,sushe,xueyuan,banji,lynumber,fdy,fdytel,family,familytel,roler) values('${pass}','${state}','${uname}','${name}','${sex}','${tel}','${sushe}','${xueyuan}','${banji}','${lynumber}','${fdy}','${fdytel}','${family}','${familytel}','2')`);
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

// 根据学生 ID 修改 学生信息
router.post('/edit', async (ctx, next) => {
	console.log(ctx.request.body);
	let id = ctx.request.body.id;
	let uname = ctx.request.body.uname;
	let name = ctx.request.body.name;
	let sex = ctx.request.body.sex;
	let tel = ctx.request.body.tel;
	let sushe = ctx.request.body.sushe;
	let xueyuan = ctx.request.body.xueyuan;
	let lynumber = ctx.request.body.lynumber;
	let fdy = ctx.request.body.fdy;
	let fdytel = ctx.request.body.fdytel;
	let family = ctx.request.body.family;
	let familytel = ctx.request.body.familytel;
	// 根据楼管id修改数据
	let a = await query(`update user set uname = '${uname}',name = '${name}',sex = '${sex}',tel = '${tel}',sushe = '${sushe}',xueyuan = '${xueyuan}',lynumber = '${lynumber}',fdy = '${fdy}',fdytel = '${fdytel}',family = '${family}',familytel = '${familytel}' where id = ${id}`);
	console.log(a);
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

// 根据学生 ID 删除学生信息
router.post('/del', async (ctx, next) => {
	console.log(ctx.request.body);
	var id = ctx.request.body.id;
	//根据用户id值更新对应学生的状态，用来控制该学生是否被删除
	let a = await query(`update user set state = 0 where id = ${id}`);

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

// 批量导入处理
router.post('/batchAdd', async (ctx, next) => {
	const allData = ctx.request.body;
	let successNum = 0;
	let promises = []; // 存放每次数据库操作的 Promise
	for (let i = 0; i < allData.length; i++) {
		let detail = allData[i];
		let uname = detail.uname;
		let name = detail.name;
		let sex = detail.sex;
		let xueyuan = detail.xueyuan;
		let banji = detail.banji;
		let tel = detail.tel;
		let lynumber = detail.lynumber;
		let fdy = detail.fdy;
		let fdytel = detail.fdytel;
		let family = detail.family;
		let familytel = detail.familytel;
		// 将每次数据库操作包装成 Promise，并添加到 promises 数组中
		promises.push(query(
			`insert into user(pass,state,uname,name,sex,tel,sushe,xueyuan,banji,lynumber,fdy,fdytel,family,familytel,roler) values('123456','1','${uname}','${name}','${sex}','${tel}','','${xueyuan}','${banji}','${lynumber}','${fdy}','${fdytel}','${family}','${familytel}','2')`
		));
	}
	// 使用 Promise.all() 确保所有的数据库操作都执行完毕
	await Promise.all(promises)
		.then(results => {
			// 对每次数据库操作的结果进行处理
			results.forEach(result => {
				if (result.affectedRows == 1) {
					successNum++;
				}
			});
			console.log(successNum);
			let data = {
				code: 200,
				msg: '插入成功' + successNum + ';插入失败' + (allData.length - successNum)
			};
			ctx.body = data;
		})
		.catch(error => {
			// 处理异常情况
			console.error("批量导入数据出错:", error);
			let data = {
				code: 0,
				msg: '批量导入数据出错，请检查数据格式或数据库连接'
			};
			ctx.body = data;
		});
});



module.exports = router
