<script type="text/javascript" charset="UTF-8">
	$(function() {
		  $.extend($.fn.validatebox.defaults.rules, {  
    		passwordequals: {  
       		 	validator: function(value,param){  
           	 	return value == $(param[0]).val();  
        	},  
       		 message: '两次密码不一致。'  
    		} 
		}); 
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
       $('#changMyPasswordForm').form('submit',{  
           url: "memberController.do?savemypassword",  
           onSubmit: function(){  
               return $(this).form('validate');  
           },  
           success: function(result){  
               var result = eval('('+result+')');  
               if (!result.success){  
                   $.messager.show({  
                       title: 'Error',  
                       msg: result.msg  
                   });  
               } else {  
                   $('#gWindow').dialog('close');      // close the dialog       
               }  
           }  
       });  
   }  

</script>
   <div> 
            <form id="changMyPasswordForm" method="post">  
              <table>  
               <tr class="fitem">  
                   <td> <label>旧密码：</label></td>  
                   <td> <input id="oldpassword" name="oldpassword" type="password" class="easyui-validatebox" data-options="required:true" />   </td>  
                 </tr> 
                <tr class="fitem">  
                   <td> <label>密码：</label></td>  
                   <td> <input id="password" name="password" type="password" class="easyui-validatebox" data-options="required:true" />   </td>  
                 </tr> 
                <tr class="fitem">  
                    <td>  <label>重复密码：</label> </td>   
                    <td>  <input id="passwordR" name="passwordR" type="password" class="easyui-validatebox"   
   								 required="required" validType="passwordequals['#password']" />   </td>   
                 </tr> 
                
                 </table>  
            </form>  
      <div>  
           <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveMyPassword()">保存</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#gWindow').dialog('close')">取消</a>  
  </div>  
    </div>         
    