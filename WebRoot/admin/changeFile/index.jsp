<%@ page language="java" pageEncoding="UTF-8"%>
<style type="text/css">
</style>
<script>
// $(function () {
//     $(":button").click(function () {
//         ajaxFileUpload();
//     })
// });
function ajaxFileUpload(v) {
	$.messager.progress({
		text : '页面加载中....',
		interval : 100
	});
    $.ajaxFileUpload
    (
        {
            url: 'changeFileController.do?upload', //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'file'+v, //文件上传域的ID
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data)  //服务器成功响应处理函数
            {
           		$.messager.progress('close');
           		$('#template'+v).val(data.obj);
            	$('#img'+v).attr("src",'/change/'+data.obj); 
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
            	$.messager.progress('close');
            	$.messager.show({
					title : 'Error',
					msg : '网络阻塞，稍后重试。'
				});
            }
        }
    )
}
</script>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.template={};
		os.template.templateEditAction=false;
		os.template.serverURL="";
		
		os.template.addtemplate=function (){  
			 os.template.templateEditAction=false;
                $('#templatedlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#templateForm').form('clear');                
                os.template.serverURL = 'changeFileController.do?add';  
		};
	
          
	os.template.edittemplate = function() {
			if ($('#datagridtemplate').datagrid('getSelections').length == 1) {
				var row = $('#datagridtemplate').datagrid('getSelected');
				if (row) {
					os.template.templateEditAction = true;
					os.template.serverURL = 'changeFileController.do?edit&id='
							+ row.id;
					$('#templatedlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#templateForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#templateForm').form('load', row);
				}
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.template.savetemplate = function() {
			$('#templateForm').form('submit', {
				url : os.template.serverURL,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.errorMsg) {
						$.messager.show({
							title : 'Error',
							msg : result.errorMsg
						});
					} else {
						$('#templatedlg').dialog('close'); // close the dialog  
						$('#datagridtemplate').datagrid('reload'); // reload the user data 
						$('#datagridtemplate').datagrid('unselectAll');
					}
				}
			});
		};

		os.template.formatdate = function(val, row) {
			return new Date().Format(val);
		};

		os.template.destroytemplate = function() {
			var ids = [];
			var rows = $('#datagridtemplate').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该条记录吗?', function(r) {
					if (r) {
						$.post('changeFileController.do?del', {
							ids : ids.join(',')
						},
								function(result) {
									if (result.success) {
										$('#datagridtemplate').datagrid(
												'reload'); // reload the user data  
										$('#datagridtemplate').datagrid(
												'unselectAll');
									} else {

										$.messager.show({ // show error message  
											title : 'Error',
											msg : result.msg
										});
									}
								}, 'json');
					}
				});
			}
		};

		$('#datagridtemplate').datagrid({
			url : 'changeFileController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {},
			idField : 'id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				field : 'id',
				checkbox : true
			}, {
				title : '模版名称',
				field : 'templateName',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			}] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.template.addtemplate
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.template.edittemplate
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.template.destroytemplate
			} ]
		});
	});
</script>

<table id="datagridtemplate">
</table>

<div id="templatedlg" class="easyui-dialog"
	style="width: 360px; height: 500px; padding: 10px 20px" closed="true"
	buttons="#dlg-template-buttons" data-options="modal:true">
	<div class="ftitle">信息</div>
		<table>
	
			<tr class="fitem">
				<td><label>模版名称:</label></td>
			</tr>
			<tr>
				<td>
					<form id="templateForm" method="post">
						<input class="easyui-validatebox" type="text" name="templateName">
						<input type="hidden" name="homeBack" id="template1">
						<input type="hidden" name="logoBack" id="template2">
						<input type="hidden" name="tipBack" id="template3">
					</form>
				</td>
			</tr>
	
			<tr>
				<td>首页背景图1500*699</td>
			</tr>
			<tr>
				<td><input type="file" id="file1" name="file" onchange="ajaxFileUpload(1);" /></td>
			</tr>
			<tr>
				<td><img style="width: 50px; height: 50px;" id="img1" src=""></td>
			</tr>
			<tr>
				<td>Logo20*20</td>
			</tr>
			<tr>
				<td><input type="file" id="file2" name="file" onchange="ajaxFileUpload(2);" /></td>
			</tr>
			<tr>
				<td><img style="width: 50px; height: 50px;" id="img2" src=""></td>
			</tr>
			<tr>
				<td>推送窗口背景图260*190</td>
			</tr>
			<tr>
				<td><input type="file" id="file3" name="file" onchange="ajaxFileUpload(3);" /></td>
			</tr>
			<tr>
				<td><img style="width: 50px; height: 50px;" id="img3" src=""></td>
			</tr>
		</table>
</div>

<div id="dlg-template-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok"
		onclick="os.template.savetemplate()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#templatedlg').dialog('close')">取消</a>
</div>

<!-- <div> -->
<!--     <input type="file" id="file1" name="file" /> -->
<!--     <input type="button" value="上传" /> -->
<!--     <img id="img1" alt="上传成功啦" src="" /> -->

<!-- 	<form id="showDataForm" action="changeFileController.do?currentPath" -->
<!-- 		method="post" enctype="multipart/form-data" > -->
<!-- 		<div class="row"> -->
<!-- 			<label for="file"> -->
<!-- 				<h5>文件上传:</h5> -->
<!-- 			</label> <input type="file" name="fileToUpload" multiple="multiple" /> -->
<!-- 		</div> -->
<!-- 		<select name="filePath"> -->
<!-- 			<option value="healthportal/img/userImgs/login_bg1.png">登录页背景&nbsp;1500*699</option> -->
<!-- 			<option value="healthportal/img/userImgs/content_bg.png">首页背景图&nbsp;1500*699</option> -->
<!-- 			<option value="healthportal/img/tipBg.png">首页弹出框背景&nbsp;260*190</option> -->
<!-- 			<option value="healthportal/img/logo_01.png">logo&nbsp;20*20</option> -->
<!-- 		</select> -->
<!-- 		<input type="submit" value="提交"> -->
<!-- 	</form> -->
<!-- </div> -->