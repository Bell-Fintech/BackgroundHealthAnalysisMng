<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.versionmanage={};
		os.versionmanage.versionEditAction=false;
		os.versionmanage.serverURL="";
	
		os.versionmanage.addversion=function (){  
			 os.versionmanage.versionEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#versiondlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#versionForm').form("clear");
                os.versionmanage.serverURL = 'versionController.do?add';  
		};
	os.versionmanage.editversion = function() {

			if ($('#datagrideversion').datagrid('getSelections').length == 1) {

				var row = $('#datagrideversion').datagrid('getSelected');
				if (row) {
					os.versionmanage.versionEditAction = true;
					os.versionmanage.serverURL = 'versionController.do?edit&id='
							+ row.id;
					$('#versiondlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#versionForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#versionForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
	 	os.versionmanage.saveversion = function() {
			$('#versionForm').form('submit', {
				url : os.versionmanage.serverURL,
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
						$('#versiondlg').dialog('close'); // close the dialog  
						$('#datagrideversion').datagrid('reload'); // reload the user data 
						$('#datagrideversion').datagrid('unselectAll');
					}
				}
			});
		}; 
		os.versionmanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.versionmanage.formatStatus = function(val,row){
			if (val == "1") {
				return '正常';
			} else {
				return '停用';
			}
		}
		os.versionmanage.destoryversion = function() {
			var ids = [];
			var rows = $('#datagrideversion').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该版本吗?', function(r) {
					if (r) {
						$.post('versionController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagrideversion').datagrid('reload'); // reload the user data  
								$('#datagrideversion')
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

		$('#datagrideversion').datagrid({
			url : 'versionController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'version',
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
				title : '版本号',
				field : 'version',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [{
				field : 'appName',
				title : 'APP名字',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'apkName',
				title : 'APK名字',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'appTag',
				title : 'APP版本',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},
			{
				field : 'channel',
				title : '频道',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, 
			{
				field : 'downloadURL',
				title : '下载地址',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},
           {
				field : 'description',
				title : '版本描述',
				sortable : true,
				width : 100,
                editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
           },
			{
				field : 'available',
				title : '版本状态',
				sortable : true,
				width : 100,
				formatter : os.versionmanage.formatStatus
			} ] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.versionmanage.addversion
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.versionmanage.editversion
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.versionmanage.destoryversion
			}]
		});
		
	});
	
	
</script>

<head>
<base href="<%=basePath%>">
</head>
	<table id="datagrideversion">
</table>
<div id="versiondlg" class="easyui-dialog"
	style="width: 450px; height: 380px; padding: 10px 20px" closed="true"
	buttons="#dlg-version-buttons" data-options="modal:true">
	<div class="ftitle">版本信息</div>
	<form id="versionForm" method="post" enctype="multipart/form-data" >
		<table>
			<tr class="fitem">
				<td><label>APP名称:</label></td>
				<td><input class="easyui-validatebox" name="appName" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>APK名称:</label></td>
				<td><input class="easyui-filebox" id="img" name="imgs" type="file" /></td>
			</tr>
			<tr class="fitem">
				<td><label>APP版本:</label></td>
				<td><input class="easyui-validatebox" name="appTag" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>频道:</label></td>
				<td><input class="easyui-validatebox" name="channel" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>版本号:</label></td>
				<td><input class="easyui-validatebox" name="version" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>版本描述:</label></td>
				<td><textarea class="easyui-validatebox" name="description" ></textarea></td>
			</tr>
			<tr class="fitem">
				<td><label>地址:</label></td>
				<td><textarea class="easyui-validatebox" name="downloadURL" ></textarea></td>
			</tr>
				<tr class="fitem">
				<td><label>版本状态:</label></td>
				<td><select class="easyui-combobox" name="available" required="true"><option
							value="1">正常</option>
						<option value="0">停用</option>
				</select></td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-version-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.versionmanage.saveversion()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#versiondlg').dialog('close')">取消</a>
</div>

