<%@page import="onesun.hbm.base.background.ThirdpartyUser"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page
	import="onesun.hbm.member.*,java.util.*,onesun.util.*,onesun.model.*,javax.servlet.http.HttpSession;"%>
<!DOCTYPE html>
<html>
<head>
<title>健康管理平台 | 第三方机构</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- 优先使用 IE 最新版本和 Chrome -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- 360 使用Google Chrome Frame -->
<meta name="renderer" content="webkit">
<!-- 页面关键词 keywords -->
<meta name="keywords" content="中国联通, 巨东康业, 联通, 联通研究院">
<!-- 页面描述内容 description -->
<meta name="description" content="员工健康管理平台">
<!-- 告知浏览器端缓存机制 -->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<!--  
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery.cookie.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.2.5/themes/gray/easyui.css">
<script type="text/javascript" charset="UTF-8" src="jslib/changeEasyuiTheme.js"></script>
<link rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.2.5/themes/icon.css">
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/locale/easyui-lang-zh_CN.js"></script>
-->


<script type="text/javascript" charset="UTF-8"	src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.min.js"></script>
<!-- <script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.js"></script>-->
<script type="text/javascript" charset="UTF-8"	src="jslib/jquery.cookie.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css"	href="jslib/jquery-easyui-1.3.2/themes/default/easyui.css">
<script type="text/javascript" charset="UTF-8"	src="jslib/changeEasyuiTheme.js"></script>
<link rel="stylesheet" type="text/css"	href="jslib/jquery-easyui-1.3.2/themes/icon.css">
<script type="text/javascript" charset="UTF-8"	src="jslib/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="UTF-8"	src="jslib/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/ajaxfileupload.js"></script>

<!-- HighCharts基础图表 -->
<script type="text/javascript" charset="UTF-8"	src="component/highcharts/highcharts.js"></script>
<script type="text/javascript" charset="UTF-8"	src="component/highcharts/highcharts-3d.js"></script>
<script type="text/javascript" charset="UTF-8"	src="component/highcharts/highcharts-more.js"></script>
<script type="text/javascript" charset="UTF-8"	src="component/highcharts/highcharts-drilldown.js"></script>
<link rel="stylesheet" type="text/css" href="jslib/osCss.css">
<script type="text/javascript" charset="UTF-8" src="jslib/osUtil.js"></script>

<script type="text/javascript" charset="UTF-8">

       $(function() {
    	
    	os.validator = function(value, param) {
    		if(value == param){
    			return true;
    		}else{
    			return false;
    		}
		};
       
    	os.$dengluForm = $('#dengluForm').form();
        os.$dengluDialog = $('#dengluDialog').show().dialog({
            closable : true,
            width : 250,
            height : 140,
            modal : true,
            title : '系统登录',
            buttons : [  {
                text : '登录',
                iconCls : '',
                handler : function() {
                    os.dengluFun();
                }
            },
            {
                text : '注册',
                iconCls : '',
                handler : function() {
                    os.zhuceFun();
                }
            }
             ]
        });
    
        os.dengluFun = function() {
            
            var f = $('#dengluForm');
            var data = {};
            if (f.attr('id') == 'dengluForm') {
                data = f.serialize();
            } else if (f.attr('id') == 'dengluDatagridForm') {
                data = {
                    name : os.$dengluDatagridName.combogrid('getValue'),
                    password : f.find('input[name=password]').val()
                };
            } else if (f.attr('id') == 'dengluComboboxForm') {
                data = {
                    name : os.$dengluComboboxName.combobox('getValue'),
                    password : f.find('input[name=password]').val()
                };
            }
            if (f.form('validate')) {
                $.ajax({
                    url : 'thirdpartyUserController.do?login',
                    data : data,
                    dataType : 'json',
                    success : function(r) {
                        if (r.success) {
                            $.messager.show({
                                title : '提示',
                                msg : r.msg
                            });
                            os.$dengluDialog.dialog('close');
                            window.location.href = '../management/admin/thirdpartyuser/thirdpartyinfo.jsp';
                            //$('#indexLayout').layout('panel', 'center').panel('setTitle', os.fs('[{0}]，欢迎您！[{1}]', r.obj.name, r.obj.ip));
                        } else {
                            $.messager.alert('提示', r.msg, 'error');
                        }
                    }
                });
            }
        };

        os.$dengluDialog.find('[name=name],[name=password]').bind('keyup', function(event) {/* 增加回车提交功能 */
            if (event.keyCode == '13') {
                os.dengluFun();
            }
        });

        os.$registerForm = $('#registerForm').form();
        os.zhuceFun = function (){
        	$("#dengluDialog").dialog('close');
        	os.$registerDialog = $('#registerDialog').show().dialog({
           		title : '用户注册',
           	 	width : 250,
            	modal : true,
            	closed : false,
            	buttons : [ {
                text : '注册',
                iconCls : '',
                handler : function() {
                    os.registerFun();
                }
            } ],
        });
        }
        
        os.registerFun = function() {
            if (os.$registerForm.form('validate')) {
            	if(!os.validator($("#password").val(),$("#rpassword").val())){
            		alert("密码不一致");
            		return;
            	};
                $.ajax({
                    url : 'thirdpartyUserController.do?register',
                    data : os.$registerForm.serialize(),
                    dataType : 'json',
                    success : function(r) {
                        if (r.success) {
                            $.messager.show({
                                title : '提示',
                                msg : r.msg
                            });
                       window.location.href = 'login.jsp';
                        } else {
                            $.messager.alert('提示', r.msg, 'error');
                        }
                    }
                });
            }
        };

        os.$registerForm.find('[name=name],[name=password],[name=rePassword]').bind('keyup', function(event) {/* 增加回车提交功能 */
            if (event.keyCode == '13') {
                os.regFun();
            }
        });
       })

    
</script>
<style type="text/css">
.admin_background {
	background-image: url("img/admin/bg.png");
	background-size: cover;
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( sizingMethod='scale', src='img/admin/bg.png')
}
</style>
</head>
<body class="admin_background">
	<div id="dengluDialog" style="overflow: hidden; display: none;">
	
		<form id="dengluForm">
			<!--  <table class="tableForm">-->
			<table>
				<tr>
					<th style="width: 50px;">登录名</th>
					<td><input name="username" class="easyui-validatebox"
						required="true" /></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input name="password" type="password"
						class="easyui-validatebox" required="true" /></td>
				</tr>
			</table>
		</form>
	</div>
	
		<div id="registerDialog" style="overflow: hidden; display: none;">
		<form id="registerForm">
			<table>
				<tr>
					<th style="width: 50px;">机构名称</th>
					<td><input name="name" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<th style="width: 50px;">登录名</th>
					<td><input name="username" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input id="password" name="password" type="password" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<th>确认密码</th>
					<td><input id="rpassword" name="rpassword" type="password" class="easyui-validatebox" required="true" /></td>
				</tr>
			</table>
		</form>
		</div>
</body>
</html>
