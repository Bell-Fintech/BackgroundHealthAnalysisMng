
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!--
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery.cookie.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.2.5/themes/gray/easyui.css">
<script type="text/javascript" charset="UTF-8" src="jslib/changeEasyuiTheme.js"></script>
<link rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.2.5/themes/icon.css">
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/locale/easyui-lang-zh_CN.js"></script>
 -->

<script type="text/javascript" charset="UTF-8"
	src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="jslib/jquery.cookie.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="jslib/jquery-easyui-1.3.2/themes/default/easyui.css">
<script type="text/javascript" charset="UTF-8"
	src="jslib/changeEasyuiTheme.js"></script>
<link rel="stylesheet" type="text/css"
	href="jslib/jquery-easyui-1.3.2/themes/icon.css">
<script type="text/javascript" charset="UTF-8"
	src="jslib/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="jslib/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>


<link rel="stylesheet" type="text/css"
	href="jslib/jquery-easyui-portal/portal.css">
<script type="text/javascript" charset="UTF-8"
	src="jslib/jquery-easyui-portal/jquery.portal.js"></script>

<link rel="stylesheet" type="text/css" href="jslib/osCss.css">
<script type="text/javascript" charset="UTF-8" src="jslib/osUtil.js"></script>

<script type="text/javascript" charset="UTF-8">
// 	var c0 = '<div style="padding:5px;">中国联通研究院为联通集团总部直属二级单位，主要服务于集团公司内部需求，以满足中国联通战略规划、管理决策和生产运营支撑需要为宗旨，主要从事前沿技术与应用跟踪、发展战略研究、市场和管理策略研究，开展对外合作项目研发，逐步成为核心技术研究、业务产品开发、试验测试和高技术人才培养与储备的综合性基地，同时，作为国家工程实验室承担国家下达的专项研发任务。</div>';
// 	var c1 = '<div style="padding:5px;">财富由你创造，健康由我呵护！</div>';
// 	var c2 = '<div style="padding:5px;">【减肥中必戒的8种美味食品】①巧克力面包；②冰淇淋；③果仁碎；④七彩糖条；⑤朱古力碎；⑥羊肉排；⑦香肠；⑧花生：脂肪含量高，但含的是不饱和脂肪，对身体还是有利的，只要每天不超量，大概二十颗左右就不会胖。</div>';
// 	var c3 = '<div style="padding:5px;">【苹果不为人知的益处】①止泻：只需每日早晚空腹各吃1个苹果即可见效。②通便。③防止频繁呕吐所致的酸中毒。④防治高血压：防治心血管病和肥胖症宜选甜苹果吃。⑤增进食欲，益于婴儿生长。⑥减肥：脂肪过多者，需要吃一些酸苹果。⑦防治贫血。</div>';
// 	var c4 = '<div style="padding:5px;">【电脑族护肤四部曲】1.隔离保湿，每天涂隔离霜，电脑旁放一个保湿的喷雾随时补水。2.每半个小时起来运动五分钟，可改善血液循环使皮肤透亮。3.备一杯胡萝卜汁，常喝抗氧化使肤色红润。4.上网后尽快用温水和洗面奶洗脸。普通隔离霜用洗面奶就足够，不需要用卸妆产品。</div>';
// 	var i = 0;
	$(function() {
		$('#pp').portal({
			border : false,
			fit : true
		});
// 		addPortal(c1);
// 		addPortal(c2);
// 		addPortal(c3);
// 		addPortal(c4);
	});
// 	function addPortal(c) {
// 		var p = $('<div/>').appendTo('body');
// 		p.panel({
// 			content : c,
// 			height : 200,
// 			closable : true,
// 			collapsible : true
// 		});
// 		$('#pp').portal('add', {
// 			panel : p,
// 			columnIndex : i++
// 		});
// 	}
</script>

</head>

<body class="easyui-layout" style="overflow: hidden;">
	<!-- @TODO  -->
	<div region="center" border="false" style="overflow: hidden;" >
		<div id="pp" style="position: relative;" >
			<div style="width: 100%;" >
				<img src ="img/m_portal.jpg" style="max-width:780px;"/>
			</div>
<!-- 			<div style="width: 20%;"></div> -->
<!-- 			<div style="width: 20%;"></div> -->
<!-- 			<div style="width: 20%;"></div> -->
<!-- 			<div style="width: 20%;"></div> -->
		</div>
	</div>
</body>
</html>