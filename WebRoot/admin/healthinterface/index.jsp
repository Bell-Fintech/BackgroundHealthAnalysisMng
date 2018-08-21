<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.healthInterfacemanage={};
		os.healthInterfacemanage.healthInterfaceEditAction=false;
		os.healthInterfacemanage.serverURL="";
	
		os.healthInterfacemanage.addhealthInterface=function (){  
			 os.healthInterfacemanage.healthInterfaceEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#healthInterfacedlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#healthInterfaceForm').form("clear");
                os.healthInterfacemanage.serverURL = 'healthInterfaceController.do?add';  
		};
	os.healthInterfacemanage.edithealthInterface = function() {

			if ($('#datagridehealthInterface').datagrid('getSelections').length == 1) {

				var row = $('#datagridehealthInterface').datagrid('getSelected');
				if (row) {
					os.healthInterfacemanage.healthInterfaceEditAction = true;
					os.healthInterfacemanage.serverURL = 'healthInterfaceController.do?edit&id='
							+ row.id;
					$('#healthInterfacedlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#healthInterfaceForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#healthInterfaceForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
	 	os.healthInterfacemanage.savehealthInterface = function() {
			$('#healthInterfaceForm').form('submit', {
				url : os.healthInterfacemanage.serverURL,
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
						$('#healthInterfacedlg').dialog('close'); // close the dialog  
						$('#datagridehealthInterface').datagrid('reload'); // reload the user data 
						$('#datagridehealthInterface').datagrid('unselectAll');
					}
				}
			});
		}; 
		os.healthInterfacemanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.healthInterfacemanage.formatStatus = function(val,row){
			if (val == "1") {
				return '正常';
			} else {
				return '停用';
			}
		}
		os.healthInterfacemanage.destoryhealthInterface = function() {
			var ids = [];
			var rows = $('#datagridehealthInterface').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该版本吗?', function(r) {
					if (r) {
						$.post('healthInterfaceController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridehealthInterface').datagrid('reload'); // reload the user data  
								$('#datagridehealthInterface')
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

		$('#datagridehealthInterface').datagrid({
			url : 'healthInterfaceController.do?datagrid',
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
				field : 'interfaceName',
				title : '接口名称',
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
				title : '接口描述',
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
				handler : os.healthInterfacemanage.addhealthInterface
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.healthInterfacemanage.edithealthInterface
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.healthInterfacemanage.destoryhealthInterface
			}]
		});
		
	});
	
	
</script>

<head>
<base href="<%=basePath%>">
</head>
	<table id="datagridehealthInterface">
</table>
<div id="healthInterfacedlg" class="easyui-dialog"
	style="width: 450px; height: 380px; padding: 10px 20px" closed="true"
	buttons="#dlg-healthInterface-buttons" data-options="modal:true">
	<div class="ftitle">接口信息</div>
	<form id="healthInterfaceForm" method="post" enctype="multipart/form-data" >
		<table>
			<tr class="fitem">
				<td><label>接口名称:</label></td>
				<td><input class="easyui-validatebox" name="interfaceName" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>专业名称:</label></td>
				<td><input class="easyui-validatebox" name="abbreviate" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>接口描述:</label></td>
				<td><textarea class="easyui-validatebox" name="description" required="true"></textarea></td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-healthInterface-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.healthInterfacemanage.savehealthInterface()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#healthInterfacedlg').dialog('close')">取消</a>
</div>