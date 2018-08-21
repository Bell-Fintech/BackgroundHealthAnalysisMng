<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8">
	$(function() {
		$('#userLogdatagrid').datagrid({
			url : 'showUserLogController.do?show',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'time',
			sortOrder : 'desc',
			idField : 'logId',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				title : '行为',
				field : 'active',
				width : 50,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [ {
				field : 'content',
				title : '内容',
				sortable : true,
				width : 50,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'userName',
				title : '用户名',
				sortable : true,
				width : 50,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'loginIp',
				title : '登录IP',
				sortable : true,
				width : 80,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'operationIp',
				title : '操作IP',
				sortable : true,
				width : 80,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'time',
				title : '时间',
				sortable : true,
				width : 100,
				formatter : function(value, row) {
					var unixTimestamp = new Date(value);
					return unixTimestamp.toLocaleString();
				}
			}, {
				field : 'detail',
				title : '详细',
				sortable : true,
				width : 200,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			} ] ],
			toolbar : '#toolbar'
		});

	});
	function initdata() {
		$('#userLogdatagrid').datagrid('load',$.serializeObject($('#userLogForm')));
	}
</script>

<div id="toolbar" style="display: none;">
	<form id="userLogForm">
		<table>
			<tr>
				<td>开始时间</td>
				<td><input class="easyui-datebox" name="startTime"></td>
				<td>结束时间</td>
				<td><input class="easyui-datebox" name="endTime"></td>
				<td>用户名</td>
				<td><input  name="userName"></td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-ok" onclick="initdata()">筛选</a></td>
			</tr>
		</table>
	</form>
</div>

<table id="userLogdatagrid">
</table>

