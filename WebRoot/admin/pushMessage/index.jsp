<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.pushmessagemanage={};
		os.pushmessagemanage.pushmessageEditAction=false;
		os.pushmessagemanage.serverURL="";
		
		os.pushmessagemanage.addpushmessage=function (){  
			 os.pushmessagemanage.pushmessageEditAction=false;
                $('#pushmessagedlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#pushmessageForm').form('clear');                
                os.pushmessagemanage.serverURL = 'admin/pushMessageController.do?add';  
		};
	
          
	os.pushmessagemanage.editpushmessage = function() {
			if ($('#datagridpushmessage').datagrid('getSelections').length == 1) {
				var row = $('#datagridpushmessage').datagrid('getSelected');
				if (row) {
					os.pushmessagemanage.pushmessageEditAction = true;
					os.pushmessagemanage.serverURL = 'admin/pushMessageController.do?edit&id='
							+ row.id;
					$('#pushmessagedlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#pushmessageForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#pushmessageForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.pushmessagemanage.savepushmessage = function() {
			$('#pushmessageForm').form('submit', {
				url : os.pushmessagemanage.serverURL,
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
						$('#pushmessagedlg').dialog('close'); // close the dialog  
						$('#datagridpushmessage').datagrid('reload'); // reload the user data 
						$('#datagridpushmessage').datagrid('unselectAll');
					}
				}
			});
		};

		os.pushmessagemanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.pushmessagemanage.destroypushmessage = function() {
			var ids = [];
			var rows = $('#datagridpushmessage').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('admin/pushMessageController.do?del', {
							ids : ids.join(',')
						},
								function(result) {
									if (result.success) {
										$('#datagridpushmessage').datagrid(
												'reload'); // reload the user data  
										$('#datagridpushmessage').datagrid(
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
		$('#datagridpushmessage').datagrid({
			url : 'admin/pushMessageController.do?datagrid',
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
				field : 'id',
				checkbox : true
			}, {
				title : '标题',
				field : 'title',
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [ {
				field : 'textValue',
				title : '内容',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			},{
				field : 'createTime',
				title : '创建时间',
				width : 100,
				formatter : os.pushmessagemanage.formatStatus,
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
				handler : os.pushmessagemanage.addpushmessage
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.pushmessagemanage.editpushmessage
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.pushmessagemanage.destroypushmessage
			} ]
		});
	});
</script>

<table id="datagridpushmessage">
</table>

<div id="pushmessagedlg" class="easyui-dialog"
	style="width: 360px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-pushmessage-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
	<form id="pushmessageForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>标题:</label></td>
				<td><input class="easyui-validatebox" name="title" required="true" ></td>
			</tr>
			<tr class="fitem">
				<td><label>内容:</label></td>
				<td>
					<textarea class="easyui-validatebox" name="textValue" required="true" ></textarea>
				</td>
			</tr>
		</table>
	</form>

</div>

<div id="dlg-pushmessage-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok"
		onclick="os.pushmessagemanage.savepushmessage()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#pushmessagedlg').dialog('close')">取消</a>
</div>
