<%@ page language="java" pageEncoding="UTF-8"%>
<script language="javascript" type="text/javascript" charset="UTF-8">
       function fileSelected() {
           var file = document.getElementById('fileToUpload').files[0];
           var fileName = file.name;
           var file_typename = fileName.substring(fileName.lastIndexOf('.'), fileName.length);
           if (file_typename == '.xls') {//这里限定上传文件文件类型
               if (file) {
            	   document.getElementById("uploadFile").style.visibility="visible";
                  var fileSize = 0;
                  if (file.size > 1024 * 1024)
                     fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
                  else
                      fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
                  document.getElementById('fileName').innerHTML = '文件名: ' + file.name;
                  document.getElementById('fileSize').innerHTML = '大小: ' + fileSize;
              }
          }
          else {
        	  document.getElementById("uploadFile").style.visibility="hidden";
              document.getElementById('fileName').innerHTML = "<span style='color:Red'>错误提示:上传文件应该是.xls后缀而不应该是" + file_typename + ",请重新选择文件</span>"
              document.getElementById('fileSize').innerHTML ="";
          }
      }
  </script>
         <div>
         <a class="easyui-linkbutton" iconCls="icon-ok" 
                      href="downTipsController.do?download" >
                          点击下载Excel文档模板</a>
                          <div>请先下载Excel文档模板， 按照要求填写完信息后将Excel文档上传</div>
  <form id="f1" action="importTipsController.do?tipsUpload" method="post" enctype="multipart/form-data" >
                  <div class="row">
                      <label for="file">
                          <h5> 文件上传:</h5>
                      </label>
                      <input type="file" name="fileToUpload" id="fileToUpload" 
                      multiple="multiple" onchange="fileSelected();" />
                  </div>
                 <div id="fileName" style="padding: 10px" name="file">
                  </div>
                  <div id="fileSize" style="padding: 10px" name="file">
                  </div>
                  <input type="submit" value="提交" id="uploadFile">
                  </form>
          </div>
