<%@ page language="java"  pageEncoding="UTF-8"%>
 
 <div class="easyui-panel"   style="width:360px;height:400px">  
       <script type="text/javascript">  
       			 function testWindow(){  
           alert("windows test");
        }  
      
        	os.approve={};
			os.approve.toTask=  function (taskId,transition){  
				//alert(taskId+":"+transition);
                $('#leaveApproveForm').form('submit',{  
                    url: "leaveController.do?performTask&taskId="+taskId,  
                    onSubmit: function(param){  
                    	param.transition=transition;
                        return $(this).form('validate');  
                    },  
                    success: function(result){  
                       $('#gWindowShenPi').window('close');
                    }  
                });  
            } 

       </script>
    <center>   
        <form id="leaveApproveForm" method="post" >  
         	  <input type="hidden" name="id" value="${m.id}"/>
              <table>  
              
                <tr class="fitem">  
                    <td>  <label>标题:</label> </td>   
                    <td>  <input name="title" class="easyui-validatebox" required="true" value="${m.title}" <c:if test="${readonly}"> readonly="readonly"</c:if>> </td>   
                 </tr> 
                <tr class="fitem">  
                    <td>  <label>原因:</label> </td>   
                    <td>  <input name="reason" class="easyui-validatebox"  value="${m.reason}" <c:if test="${readonly}"> readonly="readonly"</c:if>> </td>   
                 </tr> 
               
                  <tr class="fitem">  
                    <td>  <label>起始时间:</label>  </td>  
                    <td>   <input class="easyui-datetimebox" name="startDate" required="true" value="${m.startDate}" <c:if test="${readonly}"> data-options="disabled:true"</c:if> <c:if test="${readonly}"> readonly="readonly"</c:if>> </td>   
                </tr>
                
                  <tr class="fitem">  
                    <td>  <label>请假天数:</label>  </td>  
                    <td>   <input name="days" required="true" value="${m.days}" <c:if test="${readonly}"> readonly="readonly"</c:if>> </td>   
                </tr>
                <tr class="fitem">  
                    <td>  <label>审批意见:</label>  </td>  
                    <td>   <input name="comment" > </td>   
                </tr>
                 </table>  

            </form>  
      <div style="margin:10px 0;">  
       <table>  
         <c:forEach var="item" items="${comments}">
          <tr class="fitem">  
           <td>  
			${item['taskName']} -> ${item['comment']}
   			</tr>
   		  </td>  
		</c:forEach>     
     
         
   			</table>  
      </div>
      <div style="margin:10px 0;">  
       <c:forEach var="button" items="${buttons}" >
           <a href="javascript:void(0)" class="easyui-linkbutton" onclick="os.approve.toTask('${taskId}','${button}');">${button}</a> 
        </c:forEach> 
      
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#gWindowShenPi').window('close');">关闭</a>  
    </div>  
    </center>
    </div>  