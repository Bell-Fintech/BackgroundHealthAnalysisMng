<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="admin/utility/utilityUtils.js"></script>
<script src="jslib/json.js"></script>
<script type="text/javascript">
var letter=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
var num=0;
function add(){
	var formula=$("#formula").val();
	var utilType=$("#utilType").val();
	var jsondata=getModel();
	var num=jsondata.length;
	jsondata=JSON.stringify(jsondata);
	var jsonData={
			'formula':formula,
	        'formulaNum':num,
	        'jsonData':jsondata,
	        'utilType':utilType
	};
	var str='utility_conf.do?add';
	if(getData(jsonData, str)){
		showsuccess();
	}
}
function getNode(){
	var nodeLi=document.createElement("li");
	nodeLi.setAttribute("id", "node"+num);
	var inputBtn=document.createElement("input");
	inputBtn.setAttribute("type","button");
	inputBtn.setAttribute('class','btn');
	inputBtn.setAttribute("value", "删除本条");
	$(inputBtn).click(function(){
		$(this).parent().remove();
		num--;
	});
	var spanTitle=document.createElement("span");
	spanTitle.innerHTML="计算项：";
	var inputTitle=document.createElement("input");
	inputTitle.setAttribute("name", "title");
	var spanUnit=document.createElement("span");
	spanUnit.innerHTML="单位：";
	var inputUnit=document.createElement("input");
	inputUnit.setAttribute('name', 'unit');
	var spanAlgebra=document.createElement("span");
	spanAlgebra.innerHTML="代数标识：";
	var selectAlgebra=document.createElement("select");
	selectAlgebra.setAttribute("name", "algebra");
	selectAlgebra.setAttribute('class', 'select');
	for(var i=0;i<letter.length;i++){
		var option=document.createElement("option");
		option.setAttribute("label", ""+letter[i]);
		option.setAttribute("value", letter[i]);
		selectAlgebra.appendChild(option);
	}
	nodeLi.appendChild(inputBtn);
	nodeLi.appendChild(spanTitle);
	nodeLi.appendChild(inputTitle);
	nodeLi.appendChild(spanUnit);
	nodeLi.appendChild(inputUnit);
	nodeLi.appendChild(spanAlgebra);
	nodeLi.appendChild(selectAlgebra);
	num++;
	return nodeLi;
}
function addLi(){
	var ul=document.getElementById("algebra_ul");
	var li=getNode();
	ul.appendChild(li);
}
function getModel(){
	var jsonDatas=[];
	var ul=document.getElementById("algebra_ul");
	var lis=ul.getElementsByTagName("li");
	for(var i=0;i<lis.length;i++){
		var nodes=lis[i].childNodes;
		var title,unit,algebar;
		for(var j=0;j<nodes.length;j++){
		     switch(nodes[j].name){
		     case "title":
		    	 title=nodes[j].value;
		    	 break;
		     case "unit":
		    	 unit=nodes[j].value;
		    	 break;
		     case "algebra":
		    	 algebar=nodes[j].value;
		    	 break;
		    	 default:
		    		 break;
		     }	
		}
		var liData={title:title,unit:unit,algebar:algebar};
		jsonDatas.push(liData);
	}
	return jsonDatas;
}
</script>
<div>
工具类型:<input id="utilType" />
<input type='button' class='btn' value='提交增加函数' onclick="add()">
<div>
<input type='button' class='btn' value='增加一个代数' onclick="addLi()" />
<ul id="algebra_ul">
</ul>
</div>
<div>
<textarea id="formula" ></textarea>
</div>
</div>