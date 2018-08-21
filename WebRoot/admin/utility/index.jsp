<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		os.utility={};
		os.utility.utilityUserEditAction=false;
		os.utility.serverURL="";
		os.utility.add=function (){  
	           $('#utilitydlg').dialog({iconCls:'icon-add',width:700}).dialog('open').dialog('setTitle','添加');  
		};
		os.utility.formatdate = function(val, row) {
			return new Date().Format(val);
		};
		os.utility.destroyutility = function() {
			var ids = [];
			var rows = $('#datagridutility').datagrid('getSelections');

			if (rows.length > 0) {
				for (var i = 0; i < rows.length; i++) {
					ids.push(rows[i].dataID);
				}
				$.messager.confirm('确认', '确实要删除该公式吗?', function(r) {
					if (r) {
						$.post('utility_conf.do?delete', {
							ids : ids.join(',')
						}, function(result) {
							if (result.success) {
								$('#datagridutility').datagrid('reload'); // reload the user data  
								$('#datagridutility')
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

		$('#datagridutility').datagrid({
			url : 'utility_conf.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			idField : 'id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				field : 'dataID',
				checkbox : true
			}, {
				title : '名称',
				field : 'utilType',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			toolbar : [ '-', {
				text : '添加',
				iconCls : 'icon-add',
				handler : os.utility.add
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : os.utility.destroyutility
			}]
		});
	});
</script>
<script src="admin/utility/utilityUtils.js"></script>
<script src="jslib/json.js"></script>
<script type="text/javascript">
var letter=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
var num=0;
function add(){
	var formula=$("#formula").val();
	var utilType=$("#utilType").val();
	var explain=$("#explain").val();
	var resultUnit=$("#resultUnit").val();
	var jsondata=getModel();
	var num=jsondata.length;
	jsondata=JSON.stringify(jsondata);
	var jsonData={
			'formula':formula,
	        'formulaNum':num,
	        'jsonData':jsondata,
	        'utilType':utilType,
	        'explain':explain,
	        'resultUnit':resultUnit
	};
	var str='utility_conf.do?add';
	if(getData(jsonData, str)){
		$('#utilitydlg').dialog('close');
		
		$('#datagridutility').datagrid('reload'); // reload the user data  
		$('#datagridutility')
				.datagrid('unselectAll');
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

<table id="datagridutility">
</table>
<div id="utilitydlg" class="easyui-dialog"
	style="width: 360px; height: 320px; padding: 10px 20px" closed="true"
	buttons="#dlg-customuser-buttons" data-options="modal:true">
<div >
工具名称:<input id="utilType" />
<div>
<input type='button' class='btn' value='增加一个代数' onclick="addLi()" />
<ul id="algebra_ul">
</ul>
</div>
<div>
计算公式:<input id="formula" />
结果单位:<input id="resultUnit" />
</div>
<div>
工具说明:<textarea id="explain" ></textarea>
</div>
<div>
<input type='button' class='btn' value='提交' onclick="add()">
</div>
</div>
</div>
