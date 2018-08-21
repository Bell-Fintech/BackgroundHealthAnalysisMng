<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.healthindicatormanage={};
		os.healthindicatormanage.healthindicatorEditAction=false;
		os.healthindicatormanage.serverURL="";
	
		os.healthindicatormanage.addhealthindicator=function (){  
			 os.healthindicatormanage.healthindicatorEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#healthindicatordlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#healthindicatorForm').form("clear");
                os.healthindicatormanage.serverURL = 'healthIndicatorController.do?add';  
		};
	os.healthindicatormanage.edithealthindicator = function() {

			if ($('#datagridehealthindicator').datagrid('getSelections').length == 1) {

				var row = $('#datagridehealthindicator').datagrid('getSelected');
				if (row) {
					os.healthindicatormanage.healthindicatorEditAction = true;
					os.healthindicatormanage.serverURL = 'healthIndicatorController.do?edit&id='
							+ row.id;
					$('#healthindicatordlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#healthindicatorForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#healthindicatorForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
	 	os.healthindicatormanage.savehealthindicator = function() {
			$('#healthindicatorForm').form('submit', {
				url : os.healthindicatormanage.serverURL,
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
						$('#healthindicatordlg').dialog('close'); // close the dialog  
						$('#datagridehealthindicator').datagrid('reload'); // reload the user data 
						$('#datagridehealthindicator').datagrid('unselectAll');
					}
				}
			});
		}; 
		os.healthindicatormanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.healthindicatormanage.formatStatus = function(val,row){
			if (val == "1") {
				return '正常';
			} else {
				return '停用';
			}
		}
		os.healthindicatormanage.destoryhealthindicator = function() {
			var ids = [];
			var rows = $('#datagridehealthindicator').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该版本吗?', function(r) {
					if (r) {
						$.post('healthIndicatorController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridehealthindicator').datagrid('reload'); // reload the user data  
								$('#datagridehealthindicator')
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

		$('#datagridehealthindicator').datagrid({
			url : 'healthIndicatorController.do?datagrid',
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
				title : '健康指标',
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
				handler : os.healthindicatormanage.addhealthindicator
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.healthindicatormanage.edithealthindicator
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.healthindicatormanage.destoryhealthindicator
			}]
		});
		
	});
	
	
</script>

<head>
<base href="<%=basePath%>">
</head>
	<table id="datagridehealthindicator">
</table>
<div id="healthindicatordlg" class="easyui-dialog"
	style="width: 450px; height: 380px; padding: 10px 20px" closed="true"
	buttons="#dlg-healthindicator-buttons" data-options="modal:true">
	<div class="ftitle">指标信息</div>
	<form id="healthindicatorForm" method="post" enctype="multipart/form-data" >
		<table>
			<tr class="fitem">
				<td><label>健康指标:</label></td>
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
<div id="dlg-healthindicator-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.healthindicatormanage.savehealthindicator()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#healthindicatordlg').dialog('close')">取消</a>
</div>