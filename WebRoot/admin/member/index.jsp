<%@ page language="java"  pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.membermanage={};
		os.membermanage.memberUserEditAction=false;
		os.membermanage.serverURL="";
		
	    $.extend($.fn.validatebox.defaults.rules, {  
    	equals: {  
       		 validator: function(value,param){  
           	 return value == $(param[0]).val();  
        	},  
       	 message: '两次密码不一致。'  
    	}  ,
    	checkNameRepeat: {  
       		 validator: function(value,param){  
       		 //alert("checkNameRepeat");
       		 
       		 if(os.membermanage.memberUserEditAction)return true;
       		 var exits = $.ajax({
  				url: 'memberController.do?checkName&name='+value,
  				async: false
				}).responseText; 
			 if(exits=='true')	
           	 	return true;
           	 else
           	 	return false;
        	},  
       	 	message: '用户名已存在。'  
    		}
		}); 
		os.membermanage.addMember=function (){  
			 os.membermanage.memberUserEditAction=false;
           		 //$('#memberForm>input[name=name]').attr("readonly","") ;  
           		$('#memberUserNameID').removeAttr("readonly");  
                $('#memberdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#memberForm').form('clear'); 
                os.membermanage.serverURL = 'memberController.do?add';  
		};
	
         
	os.membermanage.editMember = function() {
			if ($('#datagridmember').datagrid('getSelections').length == 1) {
				var row = $('#datagridmember').datagrid('getSelected');

				// $('#memberForm>input[name=name]').attr("readonly","readonly"); 
				$('#memberUserNameID').attr("readonly", "readonly");
				if (row) {
					os.membermanage.memberUserEditAction = true;
					os.membermanage.serverURL = 'memberController.do?edit&id='
							+ row.id;
					$('#memberdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#memberForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});

					$('#memberForm').form('load', row);

				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.membermanage.saveMember = function() {
			$('#memberForm').form('submit', {
				url : os.membermanage.serverURL,
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
						$('#memberdlg').dialog('close'); // close the dialog  
						$('#datagridmember').datagrid('reload'); // reload the user data 
						$('#datagridmember').datagrid('unselectAll');
					}
				}
			});
		};

		os.membermanage.formatSex = function(val, row) {
			if (val == 1) {
				return '男';
			} else {
				return '女';
			}
		};
		os.membermanage.formatMemberLock = function(val, row) {
			if (val == 1) {
				return '<span style="color:red;">' + '锁定' + '</span>';
			} else {
				return '正常';
			}
		};

		os.membermanage.destroyMember = function() {
			// var row = $('#datagridmember').datagrid('getSelections');  
			var ids = [];
			var rows = $('#datagridmember').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该用户吗?', function(r) {
					if (r) {
						$.post('memberController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridmember').datagrid('reload'); // reload the user data  
								$('#datagridmember').datagrid('unselectAll');
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

		os.membermanage.changPassword = function() {
			var row = $('#datagridmember').datagrid('getSelected');
			if (row) {
				os.membermanage.serverURL = 'memberController.do?changePassword&id='
						+ row.id;
				$('#changPasswordForm').form('clear');
				$('#memberChangPasswordDlg').dialog('open').dialog('setTitle',
						'修改密码');
			}
		};
		os.membermanage.savePassword = function() {
			$('#changPasswordForm').form('submit', {
				url : os.membermanage.serverURL,
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
						$('#memberChangPasswordDlg').dialog('close'); // close the dialog  
						$('#datagridmember').datagrid('unselectAll');
					}
				}
			});
		};
		os.membermanage.memberDispatchRole = function() {
			var row = $('#datagridmember').datagrid('getSelected');
			if (row) {
				os.membermanage.serverURL = 'memberController.do?changePassword&id='
						+ row.id;
				//$('#changPasswordForm').form('clear'); 
				$('#memberDispatchRoleDlg').dialog('open').dialog('setTitle',
						'角色分配');
				$('#memberDispatchRoleTree').tree({
					checkbox : true,
					url : 'memberController.do?getDispatch&id=' + row.id
				});
			}
		};
		os.membermanage.saveMemberDispatchRole = function() {
			var ids = [];
			var row= $('#datagridmember').datagrid('getSelected');
			if (row) {
				os.membermanage.serverURL = 'memberController.do?saveMemberDispatchRole&id='
					+ row.id;
				var nodes = $('#memberDispatchRoleTree').tree('getChecked');
				for (var i = 0; i < nodes.length; i++) {
					ids.push(nodes[i].id);
				}
				$.ajax({
					type : 'POST',
					url : os.membermanage.serverURL,
					data : {
						rids : ids.join(",")
					},
					success : function(res) {
						$('#memberDispatchRoleDlg').dialog('close'); // close the dialog  
						$('#datagridmember').datagrid('unselectAll');
					},
					dataType : 'json'
				});
			}
			//alert(ids.join(","));
		};
		//$('#datagridmember').datagrid().resize();
		$('#datagridmember').datagrid({
			url : 'memberController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {},
			sortName : 'orderNum',
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
				title : '真实姓名',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'email',
				title : 'E_mail',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'mobileNum',
				title : '手机号码',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},  {
				field : 'birthday',
				title : '生日',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'sex',
				title : '性别',
				sortable : true,
				width : 100,
				formatter : os.membermanage.formatSex,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'memberLock',
				title : '锁定标志',
				sortable : true,
				formatter : os.membermanage.formatMemberLock,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}

			] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.membermanage.addMember
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.membermanage.editMember
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.membermanage.destroyMember
			}, '-', {
				text : '修改密码',
				iconCls : 'changepwicon',
				handler : os.membermanage.changPassword
			}, {
				text : '角色分配',
				iconCls : 'roleicon',
				handler : os.membermanage.memberDispatchRole
			} ]
		});
	});
</script>

<table id="datagridmember" >
	<!--<div id="toolbar">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>  
        </div>  
	 -->       
</table>

        <div id="memberdlg" class="easyui-dialog" style="width:360px;height:320px;padding:10px 20px"  
                closed="true" buttons="#dlg-member-buttons" data-options="modal:true" >  
            <div class="ftitle">用户信息</div>  
            <form id="memberForm" method="post">  
              <table>  
                <tr class="fitem">  
                   <td> <label>登录名:</label></td>  
                   <td> <input id="memberUserNameID" name="name" class="easyui-validatebox" required="true"  validType="checkNameRepeat['']"> </td>  
                 </tr> 
                <tr class="fitem">  
                    <td>  <label>真实姓名:</label> </td>   
                    <td>  <input name="realName" class="easyui-validatebox" required="true"> </td>   
                 </tr> 
                <tr class="fitem">  
                    <td>  <label>排序字段:</label> </td>   
                    <td>  <input name="orderNum" class="easyui-validatebox" required="true"> </td>   
                 </tr> 
                 <tr class="fitem">  
                    <td>  <label>E_Mail:</label> </td>   
                     <td> <input name="email" class="easyui-validatebox" validType="email"> </td>   
                </tr> 
                <tr class="fitem">  
                     <td> <label>手机号码:</label>  </td>  
                    <td>  <input name="mobileNum">  </td>  
                 </tr>
                  <tr class="fitem">  
                    <td>  <label>生日:</label>  </td>  
                    <td>   <input class="easyui-datebox" name="birthday"> </td>   
                </tr>
                 <tr class="fitem">  
                    <td>  <label>性别:</label> </td>   
                    <td>   <select class="easyui-combobox" required="true" name="sex"><option value="1">男</option><option value="0">女</option> </select></td>  
                </tr>   
                 <tr class="fitem">  
                    <td>  <label>锁定:</label> </td>   
                  <td>    <select class="easyui-combobox" required="true" name="memberLock"><option value="0">正常</option><option value="1">锁定</option> </select></td>  
                 </tr>
                 </table>  
            </form>  
            
        </div>
        
          <div id="memberChangPasswordDlg" class="easyui-dialog" style="width:300px;height:160px;padding:10px 20px"  
                closed="true" buttons="#dlg-change-password-buttons" data-options="iconCls:'changepwicon',modal:true">  
            <!--<div class="ftitle">修改密码</div> --> 
            <form id="changPasswordForm" method="post">  
              <table>  
                <tr class="fitem">  
                   <td> <label>密码:</label></td>  
                   <td> <input id="password" name="password" type="password" class="easyui-validatebox" data-options="required:true" />   </td>  
                 </tr> 
                <tr class="fitem">  
                    <td>  <label>重复密码:</label> </td>   
                    <td>  <input id="passwordR" name="passwordR" type="password" class="easyui-validatebox"   
   								 required="required" validType="equals['#password']" />   </td>   
                 </tr> 
                
                 </table>  
            </form>  
            
        </div>
         <div id="memberDispatchRoleDlg" class="easyui-dialog" style="width:300px;height:320px;padding:10px 20px"  
                closed="true" buttons="#dlgMemberDispatchRoleButtons" data-options="iconCls:'roleicon',modal:true">  
            <!--<div class="ftitle">角色分配</div> --> 
               <ul class="easyui-tree" id="memberDispatchRoleTree"></ul>  
            
        </div>
  <div id="dlg-member-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.membermanage.saveMember()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#memberdlg').dialog('close')">取消</a>  
  </div>  
  
   <div id="dlg-change-password-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.membermanage.savePassword()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#memberChangPasswordDlg').dialog('close')">取消</a>  
  </div>  
  
  <div id="dlgMemberDispatchRoleButtons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.membermanage.saveMemberDispatchRole()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#memberDispatchRoleDlg').dialog('close')">取消</a>  
  </div>  