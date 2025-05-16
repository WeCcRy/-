const router = require('koa-router')()
//引入MySQL数据库
const query = require('./MYSQL');
router.prefix('/dormList');

// 搜索按钮点击事件搜索相应内容并返回
router.post('/search', async (ctx, next) => {
	let lynumber = ctx.request.body.lynumber;
	let sushe = ctx.request.body.sushe;
	// 当前页数
	let pagenum = ctx.request.body.pagenum;
	// 当前页每页显示多少条数据
	let pagesize = ctx.request.body.pagesize;
	// 根据楼宇号查询
	let total=await query(`SELECT COUNT(DISTINCT sushe) FROM sushe where lynumber='${lynumber}';`)
	// 格式化 a 的数据类型
	let count = total[0]['COUNT(DISTINCT sushe)'];
	var pagetotal = count;
	// 起始页索引
	let toppageIndex = (pagenum - 1) * pagesize
	var c = '';
	if (sushe == '') {
		// 根据楼宇号在宿舍表中查找对应楼宇的所有宿舍
		c = await query(`SELECT * 
								FROM sushe
								WHERE lynumber = '${lynumber}'
							`+ ' limit ' + toppageIndex + ',' + pagesize + '');
	} else {
		// 根据lyid 和宿舍号 在宿舍表中查找对应楼宇的所有宿舍
		c = await query(`SELECT *
								FROM sushe
								WHERE lynumber = '${lynumber}' AND sushe='${sushe}'
							`+ ' limit ' + toppageIndex + ',' + pagesize + '');
		pagetotal=1;
	}
	// // 格式化数据类型
	var dataString = JSON.stringify(c);
	var result = JSON.parse(dataString);
	//
	// for循环再根据查询到的宿舍查询，将查询到的宿舍人员信息添加到 result 的children 中
	for (var i = 0; i < result.length; i++) {
		// 根据宿舍号和楼宇号查询该宿舍的人员信息
		let ssry = await query(
			`SELECT * FROM user WHERE state = 1 && sushe = ${result[i].sushe} && lynumber = '${lynumber}'`);
		var ssryDataString = JSON.stringify(ssry);
		var ssryResult = JSON.parse(ssryDataString);
		// 电费状态，只查询近2个月的
		let df = await query(
			`SELECT * FROM dianfei WHERE date >= DATE_SUB(NOW(), INTERVAL 2 MONTH) && sushe = ${result[i].sushe} && lynumber = '${lynumber}' ORDER BY date DESC limit 1`);
		var dfDataString = JSON.stringify(df);
		var dfResult = JSON.parse(dfDataString);
		let dfBack;
		// 查询到未缴费情况，返回电费和未缴费0；查询到已缴费，返回已缴费1；未查询到数据，返回没有数据2
		if(dfResult.length>0&&dfResult[0].status==1){
			dfBack={
				id:dfResult[0].key,
				dianfei:dfResult[0].dianfei,
				state:1
			}
		}else if(dfResult.length>0&&dfResult[0].status==0){
			dfBack={
				id:dfResult[0].key,
				dianfei:dfResult[0].dianfei,
				state:0
			}
		}else{
			dfBack={
				dianfei:"无",
				state:2
			}
		}
		// 使用 map() 方法提取每个元素的 name 关键字
		const names = ssryResult.map(item => item.name);
		// 使用 join() 方法将提取的 names 数组以逗号分隔拼接起来
		const concatenatedNames = names.join(', ');
		// ssryResult 就是最后查询到的该楼宇中每个宿舍中的人员信息
		// 将 ssryResult 添加到 result 每个对象中的children 属性中
		result[i].child = ssryResult;
		result[i].members=concatenatedNames;
		result[i].dianfei = dfBack;
	}
	console.log(result);
	if (result.length > 0) {
		let data = {
			code: 200,
			data: result,
			pagetotal: pagetotal
		};
		ctx.body = data;
	} else {
		let data = {
			code: 0
		};
		ctx.body = data;
	}
});

// 向宿舍中添加（分配）学生
router.post('/adduser', async (ctx, next) => {
	var uname = ctx.request.body.uname;
	var lynumber = ctx.request.body.lynumber;
	var sushe = ctx.request.body.sushe;
	// 查询该学号成员是否已存在
	let memberExists = await query(`SELECT * FROM user WHERE uname = '${uname}'`);
	if (memberExists.length > 0) {
		// 检查宿舍是否已满
		let flag=await query(`SELECT isFull,maxsize FROM sushe WHERE lynumber = '${lynumber}' AND sushe='${sushe}'`);
		let isFull=flag[0].isFull;
		let maxSize=flag[0].maxsize;
		if(isFull==0){
			// 成员已存在，且宿舍未满，修改其 lyumber 和 sushe
			let updateMysql = await query(
				`UPDATE user SET lynumber = '${lynumber}', sushe = '${sushe}' WHERE uname = '${uname}'`
			);
			let count=await query(`SELECT COUNT(*) AS count FROM user WHERE lynumber = '${lynumber}' AND sushe='${sushe}'`);
			if(count[0].count==maxSize){
				await query(`UPDATE sushe SET isFull = 1 WHERE lynumber = '${lynumber}' AND sushe='${sushe}'`);
			}
			if (updateMysql.affectedRows == 1) {
				let data = {
					code: 200,
					msg: '成功'
				};
				ctx.body = data;
			} else {
				let data = {
					code: 0,
					msg: '失败'
				};
				ctx.body = data;
			}
		}
	} else {
		// 成员不存在，返回插入失败
		let data = {
			code: 0,
			msg: '插入失败，该学号成员不存在'
		};
		ctx.body = data;
	}
});


// 根据 id 删除学生信息
router.post('/del', async (ctx, next) => {
	var id = ctx.request.body.id;
	var lynumber = ctx.request.body.lynumber;
	var sushe=ctx.request.body.sushe;
	//根据用户id值更新对应学生的状态，用来控制该学生是否被删除
	let a = await query(`update user set sushe = '' where uname = '${id}'`);
	await query(`update sushe set isFull=0 where lynumber='${lynumber}' and sushe='${sushe}'`);
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

// 添加宿舍评分
router.post('/pfAdd', async (ctx, next) => {
	var lynumber = ctx.request.body.lynumber;
	var sushe = ctx.request.body.sushe;
	var date = ctx.request.body.date;
	var beizi = ctx.request.body.beizi;
	var zhuomian = ctx.request.body.zhuomian;
	var xiezi = ctx.request.body.xiezi;
	var dimian = ctx.request.body.dimian;
	var yangtai = ctx.request.body.yangtai;
	var taipen = ctx.request.body.taipen;
	var linyufang = ctx.request.body.linyufang;
	var weishengjian = ctx.request.body.weishengjian;
	var total = parseInt(beizi) + parseInt(zhuomian) + parseInt(xiezi) + parseInt(dimian) + parseInt(yangtai) + parseInt(taipen) + parseInt(linyufang) + parseInt(weishengjian);
	let insertMysql = await query(
		`insert into sspf(lynumber,sushe,time,beizi,zhuomian,xiezi,dimian,yangtai,taipen,linyufang,weishengjian,total) values('${lynumber}','${sushe}','${date}','${beizi}','${zhuomian}','${xiezi}','${dimian}','${yangtai}','${taipen}','${linyufang}','${weishengjian}','${total}')`
	);
	if (insertMysql.affectedRows == 1) {
		// 代表插入成功
		let data = {
			code: 200,
			msg: '插入成功'
		};
		ctx.body = data;
	} else {
		let data = {
			code: 0,
			msg: '插入失败'
		};
		ctx.body = data;
	}
})

// 添加本期电费
router.post('/dfAdd', async (ctx, next) => {
	var lynumber = ctx.request.body.lynumber;
	var sushe = ctx.request.body.sushe;
	var date = ctx.request.body.date;
	var dianfei = ctx.request.body.dianfei;
	let insertMysql = await query(
		`insert into dianfei(lynumber,sushe,date,dianfei) values('${lynumber}','${sushe}','${date}','${dianfei}')`
	);
	if (insertMysql.affectedRows == 1) {
		// 代表插入成功
		let data = {
			code: 200,
			msg: '插入成功'
		};
		ctx.body = data;
	} else {
		let data = {
			code: 0,
			msg: '插入失败'
		};
		ctx.body = data;
	}
})

// 电费状态更新
router.post('/dfConfirm', async (ctx, next) => {
	let id=ctx.request.body.id;
	let sqlResult = await query(
		'UPDATE dianfei SET status = 1 WHERE `key` = ?',id
	);
	if (sqlResult.changedRows == 1) {
		// 代表更新成功
		let data = {
			code: 200,
		};
		ctx.body = data;
	} else {
		let data = {
			code: 0,
		};
		ctx.body = data;
	}
})


module.exports = router
