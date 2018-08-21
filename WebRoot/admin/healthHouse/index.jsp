<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.healthHousemanage={};
		os.healthHousemanage.healthHouseEditAction=false;
		os.healthHousemanage.serverURL="";
		
		os.healthHousemanage.addHealthHouse=function (){  
			 os.healthHousemanage.healthHouseEditAction=false;
           		$('#customUserNameID').removeAttr("readonly");  
                $('#healthHousedlg').dialog({iconCls:'icon-add'}).dialog('open').dialog('setTitle','添加');  
                $('#healthHouseForm').form('clear');                
                os.healthHousemanage.serverURL = 'healthHouseController.do?add';  
		};
	os.healthHousemanage.editHealthHouse = function() {

			if ($('#datagridehealthHouse').datagrid('getSelections').length == 1) {

				var row = $('#datagridehealthHouse').datagrid('getSelected');
				if (row) {
					$.ajax({
					    url:"healthHouseController.do?getData&id="+row.dataId,
					    type:"post",
					    datatype:"json",
					    success:function(data){
					    	$('#o_province').combobox('setValue',data.obj.province); 
					    	$('#o_city').combobox('setValue',data.obj.city);
					    	$('#o_area').combobox('setValue',data.obj.area);
					    }
					  });	
					os.healthHousemanage.healthHouseEditAction = true;
					os.healthHousemanage.serverURL = 'healthHouseController.do?edit&id='
							+ row.dataId;
					$('#healthHousedlg').dialog({
						iconCls : 'icon-edit'
					}).dialog('open').dialog('setTitle', '编辑');
					$('#healthHouseForm').form({
						onSubmit : function() {

						},
						onLoadSuccess : function() {

						},
						success : function(data) {

						}
					});
					$('#healthHouseForm').form('load', row);
				}

			} else {
				$.messager.alert('警告', '请选择一条信息进行操作');
			}
		};
		os.healthHousemanage.saveequipment = function() {
			$('#healthHouseForm').form('submit', {
				url : os.healthHousemanage.serverURL,
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
						$('#healthHousedlg').dialog('close'); // close the dialog  
						$('#datagridehealthHouse').datagrid('reload'); // reload the user data 
						$('#datagridehealthHouse').datagrid('unselectAll');
					}
				}
			});
		};

		os.healthHousemanage.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.healthHousemanage.formatStatus = function(val,row){
			if (val == "1") {
				return '正常';
			} else {
				return '故障';
			}
		}
		os.healthHousemanage.destoryHealthHouse = function() {
			var ids = [];
			var rows = $('#datagridehealthHouse').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].dataId);
				}
				$.messager.confirm('确认', '确实要删除该小屋吗?', function(r) {
					if (r) {
						$.post('healthHouseController.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridehealthHouse').datagrid('reload'); // reload the user data  
								$('#datagridehealthHouse')
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

		$('#datagridehealthHouse').datagrid({
			url : 'healthHouseController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'houseNumber',
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
				title : '小屋编号',
				field : 'houseNumber',
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
				field : 'houseName',
				title : '小屋名称',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}, {
				field : 'houseLocation',
				title : '小屋地址',
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
               field : 'responsiblePerson',
               title : '负责人姓名',
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
				field : 'mobile',
				title : '负责人联系方式',
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
				field : 'equipNumbers',
				title : '设备数量',
				sortable : true,
				width : 100,
			} ] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.healthHousemanage.addHealthHouse
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : os.healthHousemanage.editHealthHouse
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.healthHousemanage.destoryHealthHouse
			}]
		});
	});
	
	
	var $province = $('#o_province');  
	 var $city = $('#o_city');  
	 var $Area = $('#o_area'); 
	 var re = /^[0-9]+.?[0-9]*$/;
	 $.ajax({
		    url:"basicDataController.do?getProvince",
		    type:"post",
		    datatype:"json",
		    panelWidth:'auto',
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
		             	    	panelWidth:'auto',
		             	    	valueField:'cityid',  
		                        textField:'city', 
		                        onLoadSuccess:function(){ //第2选中  
		                            var combobox = $city.combobox('getData');
		                            $city.combobox('setText',combobox[0].city).combobox('setValue',combobox[0].cityid);  
// 		                            $city.combobox('setText','-1').combobox('setValue','请选择');  
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
// 		   	                                        $Area.combobox('setText','-1').combobox('setValue','请选择');  
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

<table id="datagridehealthHouse">
</table>

<div id="healthHousedlg" class="easyui-dialog"
	style="width: 560px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-healthHouse-buttons" data-options="modal:true">
	<div class="ftitle">小屋信息</div>
	<form id="healthHouseForm" method="post">
		<table>
			<tr class="fitem">
				<td><label>小屋编号:</label></td>
				<td><input class="easyui-validatebox" name="houseNumber" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>小屋名称:</label></td>
				<td><input class="easyui-validatebox" name="houseName" required="true"></td>
			</tr>
			<tr class="fitem">
				<td><label>小屋地址:</label></td>
				<td><select class="easyui-combobox" name="province"
				     id="o_province">
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
				<td><label>负责人姓名:</label></td>
				<td><input class="easyui-validatebox" name="responsiblePerson"></td>
			</tr>
			<tr class="fitem">
				<td><label>负责人联系方式:</label></td>
				<td><input class="easyui-validatebox" name="mobile"></td>
			</tr>
			<tr class="fitem">
				<td><label>设备数量:</label></td>
				<td><input class="easyui-validatebox" name="equipNumbers"></td>
			</tr>
		</table>
	</form>

</div>
<div id="dlg-healthHouse-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-ok" onclick="os.healthHousemanage.saveequipment()">保存</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#healthHousedlg').dialog('close')">取消</a>
</div>

