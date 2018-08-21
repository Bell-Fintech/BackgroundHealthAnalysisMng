<script type="text/javascript" charset="UTF-8">
	$(function() {
	 $.extend($.fn.validatebox.defaults.rules, {  
    	passwordequals: {  
       		 validator: function(value,param){  
           	 return value == $(param[0]).val();  
        	},  
       	 message: '两次密码不一致。'  
    	} 
    	}
    	
    	)
    });
function changMyPassword(){  
       var row = $('#datagridmember').datagrid('getSelected');  
       if (row){  
        	url = 'memberController.do?changePassword&id='+row.id; 
        	$('#changPasswordForm').form('clear'); 
           $('#memberChangPasswordDlg').dialog('open').dialog('setTitle',"修改密码");        
       }  
   }  
   function saveMyPassword(){  
       $('#changPasswordForm').form('submit',{  
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
                   $('#memberChangPasswordDlg').dialog('close');      // close the dialog  
                    $('#datagridmember').datagrid('unselectAll');
               }  
           }  
       });  
   }  

</script>

            <form id="changMyPasswordForm" method="post">  
              <table>  
               <tr class="fitem">  
                   <td> <label>旧密码</label></td>  
                   <td> <input id="oldpassword" name="oldpassword" type="password" class="easyui-validatebox" data-options="required:true" />   </td>  
                 </tr> 
                <tr class="fitem">  
                   <td> <label>密码:</label></td>  
                   <td> <input id="password" name="password" type="password" class="easyui-validatebox" data-options="required:true" />   </td>  
                 </tr> 
                <tr class="fitem">  
                    <td>  <label>重复密码:</label> </td>   
                    <td>  <input id="passwordR" name="passwordR" type="password" class="easyui-validatebox"   
   								 required="required" validType="passwordequals['#password']" />   </td>   
                 </tr> 
                
                 </table>  
            </form>  
      <div>  
           <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveMyPassword();">Test</a>  
           <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#memberChangMyPasswordDlg').window('close');">Close</a>   
  </div>        
    