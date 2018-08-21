<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		departmentlist();
		$('#departmentcontainer').highcharts({
			exporting : {
				filename : '分组查询'
			},
			chart : {
				type : 'column',
				margin : [ 50, 50, 100, 80 ]
			},
			title : {
				text : '部门'
			},
			xAxis : {
				labels : {
					rotation : -45,
					align : 'right',
					style : {
						fontSize : '13px',
						fontFamily : 'Verdana, sans-serif'
					}
				}
			},
			yAxis : {
				min : 0,
				title : {
					text : '步行步数'
				}
			},
			legend : {
				enabled : false
			},
			tooltip : {
				formatter : function() {
					return '<b>' + this.x + '</b><br/>' + '总步行步数为: ' + this.y;
				}
			},
			series : [ {
				data : []
			} ],
			plotOptions: {                                                             
	            series: {                                                              
	                lineWidth: 1,                                                      
	                point: {                                                           
	                    events: {                                                      
	                        'click': function() { 
	                        	if(this.list.length){
	                        		departmentdrawChart(this.list);
	                        	}
	                        }                                                          
	                    }                                                              
	                }                                                                  
	            }                                                                      
	        }
		});
		initdata();
	});
	function initdata(){
// 		$.post('admin/departmentController.do?sports', function(result) {
// 			departmentdrawChart(result.obj.chartJson.list);
// 		}, 'json');
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'admin/departmentController.do?sports',
			data : $.serializeObject($('#departmentForm')),
			success : function(result) {
// 				departmentdraw(result.obj.chartJson);
				departmentdrawChart(result.obj.chartJson.list);
			}
		});
	}
	function departmentdrawChart(list){
		var trs = '<tr><th>名称</th><th>步数</th></tr>';
		var chart = $('#departmentcontainer').highcharts();
		chart.series[0].setData(list);
		var xname = [];
		$.each(list,function(index,item){
			trs += os.fs('<tr><td>{0}</td><td>{1}</td></tr>', item.name, item.y);
			xname.push(item.name);
		});
		$('.table').html(trs);
		chart.xAxis[0].setCategories(xname,true);
		chart.setTitle({
			text : '分组查询'
		});
	}
	function departmentlist(){
		$.ajax({
	      	url:'admin/departmentController.do?list',  
	   	    type:"post",
	   	    datatype:"json",
	   	    success:function(d){
	   	    	if(d.success){
	   	    		$('#departmentListCombobox').combobox({ 
	         	    	data:d.obj,
	         	    	panelWidth:'auto',
	         	    	valueField:'id',  
	                    textField:'name'
	                 });
	   	    	}else{
	   	    		$.messager.show({ // show error message  
						title : 'Error',
						msg : '获取参数失败'
					});
	   	    	}
	   	    	
	   	    }
		 });
	}
</script>
<form id="departmentForm">
	<table>
		<tr>
			<td>开始时间</td><td><input class="easyui-datebox" name="startTime"></td>
			<td>结束时间</td><td><input class="easyui-datebox" name="endTime"></td>
			<td>年龄</td>
			<td>
			<select name="ageSection" class="easyui-combobox">
				<option selected="selected" value="0">不限</option>
				<option value="1">18岁以下</option>
				<option value="2">18-29岁</option>
				<option value="3">29—40岁</option>
				<option value="4">40岁以上</option>
			</select>
			</td>
			<td>性别:</td>
			<td>
			<select name="sex" class="easyui-combobox">
				<option value="0">女</option>
				<option value="1">男</option>
				<option value="2" selected="selected">不限</option>
			</select>
			</td>
			<td>部门:</td>
			<td>
				<select id="departmentListCombobox"  class="easyui-combobox" name="id" style="width:200px;"> </select>
			</td>
			<td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="initdata()">筛选</a> </td>
		</tr>
	</table>
</form>
<table style="width: 100%; height: 100%">
	<tr>
		<td style="width: 100%">
			<div id="departmentcontainer"></div>
		</td>
		</tr>
		<tr>
		<td valign="top">
			<table class="table" style="margin-left: 20px;">
				<tr>
					<th>名称</th>
					<th>步数</th>
				</tr>
			</table>
		</td>
	</tr>
</table>