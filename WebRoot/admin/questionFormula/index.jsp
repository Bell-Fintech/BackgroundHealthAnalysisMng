<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.questionFormula={};
		os.questionFormula.questionFormulaEditAction=false;
		os.questionFormula.serverURL="";
		
		os.questionFormula.addquestionFormula=function (){  
			 os.questionFormula.questionFormulaEditAction=false;
                $('#questionFormuladlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#questionFormulaForm').form('clear');                
                os.questionFormula.serverURL = 'admin/questionFormulaController.do?add';  
		};
	
          
	os.questionFormula.editquestionFormula = function() {
			if ($('#datagridquestionFormula').datagrid('getSelections').length == 1) {
				var row = $('#datagridquestionFormula').datagrid('getSelected');
				if (row) {
					os.questionFormula.questionFormulaEditAction = true;
					os.questionFormula.serverURL = 'admin/questionFormulaController.do?edit&id='
							+ row.id;
					$('#questionFormuladlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#questionFormulaForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#questionFormulaForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.questionFormula.savequestionFormula = function() {
			$('#questionFormulaForm').form('submit', {
				url : os.questionFormula.serverURL,
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
						$('#questionFormuladlg').dialog('close'); // close the dialog  
						$('#datagridquestionFormula').datagrid('reload'); // reload the user data 
						$('#datagridquestionFormula').datagrid('unselectAll');
					}
				}
			});
		};

		os.questionFormula.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.questionFormula.destroyquestionFormula = function() {
			var ids = [];
			var rows = $('#datagridquestionFormula').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('admin/questionFormulaController.do?delete', {
							ids : ids.join(',')
						},
						function(result) {
							if (result.success) {
								$('#datagridquestionFormula').datagrid(
										'reload'); // reload the user data  
								$('#datagridquestionFormula').datagrid(
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

		$('#datagridquestionFormula').datagrid({
			url : 'admin/questionFormulaController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {},
			sortName : 'formulaKey',
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
				title : 'KEY',
				field : 'formulaKey',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			},{
				title : '值',
				field : 'formulaValue',
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
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.questionFormula.editquestionFormula
			} ]
		});
	});
</script>

<table id="datagridquestionFormula">
</table>

<div id="questionFormuladlg" class="easyui-dialog"
	style="width: 360px; height: 200px; padding: 10px 20px" closed="true"
	buttons="#dlg-questionFormula-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
	<form id="questionFormulaForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>Key:</label></td>
				<td><input class="easyui-validatebox" name="formulaKey" readonly="readonly"></td>
			</tr>
			<tr class="fitem">
				<td><label>值</label></td>
				<td><input class="easyui-validatebox" name="formulaValue"></td>
			</tr>
		</table>
	</form>

</div>

<div id="dlg-questionFormula-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.questionFormula.savequestionFormula()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#questionFormuladlg').dialog('close')">取消</a>
</div>
