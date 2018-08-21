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
		os.equipmentmanage.addequipment=function (){  
			 os.equipmentmanage.equipmentEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#equipdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#equipForm').form("clear");
                /* document.getElementById("other").setAttribute("hidden","true"); */
                os.equipmentmanage.serverURL = 'equipmentController.do?addImage';
		};
	os.equipmentmanage.editequipment = function() {

			if ($('#datagridequipment').datagrid('getSelections').length == 1) {

				var row = $('#datagridequipment').datagrid('getSelected');
				if (row) {
					os.equipmentmanage.equipmentEditAction = true;
					os.equipmentmanage.serverURL = 'equipmentController.do?editImage&id='
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
					$("input[name=belongLocation]").siblings("input").val(row.equipment.healthHouses[0].houseName);
					$("input[name=equipmentId]").siblings("input").val(row.equipment.equipmentName);
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
		/* os.equipmentmanage.formatStatus = function(val,row){
			if (val == "1") {
				return '正常';
			} else {
				return '故障';
			}
		} */
		os.equipmentmanage.destoryequipment = function() {
			var ids = [];
			var rows = $('#datagridequipment').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].dataId);
				}
				$.messager.confirm('确认', '确实要删除该图片吗?', function(r) {
					if (r) {
						$.post('equipmentController.do?deleteImage', {
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
			url : 'equipmentController.do?getDataGridForImage',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'dataId',
			sortOrder : 'desc',
			idField : 'dataId',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			/* onLoadSuccess : function(msg) {
				alert(JSON.stringify(msg));
			}, */
			frozenColumns : [ [ {
				field : 'dataId',
				checkbox : true
			}/* ,
			{
				field : 'equipmentId',
				title : '设备名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				},
				formatter : function(value,row,index) {
					if (row.equipment.equipmentName){
				           return row.equipment.equipmentName;
				          } else {
				           return row.equipment.equipmentName;
				          }
				}
			} */] ],
			columns : [ [ /*{
				field : 'equipment',
				title : '设备名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				},
				formatter : function(value,row,index) {
					if (value.equipmentName){
				           return value.equipmentName;
				          } else {
				           return value;
				          }
				}
			},*/
			{
				field : 'equipmentId',
				title : '设备名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				},
				formatter : function(value,row,index) {
					if (row.equipment.equipmentName){
				           return row.equipment.equipmentName;
				          } else {
				           return row.equipment.equipmentName;
				          }
				}
			},
           {
				field : 'equipment',
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
					if (row.equipment.healthHouses[0].houseName){
				           return row.equipment.healthHouses[0].houseName;
				          } else {
				           return value;
				          }
				}
           }, 
			{
				field : 'image',
				title : '说明图',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'imageNumber',
				title : '说明图编号',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
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
            valueField:'dataId', 
            textField:'houseName',
            onChange:function(ddd){ 
              if(ddd=="其他") {
                  document.getElementById("other").removeAttribute("hidden");
                 $('#location').combobox({
                	    editable:false
                	})

              }
              var dataId = $("input[name=belongLocation]").val();
              $.ajax({
            	    url:"equipmentController.do?getEquipments",
            	    type:"post",
            	    data : {"dataId" : dataId},
            	    datatype:"json",
            	    success:function(data){
            	    	$('#equipmentName').combobox({ 
            	            data:data.obj,
            	            valueField:'dataId', 
            	            textField:'equipmentName',
            	            onChange:function(equip){ 
            	            	
            	            }
            	    	});
            	    }
              });
                  
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
	<div class="ftitle">图片信息</div>
	<form id="equipForm" method="post" enctype="multipart/form-data" >
		<table>
			<tr class="fitem">
				<td><label>图片:</label></td>
				<td><input class="easyui-filebox" id="logoname" name="imgs" type="file"/></td>
			</tr>
			<tr class="fitem">
				<td><label>图片编号:</label></td>
				<td><input class="easyui-validatebox" name="imageNumber" required="true"></td>
			</tr>
			<tr class="fitem" id="xiaowu">
				<td><label>归属小屋名:</label></td>
				<td>
				<input class="easyui-combobox" 
							name="belongLocation"
							id="location"/>
				</td>
			</tr>
			
			<tr class="fitem" id="shebei">
				<td><label>设备名:</label></td>
				<td>
				<input class="easyui-combobox" 
							name="equipmentId"
							id="equipmentName"/>
				</td>
			</tr>
			<!-- <tr class="fitem" id="other" hidden="true">
				<td><label>其他:</label></td>
				<td>
				<input class="easyui-validatebox" 
							name="otherbelongLocation"
							/>
				</td>
			</tr> -->
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

