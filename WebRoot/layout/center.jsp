<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="onesun.hbm.member.*,java.util.*,onesun.util.*,onesun.model.*"%>

<script type="text/javascript" charset="UTF-8">
	$(function() {

		$('#centerTabs').tabs();
		$('#centerTabs').tabs('add', {
			title : '首页',
			content : '<iframe src="homeController.do?portal" frameborder="0" style="border:0;width:100%;height:99.2%;"></iframe>',
			closable : true,
			iconCls : ''
		});

	});
</script>
<div id="centerTabs" border="false" fit="true" style="overflow: hidden;"></div>