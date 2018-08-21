<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.department={};
		os.department.departmentEditAction=false;
		os.department.serverURL="";
		
		os.department.adddepartment=function (){  
			 os.department.departmentEditAction=false;
                $('#departmentdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#departmentForm').form('clear');                
                os.department.serverURL = 'admin/departmentController.do?add';  
		};
	
          
	os.department.editdepartment = function() {
			if ($('#datagriddepartment').datagrid('getSelections').length == 1) {
				var row = $('#datagriddepartment').datagrid('getSelected');
				if (row) {
					os.department.departmentEditAction = true;
					os.department.serverURL = 'admin/departmentController.do?edit&id='
							+ row.id;
					$('#departmentdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#departmentForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#departmentForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.department.savedepartment = function() {
			$('#departmentForm').form('submit', {
				url : os.department.serverURL,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.errorMsg) {
						$.messager.show({
							title : 'Error',
							msg : result.errorMsg
						});
					} else {
						$('#departmentdlg').dialog('close'); // close the dialog  
						$('#datagriddepartment').datagrid('reload'); // reload the user data 
						$('#datagriddepartment').datagrid('unselectAll');
					}
				}
			});
		};

		os.department.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.department.destroydepartment = function() {
			var ids = [];
			var rows = $('#datagriddepartment').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('admin/departmentController.do?delete', {
							ids : ids.join(',')
						},
								function(result) {
									if (result.success) {
										$('#datagriddepartment').datagrid(
												'reload'); // reload the user data  
										$('#datagriddepartment').datagrid(
												'unselectAll');
									} else {

										$.messager.show({ // show error message  
											title : 'Error',
											msg : result.msg
										});
									}
								}, 'json');
					}
				});
			}
		};

		$('#datagriddepartment').datagrid({
			url : 'admin/departmentController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {},
			sortName : 'name',
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
			}, {
				title : '部门名称',
				field : 'name',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			}, {
				title : '创建时间',
				field : 'createTime',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.department.adddepartment
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.department.editdepartment
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.department.destroydepartment
			} ]
		});
	});
</script>

<table id="datagriddepartment">
</table>

<div id="departmentdlg" class="easyui-dialog"
	style="width: 360px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-department-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
	<form id="departmentForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>部门名称:</label></td>
				<td><input class="easyui-validatebox" name="name"></td>
			</tr>
		</table>
	</form>

</div>

<div id="dlg-department-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok"
		onclick="os.department.savedepartment()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#departmentdlg').dialog('close')">取消</a>
</div>
