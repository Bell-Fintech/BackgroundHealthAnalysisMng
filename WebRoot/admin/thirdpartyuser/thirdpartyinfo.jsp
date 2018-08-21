<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8"
	src="../../jslib/jquery-easyui-1.3.2/jquery-1.8.0.min.js"></script>
<!-- <script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.js"></script> -->
<script type="text/javascript" charset="UTF-8"
	src="../../jslib/jquery.cookie.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="../../jslib/jquery-easyui-1.3.2/themes/default/easyui.css">
<script type="text/javascript" charset="UTF-8"
	src="../../jslib/changeEasyuiTheme.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../jslib/jquery-easyui-1.3.2/themes/icon.css">
<script type="text/javascript" charset="UTF-8"
	src="../../jslib/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="../../jslib/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="UTF-8" src="../../jslib/ajaxfileupload.js"></script>

<!-- HighCharts基础图表 -->
<!-- <script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts-3d.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts-more.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts-drilldown.js"></script>
<link rel="stylesheet" type="text/css" href="jslib/osCss.css">
<script type="text/javascript" charset="UTF-8" src="jslib/osUtil.js"></script> -->
<script type="text/javascript" charset="UTF-8">  
	$(function() {
		
		$('#userinfo').datagrid({
			url : 'thirdpartyUserController.do?userinfo',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'id',
			sortOrder : 'desc',
			idField : 'id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				field : 'id',
				checkbox : true
			} ] ],
			columns : [ [ {
				field : 'name',
				title : '第三方机构名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'username',
				title : '用户名',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'password',
				title : '密码',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'token',
				title : '令牌',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'healthExamination',
				title : '体检指标',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'healthIndicator',
				title : '健康指标',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'interfaceName',
				title : '接口',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			} ] ],
		});
		
	});

	
	
</script>

<head>
<base href="<%=basePath%>">
</head>
	<table id="userinfo">
	</table>
