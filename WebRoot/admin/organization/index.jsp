<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.organization={};
		os.organization.organizationEditAction=false;
		os.organization.serverURL="";
		
		os.organization.addorganization=function (){  
			 os.organization.organizationEditAction=false;
                $('#organizationdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#organizationForm').form('clear');                
                os.organization.serverURL = 'admin/organizationController.do?add';  
		};
	
          
	os.organization.editorganization = function() {
			if ($('#datagridorganization').datagrid('getSelections').length == 1) {
				var row = $('#datagridorganization').datagrid('getSelected');
				if (row) {
					os.organization.organizationEditAction = true;
					os.organization.serverURL = 'admin/organizationController.do?edit&id='
							+ row.id;
					$('#organizationdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#organizationForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#organizationForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.organization.saveorganization = function() {
			$('#organizationForm').form('submit', {
				url : os.organization.serverURL,
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
						$('#organizationdlg').dialog('close'); // close the dialog  
						$('#datagridorganization').datagrid('reload'); // reload the user data 
						$('#datagridorganization').datagrid('unselectAll');
					}
				}
			});
		};

		os.organization.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.organization.destroyorganization = function() {
			var ids = [];
			var rows = $('#datagridorganization').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('admin/organizationController.do?delete', {
							ids : ids.join(',')
						},
								function(result) {
									if (result.success) {
										$('#datagridorganization').datagrid(
												'reload'); // reload the user data  
										$('#datagridorganization').datagrid(
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

		$('#datagridorganization').datagrid({
			url : 'admin/organizationController.do?datagrid',
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
				title : '团队名称',
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
				handler : os.organization.addorganization
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.organization.editorganization
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.organization.destroyorganization
			} ]
		});
	});
</script>

<table id="datagridorganization">
</table>

<div id="organizationdlg" class="easyui-dialog"
	style="width: 360px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-organization-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
	<form id="organizationForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>团队名称:</label></td>
				<td><input class="easyui-validatebox" name="name"></td>
			</tr>
		</table>
	</form>

</div>

<div id="dlg-organization-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok"
		onclick="os.organization.saveorganization()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#organizationdlg').dialog('close')">取消</a>
</div>
