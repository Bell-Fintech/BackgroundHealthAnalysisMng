<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.healthexaminationmanage={};
		os.healthexaminationmanage.healthexaminationEditAction=false;
		os.healthexaminationmanage.serverURL="";
	
		os.healthexaminationmanage.addhealthexamination=function (){  
			 os.healthexaminationmanage.healthexaminationEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#healthexaminationdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#healthexaminationForm').form("clear");
                os.healthexaminationmanage.serverURL = 'healthExaminationController.do?add';  
		};
	os.healthexaminationmanage.edithealthexamination = function() {

			if ($('#datagridehealthexamination').datagrid('getSelections').length == 1) {

				var row = $('#datagridehealthexamination').datagrid('getSelected');
				if (row) {
					os.healthexaminationmanage.healthexaminationEditAction = true;
					os.healthexaminationmanage.serverURL = 'healthExaminationController.do?edit&id='
							+ row.id;
					$('#healthexaminationdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#healthexaminationForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#healthexaminationForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
	 	os.healthexaminationmanage.savehealthexamination = function() {
			$('#healthexaminationForm').form('submit', {
				url : os.healthexaminationmanage.serverURL,
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
						$('#healthexaminationdlg').dialog('close'); // close the dialog  
						$('#datagridehealthexamination').datagrid('reload'); // reload the user data 
						$('#datagridehealthexamination').datagrid('unselectAll');
					}
				}
			});
		}; 
		os.healthexaminationmanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.healthexaminationmanage.formatStatus = function(val,row){
			if (val == "1") {
				return '正常';
			} else {
				return '停用';
			}
		}
		os.healthexaminationmanage.destoryhealthexamination = function() {
			var ids = [];
			var rows = $('#datagridehealthexamination').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该版本吗?', function(r) {
					if (r) {
						$.post('healthExaminationController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridehealthexamination').datagrid('reload'); // reload the user data  
								$('#datagridehealthexamination')
										.datagrid('unselectAll');
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

		$('#datagridehealthexamination').datagrid({
			url : 'healthExaminationController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'id',
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
			} ] ],
			columns : [ [ {
				field : 'indicator',
				title : '体检指标',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'abbreviate',
				title : '专业名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'description',
				title : '指标描述',
				sortable : true,
				width : 100,
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
				handler : os.healthexaminationmanage.addhealthexamination
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.healthexaminationmanage.edithealthexamination
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.healthexaminationmanage.destoryhealthexamination
			}]
		});
		
	});
	
	
</script>

<head>
<base href="<%=basePath%>">
</head>
	<table id="datagridehealthexamination">
</table>
<div id="healthexaminationdlg" class="easyui-dialog"
	style="width: 450px; height: 380px; padding: 10px 20px" closed="true"
	buttons="#dlg-healthexamination-buttons" data-options="modal:true">
	<div class="ftitle">指标信息</div>
	<form id="healthexaminationForm" method="post" enctype="multipart/form-data" >
		<table>
			<tr class="fitem">
				<td><label>体检指标:</label></td>
				<td><input class="easyui-validatebox" name="indicator" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>专业名称:</label></td>
				<td><input class="easyui-validatebox" name="abbreviate" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>指标描述:</label></td>
				<td><textarea class="easyui-validatebox" name="description" required="true"></textarea></td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-healthexamination-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.healthexaminationmanage.savehealthexamination()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#healthexaminationdlg').dialog('close')">取消</a>
</div>