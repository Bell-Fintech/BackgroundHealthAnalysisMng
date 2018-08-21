
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="onesun.hbm.member.*,java.util.*,onesun.util.*,onesun.model.*"%>
<script type="text/javascript" charset="UTF-8">
	$(function() {
        $('#mymainmenu').tree({
		onClick: function(node){
			if($('#mymainmenu').tree("isLeaf",node))
			{
				alert(node.text);  // alert node text property when clicked
			}	
			}
		});
		os.addTabFun = function(opts) {
			var t = '#centerTabs';
			$.messager.progress({
				text : '页面加载中....',
				interval : 100
			});
			var options = $.extend({
				title : '',
				content : '<iframe src="' + opts.src + '" frameborder="0" style="border:0;width:100%;height:99.2%;"></iframe>',
				closable : true,
				iconCls : ''
			}, opts);
			if ($(t).tabs('exists', options.title)) {
				$(t).tabs('close', options.title);
			}
			$(t).tabs('add', options);
		};

	});
</script>
<div class="easyui-accordion" fit="true" style="overflow: hidden;">
	<!--  <div title="菜单" href="layout/menu.jsp" style="overflow: hidden;"></div>-->
	<div title="系统功能" style="overflow: hidden;">
	    <ul id="mymainmenu" class="easyui-tree"  
            url="mainMenuController.do?datagrid">  
    </ul>  
    </div>
<!-- 	<div title="示例" href="test/easyuidemo.html" style="overflow: hidden;"></div> -->
</div>