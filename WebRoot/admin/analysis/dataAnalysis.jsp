<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	var colors = Highcharts.getOptions().colors;
	var list=[];
	var nameSore=[];
	var stra=[];
	var dataColumnar1=[];
	$.ajax({
		type:"post",
		url:"dataAnalysisController.do?result",
		dataType : "json",
		async: false,
		success : function (remoteData) {
			var dataObj=remoteData.obj;
			for(var i=0;i<dataObj.length;i++){
				nameSore.push({
		                y:dataObj[i].result,
		                name:dataObj[i].name
		                });
			}
			$('#laestData').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: '总体指标'
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
	
	
});
</script>
<div class="row-fluid sortable">
	<div class="box">
		<div class="box-header well" data-original-title>
		</div>
		<div class="box-content">
		<div id="laestData" class="span4"></div>
		</div>
	</div>
</div>