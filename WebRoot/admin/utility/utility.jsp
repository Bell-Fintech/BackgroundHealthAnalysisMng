<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="view/utility/utilityUtils.js"></script>
<link href="css/utility/utility.css" rel="stylesheet">
<script type="text/javascript">
var sc=0;
$(function(){
	var model=getModel();
	showLabel(model[0]);
	var ulLabel=document.getElementById("utils_tility");
	var a0=$(ulLabel).children(":first").children(":first");
	$(a0).trigger("click");
});
function getModel(){
	var model;
	var jsonData=null;
	var str='utility_conf.do?list';
	var data=getData(jsonData, str);
	if(data.success){
		 model=paseData(data.obj);
	}else{
		model="暂无公式";
	}
	return model;
}
function getDiv(sc){
	var model=getModel();
	 showDiv(model[1][sc],model[2][sc]);
}
function showDiv(div,str){
	var divcontent=document.getElementById("utils_content");
	$(divcontent).children().remove();
	divcontent.appendChild(div);
	var span=document.createElement('span');
	span.setAttribute("class","juedui_dw");
	span.setAttribute("style","margin-left:250px;margin-top:80px;");
	span.innerHTML="结果：";
	var result =document.createElement("input");
	result.setAttribute("name", "result");
	result.setAttribute("style","margin-left:290px;margin-top:80px;");
	result.setAttribute("class", "input-mini juedui_dw");
	var input =document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("value", str);
	var button=document.createElement("button");
// 	button.setAttribute("type", "button");
	button.setAttribute("style","margin-left:110px;margin-top:80px;");
	button.setAttribute('class', "btn juedui_dw");
	button.innerHTML="计算";
	button.setAttribute("onclick", 'result()');
	divcontent.appendChild(input);
	divcontent.appendChild(button);
	divcontent.appendChild(span);
	divcontent.appendChild(result);
}
function showLabel(data){
	var ulLabel=document.getElementById("utils_tility");
	var totlewidth=0;
	for(var i=0;i<data.length;i++){
		ulLabel.appendChild(data[i]);
		totlewidth++;
	}
	var lisa=$(ulLabel).children();
	patt(lisa);
	var diva=document.getElementById("full_head");
	diva.setAttribute("style", "width:"+(totlewidth*100+100)+"px");
}
function paseData(data){
	var labels=[];
	var divs=[];
	var strs=[];
	for(var i=0;i<data.length;i++){
		strs.push(data[i].formula);
		var div=document.createElement("div");
// 		div.setAttribute("style", "border:1px solid #000");
// 		var h2=document.createElement("h2");
// 		h2.innerHTML=data[i].utilType;
// 		div.appendChild(h2);
		var li=document.createElement("li");
		var a=document.createElement("button");
		a.setAttribute("class","button");
// 		a.setAttribute("href", "javascript:void(0)");
		a.setAttribute("name", ""+i);
		$(a).click(function(){
			getDiv($(this).attr('name'));
		});
		a.innerHTML=data[i].utilType;
		li.appendChild(a);
		 labels.push(li);
		 var ul=document.createElement("ul");
		 ul.setAttribute('class', "ul-style")
		 var jsondata=JSON.parse(data[i].jsonData);
		 for(var j=0;j<jsondata.length;j++){
			 var lio=document.createElement("li");
// 			 lio.setAttribute("style", "list-style-type:none;");
			 var span=document.createElement("span");
			 span.setAttribute("style","text-align:center;width:200px;");
			 span.innerHTML=jsondata[j].title;
			 var input=document.createElement("input");
			 input.setAttribute("title",jsondata[j].algebar);
			 var span1=document.createElement("span");
			 span1.innerHTML=jsondata[j].unit;
			 lio.appendChild(span);
			 lio.appendChild(input);
			 lio.appendChild(span1);
			 ul.appendChild(lio);
		 }
		 div.appendChild(ul);
		 divs.push(div);
	}
	return [labels,divs,strs];
}
function getResult(){
	var str;
	var nodeResult;
	var ul;
	var div= document.getElementById("utils_content");
	$(div).children().each(function(i,item){
		if(item.tagName=='DIV'){
			$(item).children().each(function(j,p){
				if(p.tagName=="UL"){
					ul=p;
				}
			});
		}else if(item.tagName=='INPUT'){
			if($(item).attr('type')=='hidden'){
				str=item.value;
			}else if(item.name=='result'){
				nodeResult=item;
			}
		}
	});
	return [ul,str,nodeResult];
}
function result(){
      var res=getResult();
      var str=res[1];
      var result=res[2];
     var kvs=paseUl(res[0]);
     for(var i=0;i<kvs.length;i++){
    	 while(-1!=str.indexOf(kvs[i].algebra)){
    		 str=str.replace(kvs[i].algebra,kvs[i].result);
    	 }
     }
     $(result).val(eval(str));
}
function paseUl(ul){
	var sum=[];
	$(ul).children().each(function(i,item){
		$(item).children().each(function(j,p){
			if(p.tagName=="INPUT"){
				var kv={
						algebra:p.title,
						result:p.value
				};
				sum.push(kv);
			}
		});
	});
	return sum;
}
</script>
<!-- <input type="button" value="get" onclick="getModel()" /> -->
<div class="box">
		<div class="box-header well" data-original-title >
			<h3>实用工具
</h3>
		</div >
		<div class="div_head" id="full_head" >
<div>
<ul class='ul_style' id="utils_tility">
</ul>
</div >
<div id="utils_content"   ></div>
</div>
</div>