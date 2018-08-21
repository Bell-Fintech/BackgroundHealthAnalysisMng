<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.detectionOption={};
		os.detectionOption.detectionOptionEditAction=false;
		os.detectionOption.serverURL="";
		
		os.detectionOption.adddetectionOption=function (){  
			 os.detectionOption.detectionOptionEditAction=false;
                $('#detectionOptiondlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#detectionOptionForm').form('clear');                
                os.detectionOption.serverURL = 'admin/detectionOptionController.do?add';  
		};
          
	os.detectionOption.editdetectionOption = function() {
			if ($('#datagriddetectionOption').datagrid('getSelections').length == 1) {
				var row = $('#datagriddetectionOption').datagrid('getSelected');
				if (row) {
					os.detectionOption.detectionOptionEditAction = true;
					os.detectionOption.serverURL = 'admin/detectionOptionController.do?edit&dataId='
							+ row.dataId;
					$('#detectionOptiondlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#detectionOptionForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#detectionOptionForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.detectionOption.savedetectionOption = function() {
			$('#detectionOptionForm').form('submit', {
				url : os.detectionOption.serverURL,
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
						$('#detectionOptiondlg').dialog('close'); // close the dialog  
						$('#datagriddetectionOption').datagrid('reload'); // reload the user data 
						$('#datagriddetectionOption').datagrid('unselectAll');
					}
				}
			});
		};

		os.detectionOption.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.detectionOption.destroydetectionOption = function() {
			var ids = [];
			var rows = $('#datagriddetectionOption').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('admin/detectionOptionController.do?delete', {
							ids : ids.join(',')
						},
						function(result) {
							if (result.success) {
								$('#datagriddetectionOption').datagrid(
										'reload'); // reload the user data  
								$('#datagriddetectionOption').datagrid(
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

		$('#datagriddetectionOption').datagrid({
			url : 'admin/detectionOptionController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
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
				title : 'KEY',
				field : 'keyRt',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			},{
				title : 'nmlx',
				field : 'nmlx',
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ,{
				title : 'nmln',
				field : 'nmln',
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ,{
				title : 'min',
				field : 'min',
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ,{
				title : 'max',
				field : 'max',
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			toolbar : [ '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.detectionOption.editdetectionOption
			} ]
		});
	});
</script>

<table id="datagriddetectionOption">
</table>

<div id="detectionOptiondlg" class="easyui-dialog"
	style="width: 360px; height: 250px; padding: 10px 20px" closed="true"
	buttons="#dlg-detectionOption-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
	<form id="detectionOptionForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>表示符</label></td>
				<td><input class="easyui-validatebox" name="keyRt" readonly="readonly"></td>
			</tr>
			<tr class="fitem">
				<td><label>正常指标最大值</label></td>
				<td><input class="easyui-validatebox" name="nmlx"></td>
			</tr>
			<tr class="fitem">
				<td><label>正常指标最小值</label></td>
				<td><input class="easyui-validatebox" name="nmln"></td>
			</tr>
			<tr class="fitem">
				<td><label>图表显示的最小值</label></td>
				<td><input class="easyui-validatebox" name="min"></td>
			</tr>
			<tr class="fitem">
				<td><label>图表显示的最大值</label></td>
				<td><input class="easyui-validatebox" name="max"></td>
			</tr>
		</table>
	</form>

</div>

<div id="dlg-detectionOption-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.detectionOption.savedetectionOption()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#detectionOptiondlg').dialog('close')">取消</a>
</div>
