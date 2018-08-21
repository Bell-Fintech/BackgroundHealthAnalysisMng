<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.3.2/jquery-1.8.0.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery.cookie.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.3.2/themes/default/easyui.css">
<script type="text/javascript" charset="UTF-8" src="jslib/changeEasyuiTheme.js"></script>
<link rel="stylesheet" type="text/css" href="jslib/jquery-easyui-1.3.2/themes/icon.css">
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="jslib/osCss.css">
<script type="text/javascript" charset="UTF-8" src="jslib/osUtil.js"></script>

<script type="text/javascript" charset="UTF-8">
	var editRowIndex = -1;
	  var url;  
	$(function() {

		$('#datagrid').datagrid({
			url : 'memberRoleController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'name',
			sortOrder : 'asc',
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
				title : '角色名称',
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
				field : 'role',
				title : '角色',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			} ] ],
			toolbar : [ '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					var ids = [];
					var rows = $('#datagrid').datagrid('getSelections');
					if (rows.length > 0) {
						$.messager.confirm('请确认', '您要删除当前所选项目？', function(r) {
							if (r) {
								for ( var i = 0; i < rows.length; i++) {
									ids.push(rows[i].id);
								}
								$.ajax({
									url : 'memberRoleController.do?delete',
									data : {
										ids : ids.join(',')
									},
									cache : false,
									dataType : "json",
									type : "POST",
									success : function(response) {
										$('#datagrid').datagrid('unselectAll');
										$('#datagrid').datagrid('reload');
										$.messager.show({
											title : '提示',
											msg : response.msg
										});
									}
								});
							}
						});
					} else {
						$.messager.alert('提示', '请选择要删除的记录！', 'error');
					}
				}
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					 var row = $('#datagrid').datagrid('getSelected');  
            if (row){  
             	url = 'memberRoleController.do?edit&id='+row.id;  
                $('#addRoleDialog').dialog('open').dialog('setTitle','Edit User');  
                $('#fm').form('load',row);  
               
            }  
				}
			}, '-',{
				text : '添加角色',
				iconCls : 'icon-add',
				handler : function() {
					 /*$('#addRoleDialog1').dialog({  
        					title: 'My Dialog',  
        					width: 400,  
        					height: 200,  
        					closed: false,  
        					cache: false,  
        					href: './memberRoleController.do?addRole',  
        					modal: true  
   				 }); 
   				 
   				 $('#addRoleDialog1').dialog('refresh','./memberRoleController.do?addRole');*/
  					//$('#addRoleDialog1').panel('refresh','./memberRoleController.do?addRole');
  				url="./memberRoleController.do?add";
   				 $('#addRoleDialog').dialog('open');
				}
			}, '-', {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					$('#datagrid').datagrid('unselectAll');
					if (editRowIndex > -1) {
						$('#datagrid').datagrid('endEdit', editRowIndex);
						editRowIndex = -1;
					}
				}
			}, '-', {
				text : '取消编辑',
				iconCls : 'icon-undo',
				handler : function() {
					$('#datagrid').datagrid('unselectAll');
					$('#datagrid').datagrid('rejectChanges');
					editRowIndex = -1;
				}
			}, '-' ],
			onClickRow : function(rowIndex, rowData) {
				if (editRowIndex > -1 && editRowIndex != rowIndex) {
					$.messager.alert('提示', '您没有结束之前编辑的数据，请先保存或取消编辑！', 'error');
				} else if (editRowIndex != rowIndex) {
					//$('#datagrid').datagrid('beginEdit', rowIndex);
					editRowIndex = rowIndex;
					//sy.checkNodesFun(rowData);/*选中当前角色已有的资源*/
				}
			},
			onAfterEdit : function(rowIndex, rowData, changes) {
				if ($('#datagrid').datagrid('validateRow', rowIndex)) {
					var url = 'roleController.do?';
					if (rowData.id) {
						url += 'edit';
					} else {
						url += 'add';
					}
					var nodes = sy.$tree.getCheckedNodes();
					var resourceIds = [];
					for ( var i = 0; i < nodes.length; i++) {
						resourceIds.push(nodes[i].id);
					}
					rowData.resourceIds = resourceIds.join(',');
					$.ajax({
						url : url,
						data : rowData,
						cache : false,
						dataType : "json",
						type : "POST",
						success : function(response) {
							if (response.success) {
								$('#datagrid').datagrid('acceptChanges');
								var data = $('#datagrid').datagrid('getData');
								data.rows[rowIndex].id = response.obj.id;
								$('#datagrid').datagrid('loadData', data);
								/*$('#datagrid').datagrid('reload');*/
								$.messager.show({
									title : '提示',
									msg : response.msg
								});
							} else {
								$.messager.alert('提示', response.msg, 'error');
								$('#datagrid').datagrid('rejectChanges');
							}
						}
					});
				}
			}
		});

		$('.datagrid-toolbar').append('查询：<input id="searchRoleNameInput"/>');
		$('#searchRoleNameInput').searchbox({
			searcher : function(value, name) {
				if ($.trim(value) == '') {
					value = '%';
				}
				$('#datagrid').datagrid('load', {
					name : value
				});
			},
			prompt : '请输入要查找的角色名称',
			width : 170
		});

		sy.$tree = $.fn.zTree.init($('#ztree'), {
			data : {
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "pid",
					rootPId : 0
				}
			},
			check : {
				enable : true
			},
			async : {
				enable : true,
				url : 'roleController.do?resourceTree',
				autoParam : [ 'id' ]
			}
		});

		sy.checkNodesFun = function(rowData) {
			sy.$tree.checkAllNodes(false);
			$.messager.progress({
				text : '数据处理中....',
				interval : 100
			});
			$.ajax({
				url : 'roleController.do?getRoleResources',
				data : {
					roleId : rowData.id
				},
				cache : false,
				dataType : "json",
				type : "POST",
				success : function(response) {
					if (response.success) {
						var ids = response.obj;
						for ( var i = 0; i < ids.length; i++) {
							var node = sy.$tree.getNodeByParam('id', ids[i]);
							sy.$tree.checkNode(node);
						}
					} else {
						$.messager.alert('提示', response.msg, 'error');
					}
					$.messager.progress('close');
				}
			});
		};

		$('#treePanel').panel({
			fit : true,
			title : '角色权限',
			border : false,
			tools : [ {
				iconCls : 'icon-reload',
				handler : function() {
					sy.$tree.reAsyncChildNodes(null, "refresh");
				}
			} ]
		});

	});
	
      
        function newUser(){  
            $('#dlg').dialog('open').dialog('setTitle','New User');  
            $('#fm').form('clear');  
            url = 'save_user.php';  
        }  
        function editUser(){  
            var row = $('#datagrid').datagrid('getSelected');  
            if (row){  
                $('#addRoleDialog').dialog('open').dialog('setTitle','Edit User');  
                $('#fm').form('load',row);  
                url = 'update_user.php?id='+row.id;  
            }  
        }  
        function saveUser(){  
            $('#fm').form('submit',{  
                url: url,  
                onSubmit: function(){  
                    return $(this).form('validate');  
                },  
                success: function(result){  
                    var result = eval('('+result+')');  
                    if (result.errorMsg){  
                        $.messager.show({  
                            title: 'Error',  
                            msg: result.errorMsg  
                        });  
                    } else {  
                        $('#dlg').dialog('close');      // close the dialog  
                        $('#dg').datagrid('reload');    // reload the user data  
                    }  
                }  
            });  
        }  
        function destroyUser(){  
            var row = $('#dg').datagrid('getSelected');  
            if (row){  
                $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){  
                    if (r){  
                        $.post('destroy_user.php',{id:row.id},function(result){  
                            if (result.success){  
                                $('#dg').datagrid('reload');    // reload the user data  
                            } else {  
                                $.messager.show({   // show error message  
                                    title: 'Error',  
                                    msg: result.errorMsg  
                                });  
                            }  
                        },'json');  
                    }  
                });  
            }  
        }  
 
	
</script>

</head>
<body class="easyui-layout" style="overflow: hidden;">
	<div region="center" title="角色列表" border="false" style="overflow: hidden;">
		<table id="datagrid"></table>
	</div>
	<div region="east" style="width: 250px;overflow: hidden;" split="true">
		<div id="treePanel">
			<ul id="ztree" class="ztree"></ul>
		</div>
	</div>
	   <!-- <div id="addRoleDialog1" class="easyui-dialog" style="visibility:hidden">Dialog Content.</div> -->
	    <div id="addRoleDialog" class="easyui-dialog" style="width:280px;height:160px;padding:10px 20px"  
            closed="true" buttons="#create-dlg-buttons" data-options="modal:true">  
        <div class="ftitle">User Information</div>  
        <form id="fm" method="post" novalidate>  
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
    <div id="create-dlg-buttons">  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">Save</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#addRoleDialog').dialog('close')">Cancel</a>  
    </div>   
</body>
</html>
