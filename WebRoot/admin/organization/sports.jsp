<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#organizationcontainer').highcharts({
			exporting : {
				filename : '团队分布'
			},
			chart : {
				type : 'column',
				margin : [ 50, 50, 100, 80 ]
			},
			title : {
				text : '团队'
			},
			xAxis : {
				categories : [ '00-02', '02-04', '04-06', '06-08', '08-10', '10-12', '12-14', '14-16', '16-18', '18-20', '20-22', '22-24' ],
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
					return '<b>' + this.x + '</b><br/>' + '此团队总步行步数为: ' + this.y;
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
                        			organizationdrawChart(this.list);
	                        	}
	                        }                                                          
	                    }                                                              
	                }                                                                  
	            }                                                                      
	        }
		});
		initorganizationdata();
	});
	function initorganizationdata(){
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'admin/organizationController.do?sports',
			data : $.serializeObject($('#organizationForm')),
			success : function(result) {
				organizationdrawChart(result.obj.chartJson.list);
			}
		});
	}
	function organizationdrawChart(list){
		var chart = $('#organizationcontainer').highcharts();
		var trs = '<tr><th>名称</th><th>步数</th></tr>';
		chart.series[0].setData(list);
		var xname = [];
		var sortlist = [];
		$.each(list,function(index,item){
			trs += os.fs('<tr><td>{0}</td><td>{1}</td></tr>', item.name, item.y);
			xname.push(item.name);
			sortlist.push(item.y);
		});
		$('.table').html(trs);
		chart.xAxis[0].setCategories(xname,true);
		chart.setTitle({
			text : '团队结果展示'
		});
	}
	
</script>
<form id="organizationForm">
	<table>
		<tr>
			<td>开始时间</td><td><input class="easyui-datebox" name="startTime"></td>
			<td>结束时间</td><td><input class="easyui-datebox" name="endTime"></td>
			<td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="initorganizationdata()">筛选</a> </td>
		</tr>
	</table>
</form>
<table style="width: 100%; height: 100%">
	<tr>
		<td style="width: 100%">
			<div id="organizationcontainer"></div>
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