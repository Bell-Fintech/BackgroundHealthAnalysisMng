
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.myTask={}; 
		os.myTask.memberUserEditAction=false;
		os.myTask.serverURL="";
		
	  	 os.myTask.addTask=function(){};
	     os.myTask.destroyTask=function(){};
	     os.myTask.actionRun=function(taskId,description){
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
                      	 $('#datagridMyTask').datagrid('reload');    // reload the user data 
                         $('#datagridMyTask').datagrid('unselectAll');
                      },
                      maximizable:false,
                      minimizable:false  
                     });   	     	
		};
	     os.myTask.monitor=function(id,definitionId){
	       //alert("Window Test!");
				      $('#gWindow').window({ 
				      title:'流程监控',
        			 // width:320,  
        			  //height:200,
        			  //fit:true, 
        			  //iconCls:node.iconCls,
                      modal:true,
                       onLoad:function(){             
                      
                      },
                      maximizable:false,
                      minimizable:false  
                     });  
			    	$('#gWindow').window('refresh', "processInstanceController.do?monitor&id="+id+"&definitionId="+definitionId);  
			     	//$('#gWindow').window('open');  // open a window  
			    
	     }
            
		//$('#datagridProcessDefine').datagrid().resize();
		$('#datagridMyTask').datagrid({
			url : 'processTaskController.do?list',
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
			frozenColumns : [ [ 
			{
			
				field : 'taskID',
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
				field : 'createTime',
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
				field : 'taskName',
				title : '任务名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},
			
			{field:'monitor',title:'监控',width:50,align:'center',  
            formatter:function(value,rec){  
                var btn = '<a class="monitorcls" onclick="os.myTask.monitor(\''+rec.id+'\',\''+rec.definitionId+'\')" href="javascript:void(0)">编辑</a>';  
                return btn;  
            }  
        }  ,
			{field:'opt',title:'操作',width:50,align:'center',  
            formatter:function(value,rec){  
                var btn = '<a class="editcls" onclick="os.myTask.actionRun(\''+rec.taskID+'\',\''+rec.description+'\')" href="javascript:void(0)">编辑</a>';  
                return btn;  
            }  
        }  
		
			
			 ] ],
		 onLoadSuccess:function(data){  
		 $('.monitorcls').linkbutton({text:'监控',plain:true,iconCls:'actionrun'});  
        $('.editcls').linkbutton({text:'执行',plain:true,iconCls:'actionrun'});  
    } /* ,
			 toolbar : ['-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.myTask.addTask
				}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.myTask.destroyTask
				}	
			]	*/		
		});
	});
	     
         
</script>

<table id="datagridMyTask" >
	
</table>

        <div id="myTaskDlg" class="easyui-dialog" style="width:360px;height:160px;padding:10px 20px"  
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
      
     
  <div id="dlg-myTask-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.processdefine.saveProcessDefine()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#processDefineDlg').dialog('close')">取消</a>  
  </div>  
  
  