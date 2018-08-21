
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.processdefine={}; 
		os.processdefine.memberUserEditAction=false;
		os.processdefine.serverURL="";
		
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
       		 
       		 if(os.processdefine.memberUserEditAction)return true;
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
		os.processdefine.addProcessDefine=function (){  
			 os.processdefine.memberUserEditAction=false;
           		 //$('#memberForm>input[name=name]').attr("readonly","") ;  
           	
                $('#processDefineDlg').dialog('open').dialog('setTitle','添加流程定义');  
                $('#processDefineForm').form('clear');                
                os.processdefine.serverURL = 'processDefinitionController.do?add';  
		};
	
          
	os.processdefine.editMember = function() {
			if ($('#datagridmember').datagrid('getSelections').length == 1) {
				var row = $('#datagridmember').datagrid('getSelected');

				// $('#memberForm>input[name=name]').attr("readonly","readonly"); 
				$('#memberUserNameID').attr("readonly", "readonly");
				if (row) {
					os.processdefine.memberUserEditAction = true;
					os.processdefine.serverURL = 'memberController.do?edit&id='
							+ row.id;
					$('#memberdlg').dialog('open').dialog('setTitle', '编辑');
					$('#memberForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.processdefine.saveProcessDefine = function() {
			$('#processDefineForm').form('submit', {
				url : os.processdefine.serverURL,
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
						$('#processDefineDlg').dialog('close'); // close the dialog  
						$('#datagridProcessDefine').datagrid('reload'); // reload the user data 
						$('#datagridProcessDefine').datagrid('unselectAll');
					}
				}
			});
		};

		os.processdefine.formatSuspended = function(val, row) {
			if (val == true) {
				return '<span style="color:red;">' + '挂起' + '</span>';
			} else {
				return '正常';
			}
		};

		os.processdefine.destroyProcessDefine = function() {
			// var row = $('#datagridmember').datagrid('getSelections');  
			var ids = [];
			var rows = $('#datagridProcessDefine').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].deploymentId);
				}
				$.messager.confirm('确认', '确实要删除该流程定义吗?', function(r) {
					if (r) {
						$.post('processDefinitionController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridProcessDefine').datagrid('reload'); // reload the user data  
								$('#datagridProcessDefine').datagrid(
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

		//$('#datagridProcessDefine').datagrid().resize();
		$('#datagridProcessDefine').datagrid({
			url : 'processDefinitionController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
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
				title : 'ID',
				field : 'showId',
				width : 100,
				sortable : true

			}, {
				title : 'Name',
				field : 'name',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			}, {
				field : 'key',
				title : 'Key',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'version',
				title : 'Version',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'resourceName',
				title : 'ResourceName',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'deploymentId',
				title : 'DeploymentId',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'diagramResourceName',
				title : 'DiagramResourceName',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'suspended',
				title : 'Suspended',
				sortable : true,
				formatter : os.processdefine.formatSuspended,
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
				handler : os.processdefine.addProcessDefine
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.processdefine.destroyProcessDefine
			} ]
		});
	});
</script>

<table id="datagridProcessDefine" >
	<!--<div id="toolbar">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>  
        </div>  
	 -->       
</table>

        <div id="processDefineDlg" class="easyui-dialog" style="width:360px;height:160px;padding:10px 20px"  
                closed="true" buttons="#dlg-processDefine-buttons">  
            <div class="ftitle">发布流程定义</div>  
            <form id="processDefineForm" method="post" enctype="multipart/form-data">  
              <table>  
                <tr class="fitem">  
                   <td> <label>流程定义文件:</label></td>  
                   <td> <input type="file" name="processFile" class="input" > </td>  
                 </tr>                
                 </table>  
            </form>  
            
        </div>
        
          <div id="memberChangPasswordDlg" class="easyui-dialog" style="width:300px;height:160px;padding:10px 20px"  
                closed="true" buttons="#dlg-change-password-buttons">  
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
            
     
  <div id="dlg-processDefine-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.processdefine.saveProcessDefine()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#processDefineDlg').dialog('close')">取消</a>  
  </div>  
  
  