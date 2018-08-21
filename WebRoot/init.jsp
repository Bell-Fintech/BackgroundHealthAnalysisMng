<!-- 数据库初始化页面 -->
<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>init database</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">


</head>

<body>
	<div>init database....</div>
	<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" charset="UTF-8">
		$(function() {
			$.ajax({
				url : 'repairController.do?repair',
				dataType : 'json',
				cache : false,
				success : function(r) {
					if (r.success) {
						location.replace('index.jsp');						
					}
				},
				type : "POST",
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.responseText);
				}
			});
		});
	</script>
</body>
</html>
