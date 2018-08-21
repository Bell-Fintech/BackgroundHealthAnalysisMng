<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.displaymessagemanage={};
		os.displaymessagemanage.displaymessageEditAction=false;
		os.displaymessagemanage.serverURL="";
		
		os.displaymessagemanage.adddisplaymessage=function (){  
			 os.displaymessagemanage.displaymessageEditAction=false;
                $('#displaymessagedlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#displaymessageForm').form('clear');                
                os.displaymessagemanage.serverURL = 'admin/displayMessageController.do?add';  
		};
	
          
	os.displaymessagemanage.editdisplaymessage = function() {
			if ($('#datagriddisplaymessage').datagrid('getSelections').length == 1) {
				var row = $('#datagriddisplaymessage').datagrid('getSelected');
				if (row) {
					os.displaymessagemanage.displaymessageEditAction = true;
					os.displaymessagemanage.serverURL = 'admin/displayMessageController.do?edit&id='
							+ row.id;
					$('#displaymessagedlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#displaymessageForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#displaymessageForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.displaymessagemanage.savedisplaymessage = function() {
			$('#displaymessageForm').form('submit', {
				url : os.displaymessagemanage.serverURL,
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
						$('#displaymessagedlg').dialog('close'); // close the dialog  
						$('#datagriddisplaymessage').datagrid('reload'); // reload the user data 
						$('#datagriddisplaymessage').datagrid('unselectAll');
					}
				}
			});
		};

		os.displaymessagemanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.displaymessagemanage.destroydisplaymessage = function() {
			var ids = [];
			var rows = $('#datagriddisplaymessage').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('admin/displayMessageController.do?delete', {
							ids : ids.join(',')
						},
								function(result) {
									if (result.success) {
										$('#datagriddisplaymessage').datagrid(
												'reload'); // reload the user data  
										$('#datagriddisplaymessage').datagrid(
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
		os.displaymessagemanage.formatStatus = function(val, row) {
			if (val == "0") {
				return '正常';
			} else {
				return '禁用';
			}
		}
		$('#datagriddisplaymessage').datagrid({
			url : 'admin/displayMessageController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {},
			sortName : 'sortnum',
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
				title : '数据来源',
				field : 'title',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [ {
				field : 'status',
				title : '状态',
				sortable : true,
				width : 100,
				formatter : os.displaymessagemanage.formatStatus,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			} ] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.displaymessagemanage.adddisplaymessage
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.displaymessagemanage.editdisplaymessage
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.displaymessagemanage.destroydisplaymessage
			} ]
		});
	});
</script>

<table id="datagriddisplaymessage">
	<!--<div id="toolbar">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="()">添加</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="()">编辑</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="()">删除</a>  
        </div>  
	 -->
</table>

<div id="displaymessagedlg" class="easyui-dialog"
	style="width: 360px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-displaymessage-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
	<form id="displaymessageForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>来源:</label></td>
				<td><input class="easyui-validatebox" name="title" required="true" ></td>
			</tr>
			<tr class="fitem">
				<td><label>状态:</label></td>
				<td>
					<select name="status" class="easyui-combobox" required="true" >
						<option value="0" selected="selected">启用</option>
						<option value="1">禁用</option>
					</select>
<!-- 				<input class="easyui-validatebox" name="status"> -->
				</td>
			</tr>
		</table>
	</form>

</div>

<div id="dlg-displaymessage-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok"
		onclick="os.displaymessagemanage.savedisplaymessage()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#displaymessagedlg').dialog('close')">取消</a>
</div>
