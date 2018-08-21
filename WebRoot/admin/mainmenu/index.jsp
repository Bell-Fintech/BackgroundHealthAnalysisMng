
<script type="text/javascript" charset="UTF-8">

	os.mainmenumanage={};
	os.mainmenumanage.mainMenuPostUrl="";
	os.mainmenumanage.currentSelectedRow="";
	os.mainmenumanage.currentOperate="";
	$(function() {
	//alert("hello mainMenuTree!");
	
	//var item = $('#mainMenuTreeNodeMenu').menu('findItem', 'Open');  // find 'Open' item
	/*$('#mainMenuTreeNodeMenu').menu('appendItem', {
	//parent: item.target, 
	text: 'OpenExcel',
	iconCls: 'usericon',
	onclick: function(){alert('Open Excel')}
	});*/
	os.mainmenumanage.onMainMenuContextMenu=function (e,row){  
            e.preventDefault();  
            //alert(row.id+row.text);
            $(this).treegrid('select', row.id); 
            os.mainmenumanage.currentSelectedRow=row;
            if(row.leaf==1) 
            {
           		 $('#mainMenuTreeNodeMenu').menu('show',{  
                	left: e.pageX,  
                	top: e.pageY  
            	});
            }
            else
            {
            	 $('#mainMenuTreeTypeMenu').menu('show',{  
                	left: e.pageX,  
                	top: e.pageY  
            	});
            }  
        };
        os.mainmenumanage.formatMenuType= function (val,row){  
                if (row.funType ==0){  
                    return '嵌入tab';  
                } else if(row.funType ==1){  
                    return '嵌入iframe';  
                } 
                else
                {
                	return 'Window';  
                } 
        } ;
      os.mainmenumanage.formatNeedRight=function (val,row){ 
      	  if (val ==1){  
                 	 return  '需要';  
                } else {  
                    return '不需要';  
                }  
      };    
      os.mainmenumanage.formatLeaf= function (val,row){ 
      	  if (val ==1){  
                 	 return  '功能项';  
                } else {  
                    return '功能类';  
                }  
      };  
      os.mainmenumanage.addMainMenuNode= function (){
      		  $('#mainMenuItemDlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
              $('#mainMenuItemForm').form('clear');  
              os.mainmenumanage.currentOperate="add";
              //var row = $('#mainMenuTree').treegrid('getSelected');  
              os.mainmenumanage.mainMenuPostUrl = 'mainMenuController.do?add&pid='+os.mainmenumanage.currentSelectedRow.id;  
              //  url = 'mainMenuController.do?add';  
      };   
      os.mainmenumanage.mainMenuRefresh= function (){  
                var row = $('#mainMenuTree').treegrid('getSelected');                 
                if (row){  
                 	$('#mainMenuTree').treegrid('reload',row.id);             
                }  
      };  
      
    
	
	os.mainmenumanage.editMainMenuNode = function() {
			if ($('#mainMenuTree').datagrid('getSelections').length == 1) {
				var row = $('#mainMenuTree').treegrid('getSelected');
				if (row) {
					os.mainmenumanage.mainMenuPostUrl = 'mainMenuController.do?edit&id='
							+ row.id;
					os.mainmenumanage.currentOperate = "edit";
					$('#mainMenuItemDlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#mainMenuItemForm').form({
						onSubmit : function() {
						},
						onLoadSuccess : function() {
						},
						success : function(data) {
						}
					});
					$('#mainMenuItemForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.mainmenumanage.saveMainMenuNode = function() {
			$('#mainMenuItemForm')
					.form(
							'submit',
							{
								url : os.mainmenumanage.mainMenuPostUrl,
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
										$('#mainMenuItemDlg').dialog('close'); // close the dialog 
										if (os.mainmenumanage.currentOperate == "add") {
											$('#mainMenuTree')
													.treegrid(
															'reload',
															os.mainmenumanage.currentSelectedRow.id);
										}
										if (os.mainmenumanage.currentOperate == "edit") {
											$('#mainMenuTree')
													.treegrid(
															'reload',
															os.mainmenumanage.currentSelectedRow.pid);
										}
										$('#datagridmember').treegrid(
												'unselectAll');
									}
								}
							});
		};

		os.mainmenumanage.deleteMainMenuNode = function() {
			var row = $('#mainMenuTree').treegrid('getSelected');
			$.post('mainMenuController.do?delete', {
				id : row.id
			}, function(result) {
				if (result.success) {
					$('#mainMenuTree').treegrid('reload', row.pid);
				} else {
					$.messager.show({ // show error message  
						title : 'Error',
						msg : result.errorMsg
					});
				}
			}, 'json');
		};
		$('#mainMenuTree').treegrid({
			url : 'mainMenuController.do?mainMenuTree',
			idField : 'id',
			singleSelect : true,
			treeField : 'text',
			fit : true,
			fitColumns : true,
			onContextMenu : os.mainmenumanage.onMainMenuContextMenu,
			columns : [ [ {
				title : '功能',
				field : 'text',
				width : 120
			}, {
				title : '控制项',
				field : 'funName',
				width : 100
			}, {
				title : '排序字段',
				field : 'orderID',
				width : 60
			}, {
				title : '节点',
				field : 'leaf',
				width : 40,
				formatter : os.mainmenumanage.formatLeaf
			}, {
				title : '节点类型',
				field : 'funType',
				width : 80,
				formatter : os.mainmenumanage.formatMenuType
			}, {
				title : '节点图标',
				field : 'iconCls',
				width : 80
			}, {
				title : '权限控制',
				field : 'needRight',
				width : 80,
				formatter : os.mainmenumanage.formatNeedRight
			} ] ]
		});

	});
</script>

<table id="mainMenuTree" style="width: 600px; height: 400px"></table>
<div id="mainMenuTreeTypeMenu" class="easyui-menu" style="width: 120px">
	<div onclick="os.mainmenumanage.addMainMenuNode()" iconCls="icon-add"
		data-options="iconCls:'icon-ok'">添加</div>
	<div onclick="os.mainmenumanage.editMainMenuNode()" iconCls="icon-edit"
		data-options="iconCls:'usericon'">编辑</div>
	<div onclick="os.mainmenumanage.deleteMainMenuNode()"
		iconCls="icon-remove">删除</div>
	<div class="menu-sep"></div>
	<div onclick="os.mainmenumanage.mainMenuRefresh()"
		iconCls="refreshicon">刷新</div>
</div>
<div id="mainMenuTreeNodeMenu" class="easyui-menu" style="width: 120px">
	<div onclick="os.mainmenumanage.editMainMenuNode()" iconCls="icon-edit"
		data-options="iconCls:'usericon'">编辑</div>
	<div onclick="os.mainmenumanage.deleteMainMenuNode()"
		iconCls="icon-remove">删除</div>
</div>
<div id="mainMenuItemDlg" class="easyui-dialog"
	style="width: 300px; height: 300px; padding: 10px 20px"
	iconCls="addicon" closed="true" buttons="#mainMenuItemDlgButtons"
	data-options="modal:true">
	<div class="ftitle">用户信息</div>
	<form id="mainMenuItemForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>名称:</label></td>
				<td><input name="text" class="easyui-validatebox"
					required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>节点:</label></td>
				<td><select class="easyui-combobox" name="leaf"><option
							value="1">功能项</option>
						<option value="0">功能类</option>
				</select></td>
			</tr>
			<tr class="fitem">
				<td><label>控制项:</label></td>
				<td><input name="funName" class="easyui-validatebox">
				</td>
			</tr>

			<tr class="fitem">
				<td><label>节点图标:</label></td>
				<td><input name="iconCls" class="easyui-validatebox"
					required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>排序字段:</label></td>
				<td><input name="orderID" value="1" class="easyui-validatebox"></td>
			</tr>
			<tr class="fitem">
				<td><label>节点类型:</label></td>
				<td><select class="easyui-combobox" name="funType"><option
							value="0">嵌入tab</option>
						<option value="1">嵌入iframe</option>
						<option value="2">Window</option>
				</select></td>
			</tr>
			<tr class="fitem">
				<td><label>权限控制:</label></td>
				<td><select class="easyui-combobox" name="needRight"><option
							value="1">需要</option>
						<option value="0">不需要</option>
				</select></td>
			</tr>
		</table>
	</form>

</div>
<div id="mainMenuItemDlgButtons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.mainmenumanage.saveMainMenuNode()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#mainMenuItemDlg').dialog('close')">取消</a>
</div>

