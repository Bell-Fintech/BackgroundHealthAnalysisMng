function getData(jsonData,str){
	var datas={};
	$.ajax({
		type : "post",
		url : str,
		data : jsonData,
		dataType : "json",
		 async: false,
		success : function(remoteData) {
				datas=remoteData;
		},
		error:function(){
			showmessage("连接错误,请重新登录或检查网络连接！");
		}
	});
	return datas;
}
function patt(lis){
$(lis).each(function(i,item){
	 $(item).children(":first").click(function(){
		 $(item).parent().children().each(function(j,p){
//			 $(p).attr("style","background-color:#ccc");
   		 $(p).children(":first").attr("style","color:#1A1A1A");
   		 $(p).children(":first").attr("class","button black");
		 });
//		 $(item).attr("style","background-color:#007ed6");
		 $(item).children(":first").attr("style","color:#ffffff");
		 $(item).children(":first").attr("class","button");
	 });
	 $(item).children(":first").focus(function(){
//		 $(item).attr("style","background-color:#007ed6");
		 $(item).children(":first").attr("style","color:#ffffff");
		 $(item).children(":first").attr("class","button");
	 });
});
}
function showsuccess(){
//	$("#successfully").html("成功");
//	$("#successfully").attr("style","font-size:30px;font-color:red;text-align:center");
	$("#successfully").teninedialog({
        title:'温馨提示',
        content:'成功',
        showCloseButton:true,
        
	});
}