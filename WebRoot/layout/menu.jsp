
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="onesun.hbm.member.*,java.util.*,onesun.util.*,onesun.model.*"%>
<script type="text/javascript" charset="UTF-8">
	$(function() {

		$.fn.zTree.init($('#menuTree'), {
			data : {
				simpleData : {
					enable : true
				}
			},
			callback : {
				onClick : function(event, treeId, treeNode, clickFlag) {
					sy.addTabFun({
						title : treeNode.name,
						src : treeNode.page
					});
				}
			}
		}, [ {
			id : 1,
			pId : 0,
			name : '首页',
			open : true,
			page : 'homeController.do?portal'
		}, {
			pId : 1,
			name : '用户管理',
			page : 'userController.do?user'
		}, {
			pId : 1,
			name : '角色管理',
			page : 'roleController.do?role'
		}, {
			pId : 1,
			name : '资源管理',
			page : 'resourceController.do?resource'
		}, {
			pId : 1,
			name : '首页管理',
			page : 'homeController.do?home'
		}]);

	});
</script>
<div class="easyui-panel" fit="true" border="false">
	<ul id="menuTree" class="ztree"></ul>
</div>