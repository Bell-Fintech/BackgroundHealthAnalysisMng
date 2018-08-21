 <div class="easyui-panel" data-options="fit:true">  
       <script type="text/javascript">  
       			 function testWindow(){  
           alert("windows test");
        }  
       </script>
        <img alt="..." src="${pageContext.request.contextPath }/processInstanceController.do?picture&id=${id}&definitionId=${definitionId}">	   
     <div style="margin:10px 0;">  
        <!--  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="testWindow();">Test</a>  -->
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#gWindow').window('close');">关闭</a>  
    </div>  
</div>  