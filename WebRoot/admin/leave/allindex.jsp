<script type="text/javascript" charset="UTF-8">
	$(function() {
		os.leaveAllManage={};
		os.leaveAllManage.memberUserEditAction=false;
		os.leaveAllManage.serverURL="";
		os.leaveAllManage.searchParameter={};
		os.leaveAllManage.searchParameter.status=0;
		os.leaveAllManage.searchParameter.startDateBegin="";
		os.leaveAllManage.searchParameter.startDateEnd="";
		$('#leaveQueryForm').form({
				onSubmit: function(){
			},
				onLoadSuccess: function(){
			},
			success:function(data){
			}
		});  
		os.leaveAllManage.formatStatus=    function (val,row){  
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
		os.leaveAllManage.query=function (){  
			 os.leaveAllManage.memberUserEditAction=false;
         
                $('#leaveAllQuerydlg').dialog('open').dialog('setTitle','查询');  
                $('#leaveAllQueryForm').form('clear');  
                  $('#leaveAllQueryForm').form('load',{
                 status:os.leaveAllManage.searchParameter.status,
                 startDateBegin:os.leaveAllManage.searchParameter.startDateBegin,
				startDateEnd:os.leaveAllManage.searchParameter.startDateEnd
             });                     
                os.leaveAllManage.serverURL = 'leaveController.do?alldatagrid';  
		};
		 os.leaveAllManage.saveSearchParameter   =       function (){  
         	var data=$('#leaveAllQueryForm').form('getData',true);
	   	 	os.leaveAllManage.searchParameter.status= data.status;
	   	 	os.leaveAllManage.searchParameter.startDateBegin=data.startDateBegin;
			os.leaveAllManage.searchParameter.startDateEnd=data.startDateEnd;
	   	 	//alert(os.historyProcess.searchParameter.processName);
	   	 	
	   	 	$('#leaveAllQuerydlg').dialog('close');
	   	 	$('#datagridAllLeave').datagrid({
	   	 		queryParams : {
				status:os.leaveAllManage.searchParameter.status,
				startDateBegin:os.leaveAllManage.searchParameter.startDateBegin,
				startDateEnd:os.leaveAllManage.searchParameter.startDateEnd
			}
	   	 	});
            } ; 
             os.leaveAllManage.startLeave= function (){  
             	   var row = $('#datagridAllLeave').datagrid('getSelected'); 
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
               os.leaveAllManage.deleteOneLeave=function(id){
	      
                    $.messager.confirm('确认','确实要删除选中的请假申请吗?',function(r){  
                        if (r){  
                            $.post('leaveController.do?delete',{ids:id},function(result){  
                                if (result.success){  
                                    $('#datagridAllLeave').datagrid('reload');    // reload the user data  
                                    $('#datagridAllLeave').datagrid('unselectAll');
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
		$('#datagridAllLeave').datagrid({
			url : 'leaveController.do?alldatagrid',
			border : true,
			pagination : true,
			queryParams : {
				status:os.leaveAllManage.searchParameter.status,
				startDateBegin:os.leaveAllManage.searchParameter.startDateBegin,
				startDateEnd:os.leaveAllManage.searchParameter.startDateEnd
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
				title : '申请人',
				field : 'name',
				width : 100,
				sortable : true
			},
			{
				title : '申请时间',
				field : 'addDate',
				width : 150,
				sortable : true
			},
			 {
				title : '状态',
				field : 'status',
				width : 100,
			    formatter:os.leaveAllManage.formatStatus,
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
				width : 150,
				sortable : true
				
			},
			 {
				field : 'days',
				title : '请假天数',
				width : 100,
				sortable : true
				},
				{field:'opt',width : 200,title:'操作',align:'center',  
            formatter:function(value,rec){
            	var btn=" ";
            	
               	 if(rec.status!=2)  
            	{
               	 	btn =btn+ '<a class="leaveDeletecls" onclick="os.leaveAllManage.deleteOneLeave(\''+rec.id+'\')" href="javascript:void(0)">删除</a>'; 
               	 	
               	 }
               	 return btn;  
         
           		 }  }
			 ] ],
			onLoadSuccess:function(data){  
		 		 
        		$('.leaveDeletecls').linkbutton({text:'删除',plain:true,iconCls:'icon-remove'});  
    		} ,
			 toolbar : ['-', {
				text : '查询',
				iconCls : 'searchicon',
				handler : os.leaveAllManage.query
				}
			]			
		});
	});
</script>

<table  id="datagridAllLeave" style="width:700px;height:250px">
</table>

   <div id="leaveAllQuerydlg" class="easyui-dialog" style="width:360px;height:180px;padding:10px 20px"  
                closed="true" buttons="#dlg-leaveallquery-buttons" data-options="iconCls:'searchicon',modal:true" >  
           
            <form id="leaveAllQueryForm" method="post">  
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
  <div id="dlg-leaveallquery-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.leaveAllManage.saveSearchParameter()">查询</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#leaveAllQuerydlg').dialog('close')">取消</a>  
  </div>    
  