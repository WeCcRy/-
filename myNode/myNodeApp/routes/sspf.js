const router = require('koa-router')()
//引入MySQL数据库
const query = require('./MYSQL');
router.prefix('/sspf');

// 返回宿舍评分搜索按钮的数据
router.post('/search', async (ctx, next) => {
	console.log(ctx.request.body);
	let lynumber = ctx.request.body.lynumber;
	let sushe = ctx.request.body.sushe;
	// 当前页数
	let pagenum = ctx.request.body.pagenum;
	// 当前页每页显示多少条数据
	let pagesize = ctx.request.body.pagesize;
	// 总条数
	let total = '';
	// 起始页索引
	let toppageIndex = (pagenum - 1) * pagesize;
	let a = '';
	let b = '';
	// 宿舍号
	let ssh = '';
	// 被子、桌面、鞋子、地面、阳台、台盆、淋浴房、卫生间
	let beizi="";
	let zhuomian="";
	let xiezi="";
	let dimian="";
	let yangtai="";
	let taipen="";
	let linyufang="";
	let weishengjian="";
	if (lynumber == '' && sushe == '') {
		// 查询总条数 转换为字符串类型
		b = JSON.stringify(await query('SELECT COUNT(*) FROM sspf'));
		console.log(b);
		// 截取字符串，并转化为数字类型，得到总条数
		total = parseInt(b.substring(13, 15));
		//查询数据库
		a = await query('SELECT * FROM sspf ORDER BY time DESC limit ' + toppageIndex + ',' + pagesize + '');
		// 查询宿舍号
		ssh = await query('SELECT sushe FROM sspf limit ' + toppageIndex + ',' + pagesize + '');
	} else {
		// 查询数据库
		a = await query(
			`SELECT * FROM sspf where lynumber = '${lynumber}' or sushe = '${sushe}' ORDER BY time DESC limit ${toppageIndex},${pagesize}`
		);
		b = await query(
			`SELECT * FROM sspf where sushe = '${sushe}' or lynumber = '${lynumber}' ORDER BY time DESC `
		);
		// 格式化 b 的数据类型
		var dataString1 = JSON.stringify(b);
		var result1 = JSON.parse(dataString1);
		console.log(result1);
		// 得到总页数
		total = result1.length;

		// // 查询宿舍号
		ssh = await query(`SELECT sushe FROM sspf where lynumber = '${lynumber}' and sushe = '${sushe}' limit ${toppageIndex},${pagesize}`);
		// // 查询卫生分
		// wsf = await query(`SELECT health FROM sspf where lynumber = '${lynumber}' and sushe = '${sushe}' or xueyuan = '${xueyuan}' and banji = '${banji}' limit ${toppageIndex},${pagesize}`);
		// // 查询纪律分
		// jlf = await query(`SELECT discipline FROM sspf where lynumber = '${lynumber}' and sushe = '${sushe}' or xueyuan = '${xueyuan}' and banji = '${banji}' limit ${toppageIndex},${pagesize}`);
		// // 查询宿舍文化分
		// whf = await query(`SELECT dormitoryculture FROM sspf where lynumber = '${lynumber}' and sushe = '${sushe}' or xueyuan = '${xueyuan}' and banji = '${banji}' limit ${toppageIndex},${pagesize}`);
	}

	// 格式化 a 的数据类型
	var dataString = JSON.stringify(a);
	var result = JSON.parse(dataString);
	// 格式化 ssh 的数据类型
	var dataString2 = JSON.stringify(ssh);
	var sshresult = JSON.parse(dataString2);
	// 转换为数组格式
	let ssharr = [];
	for (var i in sshresult) {
		ssharr.push(parseInt(sshresult[i].sushe))
	 }
	// // 格式化 wsf 的数据类型
	// var dataString3 = JSON.stringify(wsf);
	// var wsfresult = JSON.parse(dataString3);
	//
	// let wsfarr = [];
	// for (var i in wsfresult) {
	// 	wsfarr.push(wsfresult[i].health)
	//  }
	// // 格式化 jlf 的数据类型
	// var dataString4 = JSON.stringify(jlf);
	// var jlfresult = JSON.parse(dataString4);
	//
	// let jlfarr = [];
	// for (var i in jlfresult) {
	// 	jlfarr.push(jlfresult[i].discipline)
	//  }
	// // 格式化 whf 的数据类型
	// var dataString5 = JSON.stringify(whf);
	// var whfresult = JSON.parse(dataString5);
	//
	// let whfarr = [];
	// for (var i in whfresult) {
	// 	whfarr.push(whfresult[i].dormitoryculture)
	//  }
	// 格式化 被子、桌面、鞋子、地面、阳台、台盆、淋浴房、卫生间 的数据类型
	let beiziArr = [];
	let zhuomianArr = [];
	let xieziArr = [];
	let dimianArr = [];
	let yangtaiArr = [];
	let taipenArr = [];
	let linyufangArr = [];
	let weishengjianArr = [];
	for (var i in a) {
		beiziArr.push(a[i].beizi);
		zhuomianArr.push(a[i].zhuomian);
		xieziArr.push(a[i].xiezi);
		dimianArr.push(a[i].dimian);
		yangtaiArr.push(a[i].yangtai);
		taipenArr.push(a[i].taipen);
		linyufangArr.push(a[i].linyufang);
		weishengjianArr.push(a[i].weishengjian);
	 }

	if (result.length > 0) {
		let data = {
			code: 200,
			total: total,
			data: result,
			ssh:ssharr,
			beizi:beiziArr,
			zhuomian:zhuomianArr,
			dimian:dimianArr,
			yangtai:yangtaiArr,
			taipen:taipenArr,
			linyufang:linyufangArr,
			weishengjian:weishengjianArr,
			xiezi:xieziArr
		};
		ctx.body = data;
	} else {
		let data = {
			code: 0
		};
		ctx.body = data;
	}
})




module.exports = router
