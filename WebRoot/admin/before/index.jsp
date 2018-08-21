<script type="text/javascript" charset="UTF-8">     
                  	      
	$(function() {
		os.menuRole={};
		os.menuRole.roleMenuServer="";
		os.menuRole.loadTemplate = function (){
        	var rows = $('#roleMenudatagrid').datagrid('getSelections');
			if (rows.length > 0) {
					 $.ajax({
			              	url:'changeFileController.do?list',  
			           	    type:"post",
			           	    datatype:"json",
			           	    success:function(d){
			           	    		$('#templateCombobox').combobox({ 
			                 	    	data:d,
			                 	    	panelWidth:'auto',
			                 	    	valueField:'id',  
			                            textField:'templateName'
			                         });
			               	    	$('#pageConfigDialog').dialog('open').dialog('setTitle','模版分配');
			           	    	
			           	    }
			        	 }); 
				}else{
					$.messager.alert('警告', '请选择一条信息进行操作');
				}
        }
		os.menuRole.addTemplate = function (){
			var ids = [];
			var rows = $('#roleMenudatagrid').datagrid('getSelections');
			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.post('beforeMemberController.do?template', {
					ids : ids.join(','),
					templateID : $('#templateCombobox').combobox('getValue')
				}, function(result) {
					if (result.success) {
						$('#pageConfigDialog').dialog('close'); // close the dialog  
						$('#roleMenudatagrid').datagrid('reload'); // reload the user data 
						$('#roleMenudatagrid').datagrid('unselectAll');
					} else {
						$.messager.show({ // show error message  
							title : 'Error',
							msg : result.msg
						});
					}
				}, 'json');
				
				}else{
					$.messager.alert('警告', '请选择一条信息进行操作');
				}
		}
		os.menuRole.creatRole= function (){  
                $('#userRoleDialog').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#creatNewRoleForm').form('clear');  
                os.menuRole.roleMenuServer = 'beforeMemberController.do?add';  
        };  
        os.menuRole.formatStatus = function(val, row) {
			if (val == "0") {
				return '正常';
			} else {
				return '<span style="color:red;">' + '锁定' + '</span>';
			}
		}
        os.menuRole.formatPower = function(val, row) {
			if (val == "1") {
				return '个人级别';
			} else {
				return '企业级';
			}
		}
        
        os.menuRole.addPageConfig = function(){
        	$('#pageConfigDialog').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
            $('#pageConfigForm').form('clear');  
        }
        
	os.menuRole.editRole = function() {
			if ($('#roleMenudatagrid').datagrid('getSelections').length == 1) {
				var row = $('#roleMenudatagrid').datagrid('getSelected');
				if (row) {
					os.menuRole.roleMenuServer = 'beforeMemberController.do?editRole&id='
							+ row.id;
					$('#userRoleDialog').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#creatNewRoleForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#creatNewRoleForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.menuRole.saveMenuRole = function() {
			$('#creatNewRoleForm').form('submit', {
				url : os.menuRole.roleMenuServer,
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
						$('#userRoleDialog').dialog('close'); // close the dialog  
						$('#roleMenudatagrid').datagrid('reload'); // reload the user data 
						$('#roleMenudatagrid').datagrid('unselectAll');
					}
				}
			});
		};
		os.menuRole.deleteRole = function() {
			// var row = $('#roleMenudatagrid').datagrid('getSelections');  
			var ids = [];
			var rows = $('#roleMenudatagrid').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '你确定删除这些角色?', function(r) {
					if (r) {
						$.post('beforeMemberController.do?deleteRole', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#roleMenudatagrid').datagrid('reload'); // reload the user data  
								$('#roleMenudatagrid')
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
		os.menuRole.firstLoadDispatchMainMenu = true;
		os.menuRole.onLoadMenuRoleSuccess = function(node, data) {
			$('#menuRoleTree').tree("expandAll");
		};
		os.menuRole.functionConfigMenu = function() {
			firstLoadDispatchMainMenu = true;
			var row = $('#roleMenudatagrid').datagrid('getSelected');
			if (row) {
				$('#roleMenuDlg').dialog({
					iconCls : 'changeicon'
				}).dialog('open').dialog('setTitle', '功能分配');
				$('#menuRoleTree')
						.tree(
								{
								
									checkbox : true,
									idField : 'id',
									
									cascadeCheck : false,
									onLoadSuccess : os.menuRole.onLoadMenuRoleSuccess,
									url : 'beforeMemberController.do?functionConfig&rid='
											+ row.id
								});

			}
		};
		os.menuRole.saveRoleMenu = function() {
			var ids = [];
			var row = $('#roleMenudatagrid').datagrid('getSelected');

			if (row) {

				os.menuRole.roleMenuServer = 'beforeMemberController.do?saveRoleMenu&rid='
						+ row.id;
				var nodes = $('#menuRoleTree').tree('getChecked');

				for (var i = 0; i < nodes.length; i++) {
					ids.push(nodes[i].id);
				}
				//alert(ids.join(","));
				$.ajax({
					type : 'POST',
					url : os.menuRole.roleMenuServer,
					data : {
						fids : ids.join(",")
					},
					success : function(res) {
						$('#roleMenuDlg').dialog('close'); // close the dialog  
						$('#roleMenudatagrid').datagrid('unselectAll');
					},
					dataType : 'json'
				});
			}
		};
		$('#roleMenudatagrid').datagrid({
			url : 'beforeMemberController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'role',
			sortOrder : 'asc',
			idField : 'Id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			onLoadSuccess : function(data) {
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
			},{
				field : 'status',
				title : '状态',
				sortable : true,
				width : 100,
				formatter : os.menuRole.formatStatus
			},{
				field : 'power',
				title : '页面跳转',
				sortable : true,
				width : 100,
				formatter : os.menuRole.formatPower
			},{
				field : 'ReportOne',
				title : '页面跳转',
				hidden : true
			},{
				field : 'ReportTwo',
				title : '页面跳转',
				hidden : true
			},{
				field : 'ReportThree',
				title : '页面跳转',
				hidden : true
			},{
				field : 'ReportFour',
				title : '页面跳转',
				hidden : true
			},{
				field : 'ReportFive',
				title : '页面跳转',
				hidden : true
			},{
				field : 'ReportSix',
				title : '页面跳转',
				hidden : true
			},{
				field : 'ReportSeven',
				title : '页面跳转',
				hidden : true
			}
			] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.menuRole.creatRole
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.menuRole.editRole
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.menuRole.deleteRole

			}, '-', {
				text : '功能分配',
				iconCls : 'changeicon',
				handler : os.menuRole.functionConfigMenu
			}, '-', {
				text : '绑定模版',
				iconCls : 'changeicon',
				handler : os.menuRole.loadTemplate
			}]
		});
	});
	
	
	
$(function(){
	
	$('#treeDemo').tree({  
		    url:'admin/before/tree_data.json'
	}); 
	
	
});
	
</script>

<table id="roleMenudatagrid">
</table>


<div id="pageConfigDialog" class="easyui-dialog" style="width:260px;height:150px;padding:10px 20px"  
            closed="true" buttons="#pageConfigButton"  data-options="modal:true" >    
	<select id="templateCombobox"  class="easyui-combobox" name="templateID" style="width:200px;"> </select>
</div>
<div id="pageConfigButton">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.menuRole.addTemplate()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#pageConfigDialog').dialog('close')">取消</a>
</div>
<div id="userRoleDialog" class="easyui-dialog"
	style="width: 260px; height: 350px; padding: 10px 20px" closed="true"
	buttons="#roleMenuDialogButton" data-options="modal:true">
	<form id="creatNewRoleForm" method="post" novalidate>
		<div class="fitem">
			<label>角色:</label> <input name="role" class="easyui-validatebox"
				required="true">
		</div>
		<div class="fitem">
			<label>名称:</label> <input name="name" class="easyui-validatebox"
				required="true">
		</div>
		<div class="fitem">
			<label>锁定:</label> <select class="easyui-combobox" required="true"
				name="status"><option value="0">正常</option>
				<option value="1">锁定</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>页面跳转:</label> <select class="easyui-combobox" required="true"
				name="power"><option value="0">企业级</option>
				<option value="1">个人级</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>基本资料:</label> <select class="easyui-combobox" required="true"
				name="ReportOne"><option value="0">显示</option>
				<option value="1">隐藏</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>体重体型:</label> <select class="easyui-combobox" required="true"
				name="ReportTwo"><option value="0">显示</option>
				<option value="1">隐藏</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>体型标示:</label> <select class="easyui-combobox" required="true"
				name="ReportThree"><option value="0">显示</option>
				<option value="1">隐藏</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>饮食评估:</label> <select class="easyui-combobox" required="true"
				name="ReportFour"><option value="0">显示</option>
				<option value="1">隐藏</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>饮食建议:</label> <select class="easyui-combobox" required="true"
				name="ReportFive"><option value="0">显示</option>
				<option value="1">隐藏</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>营养建议:</label> <select class="easyui-combobox" required="true"
				name="ReportSix"><option value="0">显示</option>
				<option value="1">隐藏</option>
			</select>
			</td>
		</div>
		<div class="fitem">
			<label>健康管理:</label> <select class="easyui-combobox" required="true"
				name="ReportSeven"><option value="0">显示</option>
				<option value="1">隐藏</option>
			</select>
			</td>
		</div>
	</form>
</div>

<div id="roleMenuDialogButton">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.menuRole.saveMenuRole()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#userRoleDialog').dialog('close')">取消</a>
</div>
<div id="roleMenuDlg" class="easyui-dialog"
	style="width: 300px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#menuRoleDlgButton" data-options="modal:true">
	<ul class="easyui-tree" id="menuRoleTree"></ul>
<!-- <ul id="treeDemo" class="easyui-tree"></ul> -->
</div>
<div id="menuRoleDlgButton">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.menuRole.saveRoleMenu()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#roleMenuDlg').dialog('close')">取消</a>
</div>
