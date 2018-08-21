<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.thirdpartyUsermanage={};
		os.thirdpartyUsermanage.thirdpartyUserEditAction=false;
		os.thirdpartyUsermanage.serverURL="";
	
		os.thirdpartyUsermanage.addthirdpartyUser=function (){  
			 os.thirdpartyUsermanage.thirdpartyUserEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#thirdpartyUserdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#thirdpartyUserForm').form("clear");
                os.thirdpartyUsermanage.serverURL = 'thirdpartyUserController.do?add';
                $.ajax({
            		type : 'POST',
            		url : 'thirdpartyUserController.do?queryHealthExamination',
            		dataType : 'json',
            		success : function(msg){
            			$('#healthExamination').empty();
            			for(var i=0;i<msg.length;i++){
            			$("#healthExamination").append("<input type=\"checkbox\" name=\"tjzb\" value='\""+msg[i].abbreviate+"\":\""+msg[i].indicator+"\"'>"+msg[i].indicator+"</checkbox>");
            			}
            		}
                })
                $.ajax({
    				type : 'POST',
    				url : 'thirdpartyUserController.do?queryHealthIndicator',
    				dataType : 'json',
    				success : function(msg){
    					$('#healthIndicator').empty();
    					for(var i=0;i<msg.length;i++){
    					$("#healthIndicator").append("<input type=\"checkbox\" name=\"jkzb\" value='\""+msg[i].abbreviate+"\":\""+msg[i].indicator+"\"'>"+msg[i].indicator+"</checkbox>");
    					}
    				}
       			 })
           	   $.ajax({
    				type : 'POST',
    				url : 'thirdpartyUserController.do?queryHealthInterface',
    				dataType : 'json',
    				success : function(msg){
    					$('#healthInterface').empty();
    					for(var i=0;i<msg.length;i++){
    					$("#healthInterface").append("<input type=\"checkbox\" name=\"jiekou\" value='\""+msg[i].abbreviate+"\":\""+msg[i].interfaceName+"\"'>"+msg[i].interfaceName+"</checkbox>");
    					}
    				}
       			 })
		};
	os.thirdpartyUsermanage.editthirdpartyUser = function() {

			if ($('#datagridethirdpartyUser').datagrid('getSelections').length == 1) {

				var row = $('#datagridethirdpartyUser').datagrid('getSelected');
				if (row) {
					os.thirdpartyUsermanage.thirdpartyUserEditAction = true;
					os.thirdpartyUsermanage.serverURL = 'thirdpartyUserController.do?edit&id='
							+ row.id+'&token='+row.token;
					$('#thirdpartyUserdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					
				    $.ajax({
	            		type : 'POST',
	            		url : 'thirdpartyUserController.do?queryHealthExamination',
	            		dataType : 'json',
	            		success : function(msg){
	            			$('#healthExamination').empty();
	            			for(var i=0;i<msg.length;i++){
	            			$("#healthExamination").append("<input type=\"checkbox\" name=\"tjzb\" value='\""+msg[i].abbreviate+"\":\""+msg[i].indicator+"\"'>"+msg[i].indicator+"</checkbox>");
	            			}
	            		}
	                })
	                $.ajax({
	    				type : 'POST',
	    				url : 'thirdpartyUserController.do?queryHealthIndicator',
	    				dataType : 'json',
	    				success : function(msg){
	    					$('#healthIndicator').empty();
	    					for(var i=0;i<msg.length;i++){
	    					$("#healthIndicator").append("<input type=\"checkbox\" name=\"jkzb\" value='\""+msg[i].abbreviate+"\":\""+msg[i].indicator+"\"'>"+msg[i].indicator+"</checkbox>");
	    					}
	    				}
	       			 })
	           	   $.ajax({
	    				type : 'POST',
	    				url : 'thirdpartyUserController.do?queryHealthInterface',
	    				dataType : 'json',
	    				success : function(msg){
	    					$('#healthInterface').empty();
	    					for(var i=0;i<msg.length;i++){
	    					$("#healthInterface").append("<input type=\"checkbox\" name=\"jiekou\" value='\""+msg[i].abbreviate+"\":\""+msg[i].interfaceName+"\"'>"+msg[i].interfaceName+"</checkbox>");
	    					}
	    				}
	       			 })
					$('#thirdpartyUserForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#thirdpartyUserForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
	 	os.thirdpartyUsermanage.savethirdpartyUser = function() {
	 		
	 		var obj = document.getElementsByName("tjzb");
	 		var temp = "";
	 		var tjzb="";
	 		 for ( var i = 0; i < obj.length; i++) {  
	 		     if (obj[i].checked) {  
	 		     temp = obj[i].value;  
	 		     tjzb = tjzb+","+temp;  
	 		     }
	 		 }
	 		document.getElementById("tj").value="{"+tjzb.substring(1, tjzb.length)+"}";
	 		
	 		obj = document.getElementsByName("jkzb");
	 		temp = "";
	 		var jkzb="";
	 		 for ( var i = 0; i < obj.length; i++) {  
	 		     if (obj[i].checked) {  
	 		     temp = obj[i].value;  
	 		     jkzb = jkzb+","+temp;  
	 		     }
	 		 }
	 		document.getElementById("jk").value="{"+jkzb.substring(1, jkzb.length)+"}";
	 		
	 		obj = document.getElementsByName("jiekou");
	 		temp = "";
	 		var jiekou="";
	 		 for ( var i = 0; i < obj.length; i++) {  
	 		     if (obj[i].checked) {  
	 		     temp = obj[i].value;  
	 		     jiekou = jiekou+","+temp;  
	 		     }
	 		 }
	 		document.getElementById("itf").value="{"+jiekou.substring(1, jiekou.length)+"}";
			
	 		$('#thirdpartyUserForm').form('submit', {
				url : os.thirdpartyUsermanage.serverURL,
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
						$('#thirdpartyUserdlg').dialog('close'); // close the dialog  
						$('#datagridethirdpartyUser').datagrid('reload'); // reload the user data 
						$('#datagridethirdpartyUser').datagrid('unselectAll');
						$('#healthExamination').empty();
						$('#healthIndicator').empty();
						$('#interfaceName').empty();
					}
				}
			});
		}; 
		os.thirdpartyUsermanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.thirdpartyUsermanage.formatStatus = function(val,row){
			if (val == "1") {
				return '启用';
			} else {
				return '禁用';
			}
		}
		os.thirdpartyUsermanage.destorythirdpartyUser = function() {
			var ids = [];
			var rows = $('#datagridethirdpartyUser').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				$.messager.confirm('确认', '确实要删除该版本吗?', function(r) {
					if (r) {
						$.post('thirdpartyUserController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridethirdpartyUser').datagrid('reload'); // reload the user data  
								$('#datagridethirdpartyUser')
										.datagrid('unselectAll');
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

		$('#datagridethirdpartyUser').datagrid({
			url : 'thirdpartyUserController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'id',
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
			} ] ],
			columns : [ [ {
				field : 'name',
				title : '第三方机构名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'username',
				title : '用户名',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'password',
				title : '密码',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'token',
				title : '令牌',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'healthExamination',
				title : '体检指标',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'healthIndicator',
				title : '健康指标',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'interfaceName',
				title : '接口',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'status',
				title : '状态',
				sortable : true,
				width : 100,
				formatter : os.thirdpartyUsermanage.formatStatus
			} ] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.thirdpartyUsermanage.addthirdpartyUser
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.thirdpartyUsermanage.editthirdpartyUser
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.thirdpartyUsermanage.destorythirdpartyUser
			}]
		});
		
	});

	
	
</script>

<head>
<base href="<%=basePath%>">
</head>
	<table id="datagridethirdpartyUser">
	</table>
<div id="thirdpartyUserdlg" class="easyui-dialog"
	style="width: 450px; height: 380px; padding: 10px 20px" closed="true"
	buttons="#dlg-thirdpartyUser-buttons" data-options="modal:true">
	<div class="ftitle">用户信息</div>
	<form id="thirdpartyUserForm" method="post" enctype="multipart/form-data" >
		<table>
			<tr class="fitem">
				<td><label>第三方机构名称:</label></td>
				<td><input class="easyui-validatebox" name="name" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>用户名:</label></td>
				<td><input class="easyui-validatebox" name="username" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>密码：</label></td>
				<td><input class="easyui-validatebox" name="password" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>体检指标：</label></td>
				<td><div id="healthExamination"></div><input type="hidden" id="tj" name="tj"></td>
			</tr>
			<tr class="fitem">
				<td><label>健康指标：</label></td>
				<td><div id="healthIndicator"></div><input type="hidden" id="jk" name="jk"></td>
			</tr>
			<tr class="fitem">
				<td><label>接口：</label></td>
				<td><div id="healthInterface"></div><input type="hidden" id="itf" name="itf"></td>
			</tr>
				<tr class="fitem">
				<td><label>用户状态:</label></td>
				<td><select class="easyui-combobox" name="status" required="true"><option
							value="1">启用</option>
						<option value="0">禁用</option>
				</select></td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-thirdpartyUser-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.thirdpartyUsermanage.savethirdpartyUser()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#thirdpartyUserdlg').dialog('close')">取消</a>
</div>