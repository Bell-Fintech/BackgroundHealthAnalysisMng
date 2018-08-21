<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function getGraph(object,textValue){
	var colors = Highcharts.getOptions().colors;
	var dataScore=[];
	var jihe=[];
	var categories=[];
	$.ajax({
		type:"post",
		url:"detectionAnalysisController.do?data",
		data:{"result":object},
		dataType : "json",
		async: false,
		success : function (remoteData) {
			 jihe=remoteData.obj;
			for(var i=0;i<jihe.length;i++){
				dataScore.push({
		                y:jihe[i].result,
		                name:jihe[i].scope
		                });
			}
			$('#dataAnalysis').highcharts({
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
		                    enabled: false,//屏蔽外围数据显示
		                    color: '#000000',
		                    connectorColor: '#000000',
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
		                },
		             showInLegend: true //是否显示图例
		            }
		        },
		        legend: {//图例显示元素
		        	backgroundColor:'#FCFFC5',
		        	enabled:true,
		        	layout: 'vertical',
		        	align: 'right',
		        	verticalAlign: 'top',
		        	borderWidth: 0,
		        	labelFormatter: function() {
		        	return this.name+' ';
		        	},
		        	useHTML:true
		        },
		        series: [{
		            type: 'pie',
		            data: dataScore
		        }]
		    });
		
		},
			error:function(){
				alert("error");
			}
		});
}
$(function(){
	getGraph("waistline","腰围");
});
</script>
<div class="row-fluid sortable">
	<div class="box">
		<div class="box-header well" data-original-title>
		</div>
		<div class="box-content">
		<div class="control-group">
						<label class="control-label" for="selectError3">监测项数据统计</label>
						<div class="controls">
							<select id="selectError3" onchange="getGraph(this.options[this.selectedIndex].value,this.options[this.selectedIndex].innerText);">
								<option value="weight">体重</option>
								<option value="height">身高</option>
								<option value="pressure">血压</option>
								<option value="sugar">血糖</option>
								<option value="waistline" selected="selected">腰围</option>
							</select>
						</div>
					</div>
		</div>
	</div>
	<div class="box">
		<div class="box-header well" data-original-title>
		</div>
		<div class="box-content">
		<div id="dataAnalysis"></div>
		</div>
	</div>
</div>