
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.processInstance={}; 
		os.processInstance.memberUserEditAction=false;
		os.processInstance.serverURL="";
		os.processInstance.searchParameter={};
		os.processInstance.searchParameter.definitionKey="";
		
	  	 os.processInstance.search=function(){
	  	  $('#instanceProcessSearchDlg').dialog('open').dialog('setTitle','流程实例查询'); 
	  	 	  $('#instanceProcessSearchForm').form({
							onSubmit: function(){
							},
							onLoadSuccess: function(){
						    },
							success:function(data){
						}
					});  
             $('#instanceProcessSearchForm').form('load',{
                 definitionKey:os.processInstance.searchParameter.definitionKey
             });       
	  	 };
	  	  os.processInstance.saveSearchParameter=function()
	   	 {	   	 
	   	 	var data=$('#instanceProcessSearchForm').form('getData',true);
	   	 	os.processInstance.searchParameter.definitionKey= data.definitionKey;
	   	 	//alert(os.historyProcess.searchParameter.processName);
	   	 	
	   	 	$('#instanceProcessSearchDlg').dialog('close');
	   	 	$('#datagridProcessInstance').datagrid({
	   	 		queryParams : {
				definitionKey:os.processInstance.searchParameter.definitionKey
			}
	   	 	});
	   	 };
	     os.processInstance.destroy=function(){
	       var ids = [];
				var rows = $('#datagridProcessInstance').datagrid('getSelections');
				
                if (rows.length > 0){  
               		 for ( var i = 0; i < rows.length; i++) {
							ids.push(rows[i].id);
					}
                    $.messager.confirm('确认','确实要删除选中的流程实例吗?',function(r){  
                        if (r){  
                            $.post('processInstanceController.do?delete',{ids:ids.join(',')},function(result){  
                                if (result.success){  
                                    $('#datagridProcessInstance').datagrid('reload');    // reload the user data  
                                    $('#datagridProcessInstance').datagrid('unselectAll');
                                } else {  
                                	
                                    $.messager.show({   // show error message  
                                        title: 'Error',  
                                        msg: result.msg  
                                    });  
                                }  
                            },'json');  
                        }  
                    });  
                }  
	     };
	     os.processInstance.actionRun=function(taskId,description){
	     	//alert(taskID+"-"+description);
	       
			    	//$('#gWindowShenPi').window('refresh',"."+description+"&taskID="+taskID); 
			    	 $('#gWindowShenPi').window({ 
				      title:'流程执行',
        			 // width:320,  
        			  //height:200,
        			  //fit:true, 
        			  //iconCls:node.iconCls,
        			  href:"."+description+"&taskId="+taskId,
        			  //href:"processTaskController.do?toTask&taskID="+taskID,
                      modal:true,
                      //closed:true,
                      cls:"autosize",
                      onLoad:function(){             
                      	$('#gWindowShenPi').window('center'); 
			     		$('#gWindowShenPi').window('resize');  
                      },
                      onClose:function(){        
                      	 // alert("closed!");                       
                      	 $('#datagridHistory').datagrid('reload');    // reload the user data 
                         $('#datagridHistory').datagrid('unselectAll');
                      },
                      maximizable:false,
                      minimizable:false  
                     });   	     	
		};
	     os.processInstance.monitor=function(id,definitionId){
	       //alert("Window Test!");
				      $('#gWindow').window({ 
				      title:'流程监控',
        			 // width:320,  
        			  //height:200,
        			  //fit:true, 
        			  //iconCls:node.iconCls,
                      modal:true,
                      maximizable:false,
                      minimizable:false  
                     });  
			    	$('#gWindow').window('refresh', "processInstanceController.do?monitor&id="+id+"&definitionId="+definitionId);  
			     	//$('#gWindow').window('open');  // open a window  
			    
	     }
            
		//$('#datagridProcessDefine').datagrid().resize();
		$('#datagridProcessInstance').datagrid({
			url : 'processInstanceController.do?list',
			border : true,
			pagination : true,
			//singleSelect:true,
				queryParams : {
				definitionKey:os.processInstance.searchParameter.definitionKey
			},
			sortName : 'processName',
			sortOrder : 'asc',
			idField : 'id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ 
			{
			
				field : 'id',
				checkbox : true
			
			}
			 ] ],
			columns : [ [
			 {
				title : '流程Key',
				field : 'processKey',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ,
			 {
				title : '流程名字',
				field : 'processName',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ,
			{
				title : '开始时间',
				field : 'startTime',
				width : 100,
				sortable : true
				
			} ,
			 {
				field : 'isEnd',
				title : '是否结束',
				sortable : true,
				width : 100
				
			},
			 {
				field : 'isSuspended',
				title : '是否挂起',
				sortable : true,
				width : 100
				
			},
			
			{field:'monitor',title:'监控',width:50,align:'center',  
            formatter:function(value,rec){  
                var btn = '<a class="monitorcls" onclick="os.processInstance.monitor(\''+rec.id+'\',\''+rec.definitionId+'\')" href="javascript:void(0)">编辑</a>';  
                return btn;  
            }  
        } 
		
			
			 ] ],
		 onLoadSuccess:function(data){  
		 $('.monitorcls').linkbutton({text:'监控',plain:true,iconCls:'actionrun'});  
        $('.editcls').linkbutton({text:'执行',plain:true,iconCls:'actionrun'});  
    }  ,
			 toolbar : ['-', {
				text : '查询',
				iconCls : 'searchicon',
				handler : os.processInstance.search
				}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.processInstance.destroy
				}	
			]			
		});
	});
	     
         
</script>

<table id="datagridProcessInstance" >
	
</table>
<div id="instanceProcessSearchDlg" class="easyui-dialog" style="width:360px;height:160px;padding:10px 20px"  
                closed="true" buttons="#dlg-instanceProcessSearch-buttons" data-options="iconCls:'searchicon',modal:true">  
            <div class="ftitle">流程实例查询</div>  
            <form id="instanceProcessSearchForm" method="post">  
             	 <table>  
              
                <tr class="fitem">  
                    <td>  <label>流程:</label> </td>   
                    <td>      <select class="easyui-combobox" name="definitionKey" style="width:200px;">
   								 <option value="">所有</option>
    							 <option value="leave">请假流程</option>
    							 <option value="else">其他流程</option>
						      </select> 
						</td>   
                 </tr> 
                
                 </table>  
             	
            </form>  
            
</div>
      
     
<div id="dlg-instanceProcessSearch-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.processInstance.saveSearchParameter()">查询</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#instanceProcessSearchDlg').dialog('close')">取消</a>  
</div>  
  
 
 