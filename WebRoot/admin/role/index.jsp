<script type="text/javascript" charset="UTF-8">     
                  	      
	$(function() {
		os.rolemanage={};
		os.rolemanage.memberRolePostUrl="";
		
		os.rolemanage.newMemberRole= function (){  
                $('#memberRoleDialog').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#memberRoleForm').form('clear');  
                os.rolemanage.memberRolePostUrl = 'memberRoleController.do?add';  
        };  
        
	os.rolemanage.editMemberRole = function() {
			if ($('#datagridmemberrole').datagrid('getSelections').length == 1) {
				var row = $('#datagridmemberrole').datagrid('getSelected');
				if (row) {
					os.rolemanage.memberRolePostUrl = 'memberRoleController.do?edit&id='
							+ row.id;
					$('#memberRoleDialog').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#memberRoleForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#memberRoleForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.rolemanage.saveMemberRole = function() {
			$('#memberRoleForm').form('submit', {
				url : os.rolemanage.memberRolePostUrl,
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
						$('#memberRoleDialog').dialog('close'); // close the dialog  
						$('#datagridmemberrole').datagrid('reload'); // reload the user data 
						$('#datagridmemberrole').datagrid('unselectAll');
					}
				}
			});
		};
		os.rolemanage.destroyMemberRole = function() {
			// var row = $('#datagridmemberrole').datagrid('getSelections');  
			var ids = [];
			var rows = $('#datagridmemberrole').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '你确定删除这些角色?', function(r) {
					if (r) {
						$.post('memberRoleController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridmemberrole').datagrid('reload'); // reload the user data  
								$('#datagridmemberrole')
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
		os.rolemanage.firstLoadDispatchMainMenu = true;
		os.rolemanage.onLoadDispatchMainMenuSuccess = function(node, data) {
			/*if(os.rolemanage.firstLoadDispatchMainMenu)
			{
				$('#roleDispatchMainMenuTree').tree("expandAll");   
				os.rolemanage.firstLoadDispatchMainMenu=false; 
			}*/
			$('#roleDispatchMainMenuTree').tree("expandAll");
		};
		os.rolemanage.roleDispatchMainMenu = function() {
			firstLoadDispatchMainMenu = true;
			var row = $('#datagridmemberrole').datagrid('getSelected');
			if (row) {
				$('#roleDispatchMainMenuDlg').dialog({
					iconCls : 'changeicon'
				}).dialog('open').dialog('setTitle', '功能分配');
				$('#roleDispatchMainMenuTree')
						.tree(
								{
									checkbox : true,
									idField : 'id',
									cascadeCheck : false,
									onLoadSuccess : os.rolemanage.onLoadDispatchMainMenuSuccess,
									url : 'memberRoleController.do?getDispatch&rid='
											+ row.id
								});

			}
		};
		os.rolemanage.saveRoleDispatchMainMenu = function() {
			var ids = [];
			var row = $('#datagridmemberrole').datagrid('getSelected');

			if (row) {

				os.rolemanage.memberRolePostUrl = 'memberRoleController.do?saveRoleDispatchMainMenu&rid='
						+ row.id;
				var nodes = $('#roleDispatchMainMenuTree').tree('getChecked');

				for (var i = 0; i < nodes.length; i++) {
					ids.push(nodes[i].id);
				}
				//alert(ids.join(","));
				$.ajax({
					type : 'POST',
					url : os.rolemanage.memberRolePostUrl,
					data : {
						fids : ids.join(",")
					},
					success : function(res) {
						$('#roleDispatchMainMenuDlg').dialog('close'); // close the dialog  
						$('#datagridmemberrole').datagrid('unselectAll');
					},
					dataType : 'json'
				});
			}
		};
		//alert(os.rolemanage.memberRolePostUrl);
		$('#datagridmemberrole').datagrid({
			url : 'memberRoleController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {},
			sortName : 'role',
			sortOrder : 'asc',
			idField : 'id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			onLoadSuccess : function(data) {
				//alert("onLoadSuccess !");
			},
			frozenColumns : [ [ {
				field : 'id',
				checkbox : true
			}, {
				title : '角色',
				field : 'role',
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
				field : 'name',
				title : '角色名称',
				sortable : true,
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
				handler : os.rolemanage.newMemberRole
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.rolemanage.editMemberRole
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.rolemanage.destroyMemberRole

			}, '-', {
				text : '功能分配',
				iconCls : 'changeicon',
				handler : os.rolemanage.roleDispatchMainMenu
			} ]
		});
	});
</script>

<table class="easyui-datagrid" id="datagridmemberrole" >      
</table>

  <div id="memberRoleDialog" class="easyui-dialog" style="width:260px;height:160px;padding:10px 20px"  
            closed="true" buttons="#memberRoleDialogButtons"  data-options="modal:true" >    
        <form id="memberRoleForm" method="post" novalidate>  
            <div class="fitem">  
                <label>角色:</label>  
                <input name="role" class="easyui-validatebox" required="true">  
            </div>  
            <div class="fitem">  
                <label>名称:</label>  
                <input name="name" class="easyui-validatebox" required="true">  
            </div>       
        </form>  
    </div>
    
    <div id="memberRoleDialogButtons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.rolemanage.saveMemberRole()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#memberRoleDialog').dialog('close')">取消</a>  
  </div>    
 <div id="roleDispatchMainMenuDlg" class="easyui-dialog" style="width:300px;height:320px;padding:10px 20px"  
                closed="true" buttons="#roleDispatchMainMenuDlgButtons"  data-options="modal:true">  
        		 <ul class="easyui-tree" id="roleDispatchMainMenuTree"></ul>  
            
  </div>
<div id="roleDispatchMainMenuDlgButtons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.rolemanage.saveRoleDispatchMainMenu()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#roleDispatchMainMenuDlg').dialog('close')">取消</a>  
 </div>    
