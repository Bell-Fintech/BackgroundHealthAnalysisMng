<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.assessmenttypemanage={};
		os.assessmenttypemanage.assessmenttypeEditAction=false;
		os.assessmenttypemanage.serverURL="";
		
		os.assessmenttypemanage.addassessmenttype=function (){  
			 os.assessmenttypemanage.assessmenttypeEditAction=false;
                $('#assessmenttypedlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#assessmenttypeForm').form('clear');                
                os.assessmenttypemanage.serverURL = 'admin/assessmenttypeController.do?add';  
		};
	
          
	os.assessmenttypemanage.editassessmenttype = function() {
			if ($('#datagridassessmenttype').datagrid('getSelections').length == 1) {
				var row = $('#datagridassessmenttype').datagrid('getSelected');
				if (row) {
					os.assessmenttypemanage.assessmenttypeEditAction = true;
					os.assessmenttypemanage.serverURL = 'admin/assessmenttypeController.do?edit&dataId='
							+ row.dataId;
					$('#assessmenttypedlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#assessmenttypeForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#assessmenttypeForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.assessmenttypemanage.saveassessmenttype = function() {
			$('#assessmenttypeForm').form('submit', {
				url : os.assessmenttypemanage.serverURL,
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
						$('#assessmenttypedlg').dialog('close'); // close the dialog  
						$('#datagridassessmenttype').datagrid('reload'); // reload the user data 
						$('#datagridassessmenttype').datagrid('unselectAll');
					}
				}
			});
		};

		os.assessmenttypemanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.assessmenttypemanage.destroyassessmenttype = function() {
			var ids = [];
			var rows = $('#datagridassessmenttype').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].dataId);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('admin/assessmenttypeController.do?del', {
							ids : ids.join(',')
						},
								function(result) {
									if (result.success) {
										$('#datagridassessmenttype').datagrid(
												'reload'); // reload the user data  
										$('#datagridassessmenttype').datagrid(
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
		$('#datagridassessmenttype').datagrid({
			url : 'admin/assessmenttypeController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			idField : 'id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				field : 'dataId',
				checkbox : true
			}, {
				title : '评估项',
				field : 'assessment_item',
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [ {
				field : 'resultNum',
				title : '评估结果数值',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			},{
				field : 'resultString',
				title : '评估结果',
				width : 100,
				formatter : os.assessmenttypemanage.formatStatus,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.assessmenttypemanage.addassessmenttype
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.assessmenttypemanage.editassessmenttype
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.assessmenttypemanage.destroyassessmenttype
			} ]
		});
	});
</script>

<table id="datagridassessmenttype">
</table>

<div id="assessmenttypedlg" class="easyui-dialog"
	style="width: 360px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-assessmenttype-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
	<form id="assessmenttypeForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>评估项:</label></td>
				<td><input class="easyui-validatebox" name="assessment_item" required="true" ></td>
			</tr>
			<tr class="fitem">
				<td><label>评估结果数值:</label></td>
				<td><input class="easyui-validatebox" name="resultNum" required="true" ></td>
			</tr>
			<tr class="fitem">
				<td><label>评估结果:</label></td>
				<td><input class="easyui-validatebox" name="resultString" required="true" ></td>
			</tr>
		</table>
	</form>

</div>

<div id="dlg-assessmenttype-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok"
		onclick="os.assessmenttypemanage.saveassessmenttype()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#assessmenttypedlg').dialog('close')">取消</a>
</div>
