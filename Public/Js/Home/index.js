$.ajax({
	        type: "post",
	        dataType: "JSON",
	        async:false,
	        url: URL+"/teaequal",
	        data:{"username":username,"password":password,"code":code},
	        success: function (data) {//data就是返回的那个字符串
	        	if (data==1) {
	        		$("#t_login_error").html("验证码错误");
	            }else if(data==3){
	            	$("#t_login_error").html("用户名或密码错误");
	            }else if(data==2) {
	            	 $("#t_login_error").html("");
	            }
	        }
	    });
		
		var result =  $("#t_login_error").html();
		if(result.length<1){
			return true;
		}else{
			return false;
		}
};

home.s_onsubmit = function(URL){
	var result = home.validate_s_login(URL);
	return result;
};

home.c_onsubmit = function(URL){
	var result = home.validate_c_login(URL);
	return result;
};

home.t_onsubmit = function(URL){
	var result = home.validate_t_login(URL);
	return result;
};


$(document).ready(function(){
	$("#tabsholder2").tytabs({
		prefixtabs:"tabz",
		prefixcontent:"contentz",
		classcontent:"tabscontent",
		tabinit:"1",
		catchget:"tab2",
		fadespeed:"normal"
	});
	
	/* banner图片左右滚动 */
	$(".JQ-slide").Slide({
		effect:"scroolX",
		speed:"normal",
		timer:4000
	});
});

