<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.equipmentmanage={};
		os.equipmentmanage.tipsEdAction=false;
		os.equipmentmanage.serverURL="";
		os.equipmentmanage.addTips=function (){  
			 os.equipmentmanage.tipsEdAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#tipsdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#tipsForm').form("clear");
                os.equipmentmanage.serverURL = 'healthTipsController.do?add';  
		};
		
		os.equipmentmanage.format = function(val, row) {
			if (val == 1) {
				return '肥胖';
			} else if(val == 2){
				return '高血压';
			}else if(val== 3){
				return '高血脂';
			}else if(val == 4){
				return '糖尿病';
			}else{
				return '未录入';
			}
		};
	os.equipmentmanage.editTips = function() {

			if ($('#datagridtips').datagrid('getSelections').length == 1) {

				var row = $('#datagridtips').datagrid('getSelected');
				if (row) {
					os.equipmentmanage.tipsEdAction = true;
					os.equipmentmanage.serverURL = 'healthTipsController.do?editTips&id='
							+ row.adviceid;
					$('#tipsdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#tipsForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#tipsForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.equipmentmanage.saveTips = function() {
			$('#tipsForm').form('submit', {
				url : os.equipmentmanage.serverURL,
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
						$('#tipsdlg').dialog('close'); // close the dialog  
						$('#datagridtips').datagrid('reload'); // reload the user data 
						$('#datagridtips').datagrid('unselectAll');
					}
				}
			});
		};

		os.equipmentmanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.equipmentmanage.destorytips = function() {
			var ids = [];
			var rows = $('#datagridtips').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].adviceid);
				}
				$.messager.confirm('确认', '确实要删除该健康贴士吗?', function(r) {
					if (r) {
						$.post('healthTipsController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridtips').datagrid('reload'); // reload the user data  
								$('#datagridtips')
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
		  os.equipmentmanage.search = function(){
				$('#datagridtips').datagrid("load",{"advicecontent":$("#ss").val()});
			}
		$('#datagridtips').datagrid({
			url : 'healthTipsController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'kbtype',
			sortOrder : 'desc',
			idField : 'adviceid',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				field : 'adviceid',
				checkbox : true
			}, {
				title : '贴士内容',
				field : 'advicecontent',
				width : 800,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [ {
				field : 'kbtype',
				title : '贴士类型',
				sortable : true,
				width : 100,
				formatter :os.equipmentmanage.format,
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
				handler : os.equipmentmanage.addTips
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.equipmentmanage.editTips
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.equipmentmanage.destorytips
			}, '-', {
				text : '<input id="ss"  prompt="请输入检索信息" style="margin-top:-4px;height:20px;line-height:20px"></input>'
			}, '-', {
				text : '检索',
				iconCls : 'icon-search',
				handler : os.equipmentmanage.search
			}]
		});
		
	});
  $.ajax({
    url:"healthTipsController.do?getType",
    type:"post",
    datatype:"json",
    success:function(data){
    	for (var i in data.obj){
            if(data.obj[i].kbtype == 1){
            	data.obj[i].kbvalue = "肥胖";
            }else
            if(data.obj[i].kbtype == 2){
            	data.obj[i].kbvalue = "高血压";
            }else
            if(data.obj[i].kbtype == 3){
            	data.obj[i].kbvalue = "高血脂";
            }else
            if(data.obj[i].kbtype == 4){
            	data.obj[i].kbvalue = "糖尿病";
            }
            else{
            	data.obj[i].kbvalue = "未录入";
            }
        }
        $('#type').combobox({ 
            data:data.obj,
            valueField: 'kbtype', 
            textField:'kbvalue'
        });        
    }
  });
	
</script>


<table id="datagridtips">

</table>

<div id="tipsdlg" class="easyui-dialog"
	style="width: 360px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-healthTips-buttons" data-options="modal:true">
	<div class="ftitle">贴士信息</div>
	<form id="tipsForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>贴士内容:</label></td>
				<td><textarea class="easyui-validatebox" name="advicecontent" required="true" style="height: 180px;"/></textarea></td>
			</tr>
			<tr class="fitem" id="xiaowu">
				<td><label>贴士类型:</label></td>
				<td>
				<input class="easyui-combobox" name="kbtype" id="type" />
				</td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-healthTips-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.equipmentmanage.saveTips()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#tipsdlg').dialog('close')">取消</a>
</div>

