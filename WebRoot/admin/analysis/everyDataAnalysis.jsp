<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function getGraph(object,textValue){
	var colors = Highcharts.getOptions().colors;
	var list=[];
	var nameSore=[];
	var stra=[];
	var dataColumnar1=[];
	var categories=[];
	$.ajax({
		type:"post",
		url:"everyAssessAnalysisController.do?data",
		data:{"resultFlag":object},
		dataType : "json",
		async: false,
		success : function (remoteData) {
			 list=remoteData.obj;
			for(var i=0;i<list.length;i++){
				nameSore.push({
		                y:list[i].result,
		                name:list[i].name
		                });
			}
			$('#everyData').highcharts({
				chart:{
					type:'column'
				},
				title:{
					text:textValue
				},
				xAxis:{
					categories: categories
				},
				yAxis:{
					title:{
						text:'百分比'
					}
				},
				legend:{
		            enabled: false
		        },
				plotOptions:{
		            series: {
		                borderWidth: 0,
		                dataLabels: {
		                    enabled: true,
		                    format: '{point.y:.1f}'
		                }
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
		        },
		        series: [{
		            name: '所占百分比',
		            colorByPoint: true,
		            data: nameSore,
		            color: 'white'
		        }]
			});
			$('#everyData').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: textValue
		        },
		        tooltip: {
		    	    pointFormat: '{point.percentage:.1f}%</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    color: '#000000',
		                    connectorColor: '#000000',
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
		                }
		            }
		        },
		        series: [{
		            type: 'pie',
		            data: nameSore
		        }]
		    });
		},
			error:function(){
				alert("error");
			}
		});
}
$(function(){
	getGraph("BMI","BMI");
});
</script>
<div class="row-fluid sortable">
	<div class="box">
		<div class="box-header well" data-original-title>
		</div>
		<div class="box-content">
		<div class="control-group">
						<label class="control-label" for="selectError3">各项评估结果分析</label>
						<div class="controls">
							<select id="selectError3" onchange="getGraph(this.options[this.selectedIndex].value,this.options[this.selectedIndex].innerText);">
								<option value="BMI" selected="selected">BMI</option>
								<option value="pressure">血压</option>
								<option value="sugar">血糖</option>
								<option value="fat">血脂</option>
								<option value="fatRate">体脂肪率</option>
								<option value="waistline">腰围</option>
								<option value="waistHeight">腰围身高比</option>
								<option value="risk">肥胖风险</option>
								<option value="metabolic">代谢综合症</option>
								<option value="atery">动脉粥样硬化指数</option>
							</select>
						</div>
					</div>
		</div>
	</div>
	<div class="box">
		<div class="box-header well" data-original-title>
		</div>
		<div class="box-content">
		<div id="everyData"></div>
		</div>
	</div>
</div>