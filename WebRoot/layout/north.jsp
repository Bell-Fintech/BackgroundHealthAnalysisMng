<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="onesun.hbm.member.*,java.util.*,onesun.util.*,onesun.model.*"%>
<script type="text/javascript" charset="UTF-8">
	$(function() {
		os.logoutFun = function(b) {
			$.post('memberController.do?logout', function() {
// 				if (b) {
// 					location.replace(os.bp());
// 				} else {
// 					sy.$loginDialog.dialog('open');
// 					location.replace(os.bp());
// 				}
				// TODO 这里的逻辑还需要优化
				location = "${pageContext.request.contextPath}/admin.jsp";
			});
		};

	});
</script>
<%
	String MyRealName="";
	SessionInfo userSession=(SessionInfo)request.getSession().getAttribute(ResourceUtil.getSessionUser());
	if(userSession!=null)
	{
		MyRealName=userSession.getUser().getName();		
	}
%>
<div >
<div style="position: absolute; left: 20px; bottom: 10px; "><img src="img/ucare_logo.jpg" height="30px" width="50px"/><span style="font-size: 20px; font-weight :bold;">UCARE业务支撑平台</span></div>
<div style="position: absolute; right: 0px; bottom: 0px; ">
<a href="javascript:void(0)" class="easyui-linkbutton" plain="true">当前用户：<%= MyRealName%></a><a href="javascript:void(0)" class="easyui-menubutton" menu="#layout_north_kzmbMenu" iconCls="icon-edit">控制面板</a><a href="javascript:void(0)" class="easyui-menubutton" menu="#layout_north_zxMenu" iconCls="icon-help">注销</a></div>
</div>
<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
<!-- 	<div onclick="os.addTabFun({title:'个人信息',src:'memberController.do?memberinfo',funType:0});">个人信息</div> -->
<!-- 	<div class="menu-sep"></div> -->
	<div>
		<span>更换主题</span>
		<div style="width: 100px;">
			<div onclick="changeThemeFun('default');">蓝色</div>
			<div onclick="changeThemeFun('gray');">灰色</div>
			<div onclick="changeThemeFun('black');">黑色</div>
		</div>
	</div>
</div>
<div id="layout_north_zxMenu" style="width: 100px; display: none;">
<!-- 	<div onclick="os.logoutFun();">锁定窗口</div> -->
<!-- 	<div class="menu-sep"></div> -->
<!-- 	<div onclick="os.logoutFun();">重新登录</div> -->
	<div onclick="os.logoutFun(true);">退出系统</div>
</div>