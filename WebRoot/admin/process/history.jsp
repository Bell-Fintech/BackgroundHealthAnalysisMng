
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.historyProcess={}; 
		os.historyProcess.searchParameter={};
		os.historyProcess.searchParameter.definitionKey="";
		os.historyProcess.memberUserEditAction=false;
		os.historyProcess.serverURL="";
		
	  	 os.historyProcess.search=function(){
	  	 	 $('#historyProcessSearchDlg').dialog('open').dialog('setTitle','历史流程查询'); 
	  	 	  $('#historyProcessSearchForm').form({
							onSubmit: function(){
							},
							onLoadSuccess: function(){
						    },
							success:function(data){
						}
					});  
             $('#historyProcessSearchForm').form('load',{
                 definitionKey:os.historyProcess.searchParameter.definitionKey
             });       
	  	 };
	     
	   	 os.historyProcess.saveSearchParameter=function()
	   	 {	   	 
	   	 	var data=$('#historyProcessSearchForm').form('getData',true);
	   	 	os.historyProcess.searchParameter.definitionKey= data.definitionKey;
	   	 	//alert(os.historyProcess.searchParameter.processName);
	   	 	
	   	 	$('#historyProcessSearchDlg').dialog('close');
	   	 	$('#datagridProcessHistory').datagrid({
	   	 		queryParams : {
				definitionKey:os.historyProcess.searchParameter.definitionKey
			}
	   	 	});
	   	 };
            os.historyProcess.destroy= function (){  
               // var row = $('#datagridmember').datagrid('getSelections');  
                var ids = [];
				var rows = $('#datagridProcessHistory').datagrid('getSelections');
				
                if (rows.length > 0){  
               		 for ( var i = 0; i < rows.length; i++) {
							ids.push(rows[i].id);
					}
                    $.messager.confirm('确认','确实要删除选中的历史流程吗?',function(r){  
                        if (r){  
                            $.post('processHistoryController.do?delete',{ids:ids.join(',')},function(result){  
                                if (result.success){  
                                    $('#datagridProcessHistory').datagrid('reload');    // reload the user data  
                                    $('#datagridProcessHistory').datagrid('unselectAll');
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
		//$('#datagridProcessDefine').datagrid().resize();
		$('#datagridProcessHistory').datagrid({
			url : 'processHistoryController.do?list',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {
				definitionKey:os.historyProcess.searchParameter.definitionKey
			},
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
				title : '结束时间',
				field : 'endTime',
				width : 100,
				sortable : true
				
			} 		
			 ] ],
		 onLoadSuccess:function(data){  
		
    		}  ,
			 toolbar : ['-', {
				text : '查询',
				iconCls : 'searchicon',
				handler : os.historyProcess.search
				}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.historyProcess.destroy
				}	
			]			
		});
	});
	     
         
</script>

<table id="datagridProcessHistory" >
	
</table>


<div id="historyProcessSearchDlg" class="easyui-dialog" style="width:360px;height:160px;padding:10px 20px"  
                closed="true" buttons="#dlg-historyProcessSearch-buttons" data-options="iconCls:'searchicon',modal:true">  
            <div class="ftitle">历史流程查询</div>  
            <form id="historyProcessSearchForm" method="post">  
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
      
     
<div id="dlg-historyProcessSearch-buttons">  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="os.historyProcess.saveSearchParameter()">查询</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#historyProcessSearchDlg').dialog('close')">取消</a>  
</div>  
  
 