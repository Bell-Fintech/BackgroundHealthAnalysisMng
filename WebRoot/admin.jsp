<%@ page language="java" pageEncoding="UTF-8"%>
<%@page
	import="onesun.hbm.member.*,java.util.*,onesun.util.*,onesun.model.*"%>
<!DOCTYPE html>
<html>
<head>
<title>健康管理平台 | 管理员</title>
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


<script type="text/javascript" charset="UTF-8"
	src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.min.js"></script>
<!-- <script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.js"></script>-->
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
<script type="text/javascript" charset="UTF-8" src="jslib/ajaxfileupload.js"></script>

<!-- HighCharts基础图表 -->
<script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts-3d.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts-more.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="component/highcharts/highcharts-drilldown.js"></script>
<link rel="stylesheet" type="text/css" href="jslib/osCss.css">
<script type="text/javascript" charset="UTF-8" src="jslib/osUtil.js"></script>
<script type="text/javascript">
<%	
	String currentuserid="";
	String MyRealName="";
	String MyCurrentThemePath="";
	String ThemesInSystem="";
	boolean AlreadyLogin=false;
	int NeedReLoginErrorCode=500;
	
	String MyCurrentThemeName="default";
	SessionInfo userSession=(SessionInfo)request.getSession().getAttribute(ResourceUtil.getSessionUser());
	if(userSession!=null && userSession.getUser() != null)
	{
		AlreadyLogin=true;
		currentuserid=userSession.getUser().getId();
		MyRealName=userSession.getUser().getName();
	}
	response.setHeader("Cache-Control","no-store"); 
	response.setHeader("Pragrma","no-cache"); 
	response.setDateHeader("Expires",0);
	
%>
var rootsid="";
var loginid="";
var _gMyCurrentThemeName;
var _gAlreadyLogin=<%=AlreadyLogin %>;
var _gNeedReLoginErrorCode = <%=NeedReLoginErrorCode %>;
var _gMyCurrentThemePath;
function loadConfigs() {
  
    rootsid="main";
    loginid="<%= currentuserid %>";
    _gMyCurrentThemeName="<%=MyCurrentThemeName %>";
    _gMyRealName="<%=MyRealName %>";
    _gMyCurrentThemePath="<%=MyCurrentThemePath%>";
}

</script>
<script type="text/javascript" charset="UTF-8">

    
    if(!_gAlreadyLogin)
    {
       $(function() {

        $('#gWindow').window('close');   
        $('#gWindowShenPi').window('close');   
        os.$loginInputForm = $('#loginInputForm').form();
        os.$loginDialog = $('#loginDialog').show().dialog({
            closable : true,
            width : 250,
            height : 140,
            modal : true,
            title : '系统登录',
            buttons : [  {
                text : '登录',
                iconCls : '',
                handler : function() {
                    os.loginFun();
                }
            },
            {
                text : '复位',
                iconCls : '',
                handler : function() {
                    os.$loginInputForm[0].reset();
                }
            }
             ],
            onOpen : function() {
                window.setTimeout(function() {
                    os.$loginDialog.find('input[name=password]').val('');
                    os.$loginInputForm.find('input[name=name]').focus();
                }, 500);
            }
        });
    
        os.loginFun = function() {
            
            var f = $('#loginInputForm');
            var data = {};
            if (f.attr('id') == 'loginInputForm') {
                data = f.serialize();
            } else if (f.attr('id') == 'loginDatagridForm') {
                data = {
                    name : os.$loginDatagridName.combogrid('getValue'),
                    password : f.find('input[name=password]').val()
                };
            } else if (f.attr('id') == 'loginComboboxForm') {
                data = {
                    name : os.$loginComboboxName.combobox('getValue'),
                    password : f.find('input[name=password]').val()
                };
            }
            if (f.form('validate')) {
                $.ajax({
                    url : 'memberController.do?login',
                    data : data,
                    dataType : 'json',
                    success : function(r) {
                        if (r.success) {
                            $.messager.show({
                                title : '提示',
                                msg : r.msg
                            });
                            os.$loginDialog.dialog('close');
                             window.location.href = 'admin.jsp';
                            //$('#indexLayout').layout('panel', 'center').panel('setTitle', os.fs('[{0}]，欢迎您！[{1}]', r.obj.name, r.obj.ip));
                        } else {
                            $.messager.alert('提示', r.msg, 'error');
                        }
                    }
                });
            }
        };

        os.$loginDialog.find('[name=name],[name=password]').bind('keyup', function(event) {/* 增加回车提交功能 */
            if (event.keyCode == '13') {
                os.loginFun();
            }
        });

    });
    }
</script>

<script type="text/javascript" charset="UTF-8">
    $(function() {
     $(document).ajaxError(function (e, xhr, settings, exception) {
//             console.log(xhr.status);
            if(xhr.status==577){
                 window.location.href = './';
            }
      });
    
    $('#gWindow').window('close');   
    $('#gWindowShenPi').window('close');   
         $('#mymainmenu').tree({
         url:"mainMenuController.do?datagrid",
         onLoadError:function(arg){
            if(arg.status==577){
                 window.location.href = './';
            }
         },
         onClick: function(node){
        //if($('#mymainmenu').tree("isLeaf",node))
        if(node.state==undefined)
        {
            //alert(node.text);  // alert node text property when clicked
            if(node.attributes.funType==2)
            {
                  //alert("Window Test!");
                      $('#gWindow').window({ 
                      title: node.text,
                     // width:320,  
                      //height:200,
                      //fit:true, 
                      iconCls:node.iconCls,
                      modal:true,
                      maximizable:false,
                      minimizable:false  
                     });  
                    $('#gWindow').window('refresh', node.attributes.funName);  
                    //$('#gWindow').window('open');  // open a window  
                    return ;
            }
            else
            {
                    os.addTabFun({
                    title : node.text,
                    iconCls:node.iconCls,
                    src : node.attributes.funName,
                    funType:node.attributes.funType
            });
            }
            }       
        }
    });
    os.addTabFun = function(opts) {
            var t = '#centerTabs';
            $.messager.progress({
                text : '页面加载中....',
                interval : 100
            });
            
            var options;
            if(opts.funType==1)
            {
                 options = $.extend({
                    title : '',
                    content : '<iframe src="' + opts.src + '" frameborder="0" style="border:0;width:100%;height:99.2%;"></iframe>',
                    closable : true,
                        iconCls : ''
                    }, opts);
            }
            else
            {
              //alert("href ?????????????????");
                options = $.extend({
                title : '',
                href :opts.src ,
                closable : true,
                iconCls : ''
                }, opts);
            }
            
            if ($(t).tabs('exists', options.title)) {
                $(t).tabs('close', options.title);
            }
            $(t).tabs('add', options);
        };
        
        os.$regForm = $('#regForm').form();
        os.$regDialog = $('#regDialog').show().dialog({
            title : '用户注册',
            width : 250,
            modal : true,
            closed : true,
            buttons : [ {
                text : '注册',
                iconCls : '',
                handler : function() {
                    os.regFun();
                }
            } ],
            onOpen : function() {
                window.setTimeout(function() {
                    os.$regForm.find('input[name=name]').focus();
                    os.$regForm.find('input').val('');
                }, 1);
            }
        });

        os.regFun = function() {
            if (os.$regForm.form('validate')) {
                $.ajax({
                    url : 'userController.do?reg',
                    data : os.$regForm.serialize(),
                    dataType : 'json',
                    success : function(r) {
                        if (r.success) {
                            $.messager.show({
                                title : '提示',
                                msg : r.msg
                            });
                            os.$regDialog.dialog('close');
                        } else {
                            $.messager.alert('提示', r.msg, 'error');
                        }
                    }
                });
            }
        };

        os.$regForm.find('[name=name],[name=password],[name=rePassword]').bind('keyup', function(event) {/* 增加回车提交功能 */
            if (event.keyCode == '13') {
                os.regFun();
            }
        });

    });
</script>

<script type="text/javascript" charset="UTF-8">
    $(function() {
    });
</script>
<style type="text/css">
.admin_background {
	background-image: url("img/admin/bg.png");
	background-size: cover;
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader( sizingMethod='scale', src='img/admin/bg.png')
}
</style>
</head>
<% if(AlreadyLogin) { %>
<body id="indexLayout" class="easyui-layout">
	<div href="layout/north.jsp" region="north"
		style="height: 50px; overflow: hidden;"></div>
	<div href="layout/south.html" region="south"
		style="height: 20px; overflow: hidden;"></div>
	<div region="west" split="true" title="导航"
		style="width: 200px; overflow: hidden;">
		<div class="easyui-accordion" fit="true" style="overflow: hidden;">
			<!--  <div title="菜单" href="layout/menu.jsp" style="overflow: hidden;"></div>-->
			<div title="系统功能" style="overflow: hidden;">
				<!--   <ul id="mymainmenu" class="easyui-tree"  
            url="mainMenuController.do?datagrid">
       -->
				<ul id="mymainmenu">
				</ul>
			</div>
<!-- 			<div title="示例" href="test/easyuidemo.html" style="overflow: hidden;"></div> -->
		</div>
	</div>
	<div href="layout/center.jsp" region="center" style="overflow: hidden;"></div>
	<% } else{%>

<body class="admin_background">
	<%  } %>
	<div id="loginDialog" style="overflow: hidden; display: none;">

		<form id="loginInputForm">
			<!--  <table class="tableForm">-->
			<table>
				<tr>
					<th style="width: 50px;">登录名</th>
					<td><input name="name" class="easyui-validatebox"
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
	<div id="gWindow" class="easyui-window"
		data-options="inline:true,iconCls:'icon-save',modal:true,maximizable:false,minimizable:false"
		style="width: 600px; height: 400px;"></div>
	<div id="gWindowShenPi" class="easyui-window autosize"
		data-options="inline:true,iconCls:'icon-save',modal:true,maximizable:false,minimizable:false">

	</div>
</body>
</html>
