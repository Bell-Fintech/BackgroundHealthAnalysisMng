<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.equipmentmanage={};
		os.equipmentmanage.equipmentEditAction=false;
		os.equipmentmanage.serverURL="";
		os.equipmentmanage.startequipment = function() {
			if ($('#datagridequipment').datagrid('getSelections').length == 1) {
				$.messager.alert('抱歉', '所选设备不支持远程启动');
			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		}
		os.equipmentmanage.addequipment=function (){  
			 os.equipmentmanage.equipmentEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#equipdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#equipForm').form("clear");
                document.getElementById("other").setAttribute("hidden","true");
                os.equipmentmanage.serverURL = 'equipmentController.do?add';
		};
	os.equipmentmanage.editequipment = function() {

			if ($('#datagridequipment').datagrid('getSelections').length == 1) {

				var row = $('#datagridequipment').datagrid('getSelected');
				if (row) {
					os.equipmentmanage.equipmentEditAction = true;
					os.equipmentmanage.serverURL = 'equipmentController.do?edit&id='
							+ row.dataId;
					$('#equipdlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#equipForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#equipForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
	 	os.equipmentmanage.saveequipment = function() {
			$('#equipForm').form('submit', {
				url : os.equipmentmanage.serverURL,
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
						$('#equipdlg').dialog('close'); // close the dialog  
						$('#datagridequipment').datagrid('reload'); // reload the user data 
						$('#datagridequipment').datagrid('unselectAll');
					}
				}
			});
		}; 
		os.equipmentmanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.equipmentmanage.formatStatus = function(val,row){
			if (val == "1") {
				return '正常';
			} else {
				return '故障';
			}
		}
		os.equipmentmanage.destoryequipment = function() {
			var ids = [];
			var rows = $('#datagridequipment').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].dataId);
				}
				$.messager.confirm('确认', '确实要删除该设备吗?', function(r) {
					if (r) {
						$.post('equipmentController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridequipment').datagrid('reload'); // reload the user data  
								$('#datagridequipment')
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

		$('#datagridequipment').datagrid({
			url : 'equipmentController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'equipmentNumber',
			sortOrder : 'desc',
			idField : 'dataId',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				field : 'dataId',
				checkbox : true
			}, {
				title : '设备编号',
				field : 'equipmentNumber',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [{
				field : 'logo',
				title : '设备图标',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'equipmentName',
				title : '设备名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},
			{
				field : 'describle',
				title : '设备描述',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, 
			{
				field : 'ventor',
				title : '设备厂商',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},
           {
				field : 'healthHouses',
				title : '设备归属小屋名称',
				sortable : true,
				width : 100,
                editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				},
				formatter : function(value,row,index) {
					if (value[0].houseName){
				           return value[0].houseName;
				          } else {
				           return value;
				          }
				}
           },
			{
				field : 'application',
				title : '设备作用',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'img',
				title : '说明图',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, 
			{
				field : 'instruction',
				title : '使用说明',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},
			{
				field : 'status',
				title : '设备状态',
				sortable : true,
				width : 100,
				formatter : os.equipmentmanage.formatStatus
			} ] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.equipmentmanage.addequipment
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.equipmentmanage.editequipment
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.equipmentmanage.destoryequipment
			}/* ,'-',{
				text : '远程启动设备',
				iconCls : 'icon-add',
				handler : os.equipmentmanage.startequipment
			} */]
		});
		
	});
  $.ajax({
    url:"healthHouseController.do?getLocation",
    type:"post",
    datatype:"json",
    success:function(data){
        $('#location').combobox({ 
            data:data.obj,
            valueField:'houseName', 
            textField:'houseName',
            onChange:function(ddd){ 
              if(ddd=="其他") {
                  document.getElementById("other").removeAttribute("hidden");
                 $('#location').combobox({
                	    editable:false
                	})

              }
                  
            }
        });        
    }
  });
	function search(value){
		$('#datagridequipment').datagrid("load",{"belongLocation":value});
	}
	
	function upLoadLogo(){
		var formData = new FormData($( "#equipForm" )[0]);   
		$.ajax({
			type : 'post',
			url : 'equipmentController.do?upLoadLogo',
			data:formData,
			async: true,
			cache: false,   
			contentType: false,   
			processData: false, 
			dataType : 'json',
			success : function(j) {
				alert(j.msg);
			},
			error : function() {
				
				//alert('error');
			}
		})
	}
	
</script>

<head>
<base href="<%=basePath%>">
</head>
<table id="datagridequipment">
<!-- <input id="ss" class="easyui-searchbox"
			prompt="请输入归属小屋名称" menu="#mm" style="width:200px; height: 30px;" searcher="search"></input> -->
</table>

<div id="equipdlg" class="easyui-dialog"
	style="width: 450px; height: 380px; padding: 10px 20px" closed="true"
	buttons="#dlg-equipment-buttons" data-options="modal:true">
	<div class="ftitle">设备信息</div>
	<form id="equipForm" method="post" enctype="multipart/form-data" >
		<table>
			<tr class="fitem">
				<td><label>设备编号:</label></td>
				<td><input class="easyui-validatebox" name="equipmentNumber" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>设备图标:</label></td>
				<td><input class="easyui-filebox" id="logoname" name="imgs" type="file"/></td>
			</tr>
			<tr class="fitem">
				<td><label>设备名称:</label></td>
				<td><input class="easyui-validatebox" name="equipmentName" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>设备厂商:</label></td>
				<td><input class="easyui-validatebox" name="ventor" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>设备状态:</label></td>
				<td><select class="easyui-combobox" name="status" required="true"><option
							value="1">正常</option>
						<option value="0">故障</option>
				</select></td>
			</tr>
			<tr class="fitem">
				<td><label>设备作用:</label></td>
				<td><input class="easyui-validatebox" name="application" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>设备描述:</label></td>
				<td><textarea class="easyui-validatebox" name="describle" ></textarea></td>
			</tr>
			<tr class="fitem">
				<td><label>说明图:</label></td>
				<td><input class="easyui-filebox" id="img" name="imgs" type="file" /></td>
			</tr>
			<tr class="fitem">
				<td><label>使用说明:</label></td>
				<td><textarea class="easyui-validatebox" name="instruction" ></textarea></td>
			</tr>
			<tr class="fitem" id="xiaowu">
				<td><label>归属小屋名:</label></td>
				<td>
				<input class="easyui-combobox" 
							name="belongLocation"
							id="location"/>
				</td>
			</tr>
			<tr class="fitem" id="other" hidden="true">
				<td><label>其他:</label></td>
				<td>
				<input class="easyui-validatebox" 
							name="otherbelongLocation"
							/>
				</td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-equipment-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.equipmentmanage.saveequipment()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#equipdlg').dialog('close')">取消</a>
</div>

