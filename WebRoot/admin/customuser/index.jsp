<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8">
	$(function() {
		os.customuser = {};
		os.customuser.customuserUserEditAction = false;
		os.customuser.serverURL = "";
		os.customuser.savedepartment = function(){
			var ids = [];
			var rows = $('#datagridcustomuser').datagrid('getSelections');
			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.post('admin/memberCustomUserController.do?department', {
					ids : ids.join(','),
					departmentid : $('#departmentCombobox').combobox('getValue')
				}, function(result) {
					if (result.success) {
						$('#departmentDlg').dialog('close');
						$('#datagridcustomuser').datagrid('reload'); // reload the user data  
						$('#datagridcustomuser').datagrid('unselectAll');
						$.messager.show({ // show error message  
							title : '操作成功',
							msg : "保存分组成功"
						});
					} else {
						$.messager.show({ // show error message  
							title : 'Error',
							msg : result.msg
						});
					}
				}, 'json');
				
			}
		}
		os.customuser.loaddepartment = function(){
			var rows = $('#datagridcustomuser').datagrid('getSelections');
			if (rows.length > 0) {
				 $.ajax({
		              	url:'admin/departmentController.do?list',  
		           	    type:"post",
		           	    datatype:"json",
		           	    success:function(d){
		           	    	if(d.success){
		           	    		$('#departmentCombobox').combobox({ 
		                 	    	data:d.obj,
		                 	    	panelWidth:'auto',
		                 	    	valueField:'id',  
		                            textField:'name'
		                         });
		               	    	$('#departmentDlg').dialog('open').dialog('setTitle','部门分配');
		           	    	}else{
		           	    		$.messager.show({ // show error message  
									title : 'Error',
									msg : '获取参数失败'
								});
		           	    	}
		           	    	
		           	    }
		        	 }); 
			}else{
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
			
		};
		
		os.customuser.saveorganization = function(){
			var ids = [];
			var rows = $('#datagridcustomuser').datagrid('getSelections');
			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.post('admin/memberCustomUserController.do?organization', {
					ids : ids.join(','),
					organizationid : $('#organizationCombobox').combobox('getValue')
				}, function(result) {
					if (result.success) {
						$('#organizationDlg').dialog('close');
						$('#datagridcustomuser').datagrid('reload'); // reload the user data  
						$('#datagridcustomuser').datagrid('unselectAll');
						$.messager.show({ // show error message  
							title : '操作成功',
							msg : "保存分组成功"
						});
					} else {
						$.messager.show({ // show error message  
							title : 'Error',
							msg : result.msg
						});
					}
				}, 'json');
				
			}
		}
		os.customuser.loadorganization = function(){
			var rows = $('#datagridcustomuser').datagrid('getSelections');
			if (rows.length > 0) {
				 $.ajax({
		              	url:'admin/organizationController.do?list',  
		           	    type:"post",
		           	    datatype:"json",
		           	    success:function(d){
		           	    	if(d.success){
		           	    		$('#organizationCombobox').combobox({ 
		                 	    	data:d.obj,
		                 	    	panelWidth:'auto',
		                 	    	valueField:'id',  
		                            textField:'name'
		                         });
		               	    	$('#organizationDlg').dialog('open').dialog('setTitle','团队组建');
		           	    	}else{
		           	    		$.messager.show({ // show error message  
									title : 'Error',
									msg : '获取参数失败'
								});
		           	    	}
		           	    	
		           	    }
		        	 }); 
			}else{
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
			
		};
		
		
		$.extend($.fn.validatebox.defaults.rules,
						{
							equals : {
								validator : function(value, param) {
									return value == $(param[0]).val();
								},
								message : '两次密码不一致。'
							},
							checkNameRepeat : {
								validator : function(value, param) {
									//        		 alert("checkNameRepeat");

									if (os.customuser.customuserUserEditAction)
										return true;
									var exits = $
											.ajax({
												url : 'admin/memberCustomUserController.do?checkName&name='
														+ value,
												async : false
											}).responseText;
									if (exits == 'true')
										return true;
									else
										return false;
								},
								message : '用户名已存在。'
							}
						});
		os.customuser.addcustomuser = function() {
			os.customuser.customuserUserEditAction = false;
			//$('#customuserForm>input[name=name]').attr("readonly","") ;  
			$('#customUserNameID').removeAttr("readonly");
			$('#customuserdlg').dialog({
				iconCls : 'icon-add'
			}).dialog('open').dialog('setTitle', '添加');
			$('#customuserForm').form('clear');
			os.customuser.serverURL = 'admin/memberCustomUserController.do?add';
		};

		os.customuser.editcustomuser = function() {

			if ($('#datagridcustomuser').datagrid('getSelections').length == 1) {

				var row = $('#datagridcustomuser').datagrid('getSelected');
				//                 $('#customUserNameID').attr("readonly","readonly");      
				if (row) {
					os.customuser.customuserUserEditAction = true;
					os.customuser.serverURL = 'admin/memberCustomUserController.do?edit&id='
							+ row.id;
					$('#customuserdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#customuserForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#customuserForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.customuser.savecustomuser = function() {
			$('#customuserForm').form('submit', {
				url : os.customuser.serverURL,
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
						$('#customuserdlg').dialog('close'); // close the dialog  
						$('#datagridcustomuser').datagrid('reload'); // reload the user data 
						$('#datagridcustomuser').datagrid('unselectAll');
					}
				}
			});
		};

		os.customuser.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.customuser.formatSex = function(val, row) {
			if (val == 1) {
				return '男';
			} else if(val == 0){
				return '女';
			}else if(val=='z'){
				return '保密';
			}else{
				return '未知';
			}
		};
		os.customuser.formatRemarks = function(val, row) {
			if (val == "0") {
				return '正常';
			} else {
				return '禁用';
			}
		}
		os.customuser.formatDepartMent = function(val, row) {
			
		}
		os.customuser.destroycustomuser = function() {
			var ids = [];
			var rows = $('#datagridcustomuser').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该用户吗?', function(r) {
					if (r) {
						$.post('admin/memberCustomUserController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridcustomuser').datagrid('reload'); // reload the user data  
								$('#datagridcustomuser')
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

		os.customuser.changPassword = function() {
			var row = $('#datagridcustomuser').datagrid('getSelected');
			if (row) {
				os.customuser.serverURL = 'admin/memberCustomUserController.do?changePassword&id='
						+ row.id;
				$('#customuser_changPasswordForm').form('clear');
				$('#customuser_customuserChangPasswordDlg').dialog('open')
						.dialog('setTitle', '修改密码');
			}
		};

		os.customuser.disableRemarks = function() {
			var ids = [];
			var rows = $('#datagridcustomuser').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm(
								'确认',
								'确实要禁用该用户吗?',
								function(r) {
									if (r) {
										$.post('admin/memberCustomUserController.do?disableRemarks',
														{
															userIds : ids
																	.join(',')
														},
														function(result) {
															if (result.success) {
																$('#datagridcustomuser').datagrid('reload'); // reload the user data  
																$('#datagridcustomuser')
																		.datagrid(
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
		os.customuser.recoveryRemarks = function() {
			var ids = [];
			var rows = $('#datagridcustomuser').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm(
								'确认',
								'确实要恢复该用户吗?',
								function(r) {
									if (r) {
										$.post(
														'admin/memberCustomUserController.do?recoveryRemarks',
														{
															ids : ids.join(',')
														},
														function(result) {
															if (result.success) {
																$('#datagridcustomuser').datagrid('reload'); // reload the user data  
																$('#datagridcustomuser').datagrid('unselectAll');
															} else {

																$.messager
																		.show({ // show error message  
																			title : 'Error',
																			msg : result.msg
																		});
															}
														}, 'json');
									}
								});
			}
		};
		os.customuser.savePassword = function() {
			$('#customuser_changPasswordForm').form(
					'submit',
					{
						url : os.customuser.serverURL,
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
								$('#customuser_customuserChangPasswordDlg')
										.dialog('close'); // close the dialog  
								$('#datagridcustomuser')
										.datagrid('unselectAll');
							}
						}
					});
		};
		os.customuser.beforeRole = function() {
			var rows = $('#datagridcustomuser').datagrid('getSelections');
			var row = $('#datagridcustomuser').datagrid('getSelected');
			if (rows.length > 0) {
				$('#memberDispatchRoleDlg').dialog('open').dialog('setTitle',
						'角色分配');
				if (rows.length > 1) {
					$('#memberDispatchRoleTree').tree(
									{
										checkbox : true,
										url : 'admin/memberCustomUserController.do?getManyDispatch'
									});
				} else {
					$('#memberDispatchRoleTree').tree(
									{
										checkbox : true,
										url : 'admin/memberCustomUserController.do?getDispatch&id='
												+ row.id
									});
				}
			}
		};
		os.customuser.saveCustomUserRole = function() {
			var ids = [];
			var userIds = [];
			var rows = $('#datagridcustomuser').datagrid('getSelections');

			if (rows.length > 0) {
				for (var j = 0; j < rows.length; j++) {
					userIds.push(rows[j].id);
				}
				os.customuser.serverURL = 'admin/memberCustomUserController.do?saveMemberDispatchRole';
				var nodes = $('#memberDispatchRoleTree').tree('getChecked');
				for (var i = 0; i < nodes.length; i++) {
					ids.push(nodes[i].id);
				}
				$.ajax({
					type : 'POST',
					url : os.customuser.serverURL,
					data : {
						id : userIds.join(","),
						rids : ids.join(",")
					},
					success : function(res) {
						$('#memberDispatchRoleDlg').dialog('close'); // close the dialog  
						$('#datagridcustomuser').datagrid('unselectAll');
					},
					dataType : 'json'
				});
			}
			//alert(ids.join(","));
		};
		os.customuser.search =  function(){
			$('#datagridcustomuser').datagrid("load",{"name":$("#searchBox").val()});
		}
		$('#datagridcustomuser').datagrid({
			url : 'admin/memberCustomUserController.do?datagrid',
			border : true,
			pagination : true,
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
				title : '登录名',
				field : 'name',
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
				field : 'realName',
				title : '姓名',
				sortable : true,
				width : 80,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'residentID',
				title : '身份证号',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'birthday',
				title : '生日',
				sortable : true,
				width : 80,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'etcommCardID',
				title : '益体康ID',
				sortable : true,
				width : 80,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}

			}, {
				field : 'sex',
				title : '性别',
				sortable : true,
				width : 50,
				formatter : os.customuser.formatSex,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'remarks',
				title : '状态',
				sortable : true,
				width : 50,
				formatter : os.customuser.formatRemarks
			}, {
				field : 'departmentName',
				title : '部门',
				sortable : true,
				width : 80,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'sunKingLoginName',
				title : '赏金用户名',
				sortable : true,
				width : 110,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}

			}, {
				field : 'organizationName',
				title : '团队',
				sortable : true,
				width : 80,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			} ] ],
			toolbar : '#toolbar',
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.customuser.addcustomuser
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.customuser.editcustomuser
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.customuser.destroycustomuser
			}, '-', {
				text : '修改密码',
				iconCls : 'changepwicon',
				handler : os.customuser.changPassword
			}, '-', {
				text : '禁用',
				iconCls : 'changepwicon',
				handler : os.customuser.disableRemarks
			}, '-', {
				text : '恢复',
				iconCls : 'changepwicon',
				handler : os.customuser.recoveryRemarks
			}, '-', {
				text : '角色分配',
				iconCls : 'roleicon',
				handler : os.customuser.beforeRole
			}, '-', {
				text : '选择部门',
				iconCls : 'roleicon',
				handler : os.customuser.loaddepartment
			}, '-', {
				text : '团队组建',
				iconCls : 'roleicon',
				handler : os.customuser.loadorganization
			}, '-', {
				text : '<input id="searchBox"  prompt="搜索用户登陆名" style="margin-top:-4px;height:20px;line-height:20px"></input>'
			}, '-', {
				text : '检索',
				iconCls : 'icon-search',
				handler : os.customuser.search
			} ]
		});
	});
</script>

<table id="datagridcustomuser">
</table>

<div id="customuserdlg" class="easyui-dialog"
	style="width: 420px; height: 420px; padding: 10px 20px" closed="true"
	buttons="#dlg-customuser-buttons" data-options="modal:true">
	<div class="ftitle">用户信息</div>
	<form id="customuserForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>登录名:</label></td>
				<td><input id="customUserNameID" name="name"
					class="easyui-validatebox" required="true"
					validType="checkNameRepeat['']"></td>
			</tr>
			<tr class="fitem">
				<td><label>性别:</label></td>
				<td><select class="easyui-combobox" name="sex"><option
							value="1">男</option>
						<option value="0">女</option>
				</select></td>
			</tr>
			<tr class="fitem">
				<td><label>姓名:</label></td>
				<td><input class="easyui-validatebox" name="realName"></td>
			</tr>
			<tr class="fitem">
				<td><label>身份证号:</label></td>
				<td><input class="easyui-validatebox" name="residentID"></td>
			</tr>
			<tr class="fitem">
				<td><label>邮箱:</label></td>
				<td><input class="easyui-validatebox" name="email"></td>
			</tr>
			<tr class="fitem">
				<td><label>手机号:</label></td>
				<td><input class="easyui-validatebox" name="phone"></td>
			</tr>
			<tr class="fitem">
				<td><label>益体康ID:</label></td>
				<td><input class="easyui-validatebox" name="etcommCardID"></td>
			</tr>
			 <tr class="fitem">  
                    <td>  <label>生日:</label>  </td>  
                    <td>   <input class="easyui-datebox" name="birthday"> </td>   
             </tr>
             <tr class="fitem">  
                    <td>  <label>赏金用户名:</label>  </td>  
                    <td>   <input class="easyui-validatebox" name="sunKingLoginName"> </td>   
             </tr>
             <tr class="fitem">
				<td><label>赏金密码:</label></td>
				<td><input id="sunKing_password" name="sunKingPassword"
					type="password" class="easyui-validatebox"
					 /></td>
			</tr>
			<tr class="fitem">
				<td><label>赏金确认密码:</label></td>
				<td><input id="customuser_passwordR" name="passwordR"
					type="password" class="easyui-validatebox" 
					validType="equals['#sunKing_password']" /></td>
			</tr>
		</table>
	</form>

</div>

<div id="customuser_customuserChangPasswordDlg" class="easyui-dialog"
	style="width: 300px; height: 160px; padding: 10px 20px" closed="true"
	buttons="#dlg-change-password-buttons"
	data-options="iconCls:'changepwicon',modal:true">
	<!--<div class="ftitle">修改密码</div> -->
	<form id="customuser_changPasswordForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>密码:</label></td>
				<td><input id="customuser_password" name="password"
					type="password" class="easyui-validatebox"
					data-options="required:true" /></td>
			</tr>
			<tr class="fitem">
				<td><label>重复密码:</label></td>
				<td><input id="customuser_passwordR" name="passwordR"
					type="password" class="easyui-validatebox" required="required"
					validType="equals['#customuser_password']" /></td>
			</tr>
		</table>
	</form>

</div>

<div id="memberDispatchRoleDlg" class="easyui-dialog"
	style="width: 300px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlgMemberDispatchRoleButtons"
	data-options="iconCls:'roleicon',modal:true">
	<!--<div class="ftitle">角色分配</div> -->
	<ul class="easyui-tree" id="memberDispatchRoleTree"></ul>

</div>

<div id="departmentDlg" class="easyui-dialog"
	style="width: 300px; height: 200px; padding: 10px 20px" closed="true"
	buttons="#departmentButtons"
	data-options="iconCls:'roleicon',modal:true">
	<!--<div class="ftitle">部门管理</div> -->
	<select id="departmentCombobox"  class="easyui-combobox" name="departmentID" style="width:200px;"> </select>
</div>
<div id="departmentButtons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.customuser.savedepartment()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#departmentDlg').dialog('close')">取消</a>
</div>
<div id="dlgMemberDispatchRoleButtons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.customuser.saveCustomUserRole()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#memberDispatchRoleDlg').dialog('close')">取消</a>
</div>




<div id="dlg-customuser-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.customuser.savecustomuser()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#customuserdlg').dialog('close')">取消</a>
</div>

<div id="dlg-change-password-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.customuser.savePassword()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#customuser_customuserChangPasswordDlg').dialog('close')">取消</a>
</div>

<div id="organizationDlg" class="easyui-dialog"
	style="width: 300px; height: 200px; padding: 10px 20px" closed="true"
	buttons="#organizationButtons"
	data-options="iconCls:'roleicon',modal:true">
	<!--<div class="ftitle">团队管理</div> -->
	<select id="organizationCombobox"  class="easyui-combobox" name="organizationID" style="width:200px;"> </select>
</div>
<div id="organizationButtons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.customuser.saveorganization()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#organizationDlg').dialog('close')">取消</a>
</div>

