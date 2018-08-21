<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8"> 
	$(function() {
		$('#datagridAnalysisResult').datagrid({
			url : 'admin/analysisResultController.do?datagrid',
			border : true,
			pagination : true,
			//singleSelect:true,
			queryParams : {},
			idField : 'id',
			striped : true,
			fit : true,
			fitColumns : true,
			title : '',
			rownumbers : false,
			frozenColumns : [ [ {
				field : 'id',
				checkbox : true
			}, {
				title : '姓名',
				field : 'name',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			},{
				field : 'mail',
				title : '邮箱',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			} ] ],
			columns : [ [ {
				field : 'yangxu',
				title : '阳虚质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'yinxu',
				title : '阴虚质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'qixu',
				title : '气虚质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'tanshi',
				title : '痰湿质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'shire',
				title : '湿热质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'xueyu',
				title : '血瘀质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'tebing',
				title : '特禀质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'qiyu',
				title : '气郁质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			},{
				field : 'heping',
				title : '平和质',
				sortable : true,
				width : 30,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			}] ]
		});
	});
</script>

<table id="datagridAnalysisResult">

</table>
