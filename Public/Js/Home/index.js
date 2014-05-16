var home = {};

home.validate_s_login=function(URL){
	var id_card = $.trim($("#s_id_card").val());
	var password = $.trim($("#s_password").val());
	var code = $.trim($("#s_code").val());
	
	if(id_card.length<1){
		$("#s_login_error").html("身份证不能为空");
		return false;
	}else{
		$("#s_login_error").html("");
	}
	
	if(password.length<1){
		$("#s_login_error").html("密码不能为空");
		return false;
	}else{
		$("#s_login_error").html("");
	}
	
	if(code.length<1){
		$("#s_login_error").html("验证码不能为空");
		return false;
	}else{
		$("#s_login_error").html("");
	}
	
	$.ajax({
        type: "post",
        dataType: "JSON",
        async:false,
        url: URL+"/studentequal",
        data:{"id_card":id_card,"password":password,"code":code},
        success: function (data) {//data就是返回的那个字符串
        	if (data==1) {
        		$("#s_login_error").html("验证码错误");
            }else if(data == 3) {
           	 $("#s_login_error").html("身份证或密码错误");
           }else if(data == 2) {
            	 $("#s_login_error").html("");
            }
        }
    });
	
	var result =  $("#s_login_error").html();
	if(result.length<1){
		return true;
	}else{
		return false;
	}
};

home.validate_c_login=function(URL){
	var email = $.trim($("#c_email").val());
	var password = $.trim($("#c_password").val());
	var code = $.trim($("#c_code").val());
	
	if(email.length<1){
		$("#c_login_error").html("邮箱不能为空");
		return false;
	}else{
		$("#c_login_error").html("");
	}
	
	if(password.length<1){
		$("#c_login_error").html("密码不能为空");
		return false;
	}else{
		$("#c_login_error").html("");
	}
	
	if(code.length<1){
		$("#c_login_error").html("验证码不能为空");
		return false;
	}else{
		$("#c_login_error").html("");
	}
	
		$.ajax({
	        type: "post",
	        dataType: "JSON",
	        async:false,
	        url: URL+"/companyequal",
	        data:{"email":email,"password":password,"code":code},
	        success: function (data) {//data就是返回的那个字符串
	        	if (data==1) {
	        		$("#c_login_error").html("验证码错误");
	            }else if(data==3){
	            	$("#c_login_error").html("邮箱或密码错误");
	            }else if(data==2) {
	            	 $("#c_login_error").html("");
	            }
	        }
	    });
	
		var result =  $("#c_login_error").html();
		if(result.length<1){
			return true;
		}else{
			return false;
		}
};

home.validate_t_login=function(URL){
	var username = $.trim($("#t_username").val());
	var password = $.trim($("#t_password").val());
	var code = $.trim($("#t_code").val());
	
	if(username.length<1){
		$("#t_login_error").html("用户名不能为空");
		return false;
	}else{
		$("#t_login_error").html("");
	}
	
	if(password.length<1){
		$("#t_login_error").html("密码不能为空");
		return false;
	}else{
		$("#t_login_error").html("");
	}
	
	if(code.length<1){
		$("#t_login_error").html("验证码不能为空");
		return false;
	}else{
		$("#t_login_error").html("");
	}
	
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

