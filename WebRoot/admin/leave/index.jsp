<script type="text/javascript" charset="UTF-8">
	$(function() {
		os.leaveManage={};
		os.leaveManage.memberUserEditAction=false;
		os.leaveManage.serverURL="";
		os.leaveManage.searchParameter={};
		os.leaveManage.searchParameter.status=0;
		os.leaveManage.searchParameter.startDateBegin="";
		os.leaveManage.searchParameter.startDateEnd="";
		os.leaveManage.query=function (){  
			
                $('#leaveQuerydlg').dialog('open').dialog('setTitle','查询');  
                $('#leaveQueryForm').form('clear');  
                  $('#leaveQueryForm').form('load',{
                 status:os.leaveManage.searchParameter.status,
                 startDateBegin:os.leaveManage.searchParameter.startDateBegin,
				startDateEnd:os.leaveManage.searchParameter.startDateEnd
             });                     
               
		};
		os.leaveManage.saveSearchParameter   =       function (){  
         	var data=$('#leaveQueryForm').form('getData',true);
	   	 	os.leaveManage.searchParameter.status= data.status;
	   	 	os.leaveManage.searchParameter.startDateBegin=data.startDateBegin;
			os.leaveManage.searchParameter.startDateEnd=data.startDateEnd;
	   	 	//alert(os.historyProcess.searchParameter.processName);
	   	 	
	   	 	$('#leaveQuerydlg').dialog('close');
	   	 	$('#datagridLeave').datagrid({
	   	 		queryParams : {
				status:os.leaveManage.searchParameter.status,
				startDateBegin:os.leaveManage.searchParameter.startDateBegin,
				startDateEnd:os.leaveManage.searchParameter.startDateEnd
			}
	   	 	});
            } ; 
		os.leaveManage.formatStatus=    function (val,row){  
                if (val ==1){  
                    return '未启动';  
                } else if(val ==2) {  
                    return '已启动';  
                }else if(val ==3) {  
                    return '申请成功';  
                }  else if(val ==4) {  
                    return '申请失败';  
                }    
        }; 
        $('#leaveQueryForm').form({
				onSubmit: function(){
			},
				onLoadSuccess: function(){
			},
			success:function(data){
			}
		});  
		os.leaveManage.addLeave=function (){  
			 os.leaveManage.memberUserEditAction=false;
         
                $('#leavedlg').dialog('open').dialog('setTitle','添加');  
                $('#leaveForm').form('clear');                
                os.leaveManage.serverURL = 'leaveController.do?add';  
		};
		 os.leaveManage.saveLeave   =       function (){  
                $('#leaveForm').form('submit',{  
                    url: os.leaveManage.serverURL,  
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
                            $('#leavedlg').dialog('close');      // close the dialog  
                            $('#datagridLeave').datagrid('reload');    // reload the user data 
                            $('#datagridLeave').datagrid('unselectAll');
                        }  
                    }  
                });  
            } ; 
             os.leaveManage.startLeave= function (){  
             	   var row = $('#datagridLeave').datagrid('getSelected'); 
             	     if (row){  
                            $.post('leaveController.do?start',{id:row["id"],pid:"leave"},function(result){  
                                if (result.success){  
                                    $('#datagridLeave').datagrid('reload');    // reload the user data  
                                    $('#datagridLeave').datagrid('unselectAll');
                                } else {  
                                	
                                    $.messager.show({   // show error message  
                                        title: 'Error',  
                                        msg: result.msg  
                                    });  
                                }  
                            },'json');  
                        }  
             };
               os.leaveManage.startOneLeave= function (id){  
             	
                            $.post('leaveController.do?start',{id:id,pid:"leave"},function(result){  
                                if (result.success){  
                                    $('#datagridLeave').datagrid('reload');    // reload the user data  
                                    $('#datagridLeave').datagrid('unselectAll');
                                } else {  
                                	
                                    $.messager.show({   // show error message  
                                        title: 'Error',  
                                        msg: result.msg  
                                    });  
                                }  
                            },'json');  
          
             };
              os.leaveManage.deleteOneLeave=function(id){
	      
                    $.messager.confirm('确认','确实要删除选中的请假申请吗?',function(r){  
                        if (r){  
                            $.post('leaveController.do?delete',{ids:id},function(result){  
                                if (result.success){  
                                    $('#datagridLeave').datagrid('reload');    // reload the user data  
                                    $('#datagridLeave').datagrid('unselectAll');
                                } else {  
                                	
                                    $.messager.show({   // show error message  
                                        title: 'Error',  
                                        msg: result.msg  
                                    });  
                                }  
                            },'json');  
                        }  
                    }) 
	     };
		$('#datagridLeave').datagrid({
			url : 'leaveController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {
				status:os.leaveManage.searchParameter.status,
				startDateBegin:os.leaveManage.searchParameter.startDateBegin,
				startDateEnd:os.leaveManage.searchParameter.startDateEnd
			},
			sortName : 'startDate',
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
			}, 
			 {
				title : '状态',
				field : 'status',
				width : 100,
				formatter:os.leaveManage.formatStatus,
				sortable : true
			},
			{
				title : '标题',
				field : 'title',
				width : 200,
				sortable : true
			} ] ],
			columns : [ [ {
				field : 'startDate',
				title : '起始时间',
				width : 100,
				sortable : true
				
			},
			 {
				field : 'days',
				title : '请假天数',
				width : 100,
				sortable : true
				},{field:'opt',width : 200,title:'操作',align:'center',  
            formatter:function(value,rec){
            	var btn=" ";
            	if(rec.status==1)  
            	{
               	 	btn = btn+ '<a class="leaveStartcls" onclick="os.leaveManage.startOneLeave(\''+rec.id+'\')" href="javascript:void(0)">启动</a>'; 
               	 	
               	 }
               	 if(rec.status!=2)  
            	{
               	 	btn =btn+ '<a class="leaveDeletecls" onclick="os.leaveManage.deleteOneLeave(\''+rec.id+'\')" href="javascript:void(0)">删除</a>'; 
               	 	
               	 }
               	 return btn;  
         
           		 }  }
			 ] ],
			 onLoadSuccess:function(data){  
		 		$('.leaveStartcls').linkbutton({text:'启动',plain:true,iconCls:'actionrun'});  
        		$('.leaveDeletecls').linkbutton({text:'删除',plain:true,iconCls:'icon-remove'});  
    		} ,
			 toolbar : ['-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.leaveManage.addLeave
				},	/* '-', {
				text : '启动',
				iconCls : 'icon-edit',
				handler : os.leaveManage.startLeave
				},*/	 
				'-', {
				text : '查询',
				iconCls : 'searchicon',
				handler : os.leaveManage.query
				}/*,'-', 
				{
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.leaveManage.destroyLeave
				}	*/	
			]			
		});
	});
</script>

<table  id="datagridLeave" style="width:700px;height:250px"></table>

   <div id="leavedlg" class="easyui-dialog" style="width:360px;height:220px;padding:10px 20px"  
                closed="true" buttons="#dlg-leave-buttons" data-options="iconCls:'icon-save',modal:true" >  
           
            <form id="leaveForm" method="post">  
              <table>  
              
                <tr class="fitem">  
                    <td>  <label>标题:</label> </td>   
                    <td>  <input name="title" class="easyui-validatebox" required="true"> </td>   
                 </tr> 
                <tr class="fitem">  
                    <td>  <label>原因:</label> </td>   
                    <td>  <input name="reason" class="easyui-validatebox" required="true"> </td>   
                 </tr> 
               
                  <tr class="fitem">  
                    <td>  <label>起始时间:</label>  </td>  
                    <td>   <input class="easyui-datetimebox" name="startDate" required="true"> </td>   
                </tr>
                
                  <tr class="fitem">  
                    <td>  <label>请假天数:</label>  </td>  
                    <td>   <input name="days" required="true"> </td>   
                </tr>
                
                 </table>  
            </form>  
            
        </div>
  <div id="dlg-leave-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.leaveManage.saveLeave()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#leavedlg').dialog('close')">取消</a>  
  </div>    
  
  
  <div id="leaveQuerydlg" class="easyui-dialog" style="width:360px;height:180px;padding:10px 20px"  
                closed="true" buttons="#dlg-leavequery-buttons" data-options="iconCls:'searchicon',modal:true" >  
           
            <form id="leaveQueryForm" method="post">  
              <table>  
              
                <tr class="fitem">  
                    <td>  <label>状态:</label> </td>   
                    <td>      <select class="easyui-combobox" name="status" style="width:200px;">
   								 <option value="0">所有</option>
    							 <option value="1">未启动</option>
    							 <option value="2">已启动</option>
    							 <option value="3">申请成功</option>
    							 <option value="4">申请失败</option>
						      </select> 
						   </td>   
                 </tr> 
              
                  <tr class="fitem">  
                    <td>  <label>起始时间:</label>  </td>  
                    <td>   <input class="easyui-datetimebox" name="startDateBegin" > </td>   
                </tr>
                
                  <tr class="fitem">  
                    <td>  </td>  
                    <td>  <input class="easyui-datetimebox" name="startDateEnd" ></td>   
                </tr>
                
                 </table>  
            </form>  
            
        </div>
  <div id="dlg-leavequery-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.leaveManage.saveSearchParameter()">查询</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#leaveQuerydlg').dialog('close')">取消</a>  
  </div>    
  
  