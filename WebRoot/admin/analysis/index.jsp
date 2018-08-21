<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.basicmanage={};
		os.basicmanage.equipmentEditAction=false;
		os.basicmanage.serverURL="";
		
		os.basicmanage.addequipment=function (){  
			 os.basicmanage.equipmentEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#basicdlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#basicForm').form("clear");                
                os.basicmanage.serverURL = 'basicDataController.do?add';  
		};
	os.basicmanage.editequipment = function() {

			if ($('#datagridbasic').datagrid('getSelections').length == 1) {

				var row = $('#datagridbasic').datagrid('getSelected');
				if (row) {
					$.ajax({
					    url:"basicDataController.do?getData&id="+row.dataId,
					    type:"post",
					    datatype:"json",
					    success:function(data){
					    	$('#o_province').combobox('setValue',data.obj.province); 
					    	$('#o_city').combobox('setValue',data.obj.city);
					    	$('#o_area').combobox('setValue',data.obj.area);
					    }
					  });	
					os.basicmanage.equipmentEditAction = true;
					os.basicmanage.serverURL = 'basicDataController.do?edit&id='
							+ row.dataId;
					$('#basicdlg').dialog({
						iconCls : 'icon-edit'
						
					}).dialog('open').dialog('setTitle', '编辑');
					$('#basicForm').form({
						onSubmit : function() {
								
						},
						onLoadSuccess : function() {
						},
						success : function(data) {

						}
					});
					$('#basicForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.basicmanage.savebasic = function() {
			$('#basicForm').form('submit', {
				url : os.basicmanage.serverURL,
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
						$('#basicdlg').dialog('close'); // close the dialog  
						$('#datagridbasic').datagrid('reload'); // reload the user data 
						$('#datagridbasic').datagrid('unselectAll');
					}
				}
			});
		};

		os.basicmanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.basicmanage.destoryequipment = function() {
			var ids = [];
			var rows = $('#datagridbasic').datagrid('getSelections');
			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].dataId);
				}
				$.messager.confirm('确认', '确实要删除该组织机构吗?', function(r) {
					if (r) {
						$.post('basicDataController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridbasic').datagrid('reload'); // reload the user data  
								$('#datagridbasic')
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

		$('#datagridbasic').datagrid({
			url : 'basicDataController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'code',
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
				title : '组织机构名称',
				field : 'organizationRealName',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [ {
				field : 'organizationName',
				title : '组织机构简称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'code',
				title : '组织机构编码',
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
				field : 'belongLocation',
				title : '组织机构归属地',
				sortable : true,
				width : 100,
                editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
           },
			{field : 'detectObject',
				title : '检测对象类型',
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
				handler : os.basicmanage.addequipment
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.basicmanage.editequipment
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.basicmanage.destoryequipment
			},'-',{
				
			}]
		});
		
	});
	$.ajax({
	    url:"basicDataController.do?getDetectName",
	    type:"post",
	    datatype:"json",
	    success:function(data){
	        $('#location').combobox({ 
	            data:data.obj,
	            valueField:'detectName', 
	            textField:'detectName',
	        });        
	    }
	  });
 var $province = $('#o_province');  
 var $city = $('#o_city');  
 var $Area = $('#o_area'); 
 var re = /^[0-9]+.?[0-9]*$/;
 $.ajax({
	    url:"basicDataController.do?getProvince",
	    type:"post",
	    datatype:"json",
	    success:function(data){
	    	$province.combobox({ 
	            data:data.obj,
	            valueField:'provinceid', 
	            textField:'province',
	            onChange:function(newValue, oldValue){ 
	                //刷新数据，重新读取省份下的城市，并清空当前输入的值
	               if(newValue != ""&&re.test(newValue)){ 
	                $.ajax({
	                	url:'basicDataController.do?getCity',  
	             	    type:"post",
	             	    datatype:"json",
	             	   data:{"id":newValue},
	             	    success:function(data){
	             	    	$city.combobox({ 
	             	    	disabled:false,  
	             	    	data:data.obj,
	             	    	valueField:'cityid',  
	                        textField:'city', 
	                        onLoadSuccess:function(){ //第1选中  
	                            var combobox = $city.combobox('getData');
	                            $city.combobox('setText',combobox[0].city).combobox('setValue',combobox[0].cityid);  
// 	                            $city.combobox('setText','-1').combobox('setValue','请选择');  
	                        }, 
	                        onChange:function(newValue, oldValue){  
	                        	 if(newValue != ""&&re.test(newValue)){  
	                        		 $.ajax({
	             	                	url:'basicDataController.do?getArea',  
	             	             	    type:"post",
	             	             	    datatype:"json",
	             	             	  panelWidth:'auto',
	             	             	    data:{"id":newValue},
	             	             	    success:function(data){
	             	             	    	$Area.combobox({ 
	             	             	    		data:data.obj,
	             	             	    		valueField:'areaid',  
	     	                                    textField:'area', 
	     	                                   onLoadSuccess:function(){ //第2选中  
	   	                                        var combobox = $Area.combobox('getData');  
// 	   	                                        $Area.combobox('setText','-1').combobox('setValue','请选择');  
	   	                                        $Area.combobox('setText',combobox[0].area).combobox('setValue',combobox[0].areaid);  
	   	                                         }  
	             	             	    	});	
	             	             	    }
	             	             	    }); 
	                        	 }
	                        }
	             	    	});
	             	    }
	                });
	               }
	            }
	    	});
	    }
 });
	               
</script>

<table id="datagridbasic">
</table>

<div id="basicdlg" class="easyui-dialog"
	style="width: 660px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-basicData-buttons" data-options="modal:true">
	<div class="ftitle">基础数据</div>
	<form id="basicForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>组织机构名称:</label></td>
				<td><input class="easyui-validatebox"
					name="organizationRealName" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>组织机构简称:</label></td>
				<td><input class="easyui-validatebox" name="organizationName" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>组织机构编码:</label></td>
				<td><input class="easyui-validatebox" name="code" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>组织机构归属地:</label></td>
				<td><select class="easyui-combobox" name="province"
					required="true" id="o_province">
						<option value="-1">--请选择--</option>
				</select>  <select
					class="easyui-combobox" name="city" id="o_city">
						<option value="-1">--请选择--</option>
				</select>  <select
					class="easyui-combobox" name="area" id="o_area">
						<option value="-1">--请选择--</option>
				</select></td>
			</tr>
			<tr class="fitem">
				<td><label>检测对象类型:</label></td>
				<td><input class="easyui-combobox" name="detectObject"
					id="location" required="true"/></td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-basicData-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.basicmanage.savebasic()">保存</a> <a
		href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#basicdlg').dialog('close')">取消</a>
</div>

