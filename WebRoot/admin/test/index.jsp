<script type="text/javascript" charset="UTF-8">
	$(function() {

		$('#datagridtest').datagrid({
			url : 'memberRoleController.do?datagrid',
			border : true,
			pagination : true,
			queryParams : {},
			sortName : 'name',
			sortOrder : 'asc',
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
				title : '角色名称',
				field : 'name',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],
			columns : [ [ {
				field : 'comments',
				title : '角色描述',
				sortable : true,
				width : 100,
				editor : {
					type : 'validatebox',
					options : {
						required : false
					}
				}
			} ] ]
		});
	});
</script>

<table class="easyui-datagrid" id="datagridtest" style="width:700px;height:250px"></table>
