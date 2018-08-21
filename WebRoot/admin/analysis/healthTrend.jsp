<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8">
var everyDate=[];
var health=[],subHealth=[],patient=[],highRisk=[];
var data=new Array();
$(function () {
	$.ajax({
		url:'healthTrendController.do?trend',
		type:'post',
		ansyc:'false',
		dataType:'json',
		success:function(remoteData){
			var dataObj=remoteData.obj;
			$(dataObj).each(function(n,item){
				everyDate.push(item.date);
				var s=[item.date,item.healthNumber];
				health.push(s);
				var s1=[item.date,item.subHealthNumber];
				subHealth.push(s1);
				var s2=[item.date,item.patientNumber];
				patient.push(s2);
				var s3=[item.date,item.highRiskNumber];
				highRisk.push(s3);
			});
			var h={name:"健康人数",data:health};
			var sh={name:"亚健康人数",data:subHealth};
			var p={name:"慢病人数",data:patient};
			var hr={name:"高危病人人数",data:highRisk};
			data.push(h);
			data.push(sh);
			data.push(p);
			data.push(hr);
			showGraph(everyDate,data);
		}
	});
	
});
function showGraph(everyDate,data){
	Highcharts.setOptions({
	    global: {
	        useUTC: true
	    }
	});
	chart = new Highcharts.Chart({
		chart: {
	    	 renderTo:'container',
// 	        type: 'bubble'
	    },
        title: {
            text: '群体健康趋势',
            x: -20 
        },
        xAxis: {
        	categories:everyDate
        	
        },
        navigator : {
			enabled : true,
			xAxis : {
				dateTimeLabelFormats : {
					title : '时间(秒)',
					second : '%Y-%m-%d<br/>%H:%M:%S',
					minute : '%Y-%m-%d<br/>%H:%M:%S',
					hour : '%Y-%m-%d<br/>%H:%M:%S',
					day : '%Y-%m-%d<br/>%H:%M:%S',
					week : '%Y<br/>%m-%d',
					month : '%Y-%m',
					year : '%Y'
				}
			}
		},
        yAxis: {
            title: {
                text: '人数 (个)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
                valueSuffix: '个',
                headerFormat: '<b>{series.name}</b><br>',
                pointFormat: '{point.y}'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: data
    });
}
</script>
<div>
<div id="container"></div>
</div>