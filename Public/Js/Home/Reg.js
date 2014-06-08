var Reg = {};
Reg.required = function(obj){
	var curVal = $(obj).val();
	var str_name = $(obj).attr("name");
	if($.trim(curVal).length<1){
		$("#"+str_name+"_message").html($(obj).attr("meg")+"不能为空！");
		return false;
	}else{
		$("#"+str_name+"_message").html("");
		return true;
	}
	 return true;
};
Reg.length = function(obj){
	var curVal = $(obj).val();
	var str_name = $(obj).attr("name");
	if($.trim(curVal).length<5 && $.trim(curVal).length>0){
		$("#"+str_name+"_message").html($(obj).attr("meg")+"不能少于5位！");
		return false;
	}else{
		$("#"+str_name+"_message").html("");
		return true;
	}
	 return true;
};
Reg.email = function(obj){
	 var curVal = $(obj).val();
	 var str_name = $(obj).attr("name");
	 if($.trim(curVal).length<1){
		 return false;
	 }else{
		 var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	     if (!reg.test(curVal)) {
	    	 $("#"+str_name+"_message").html($(obj).attr("meg")+"格式不正确！");
	        return false;
	     }else{
	    	 $("#"+str_name+"_message").html("");
	    	 return true;
	     }
	 }
	 return true;
};
Reg.Mobile = function(obj){
	var curVal = $(obj).val();
	var str_name = $(obj).attr("name");
	if($.trim(curVal).length<1){
		return false;
	}else{
		var pattern = /1[3-8]+\d{9}/;
		if (!pattern.test(curVal)) {
			$("#"+str_name+"_message").html($(obj).attr("meg")+"格式不正确！");
			return false;
		}else{
			$("#"+str_name+"_message").html("");
			return true;
		}
	}
	return true;
};
Reg.equal = function(obj){
	var curVal = $(obj).val();
	var preVal=$('#password').val();
	var str_name = $(obj).attr("name");
	if($.trim(curVal)!=$.trim(preVal)){
		$("#"+str_name+"_message").html("二次密码不一致！");
		return false;
	}else{
		$("#"+str_name+"_message").html("");
		 return true;
	}
	return true;
};
Reg.illegal = function(obj){
	  var InString = $(obj).val();
	  var str_name = $(obj).attr("name");
	  var RefString = "<";
	  var RefString2 = "%";
	  var RefString3 = "\"";
	  var RefString4 = ">";
	  var RefString5 = "~";
	  var RefString6 = "&";
	  var RefString7 = "?";
	  var RefString8 = "'";
	  var RefString9 = "-";
	  for (Count = 0; Count < InString.length; Count++) {
		  TempChar = InString.substring(Count, Count + 1);
	         if (		
	        		 (RefString.indexOf(TempChar, 0) == 0) 
	        		 || (RefString2.indexOf(TempChar, 0) == 0) 
	        		 || (RefString3.indexOf(TempChar, 0) == 0) 
	        		 || (RefString4.indexOf(TempChar, 0) == 0) 
	        		 || (RefString5.indexOf(TempChar, 0) == 0)
	        		 || (RefString6.indexOf(TempChar, 0) == 0) 
	        		 || (RefString7.indexOf(TempChar, 0) == 0)
	        		 || (RefString8.indexOf(TempChar, 0) == 0) 
	        	     || (RefString9.indexOf(TempChar, 0) == 0)){
	        	 $("#"+str_name+"_message").html($(obj).attr("meg")+"中含有非法字符（如'-'）！");
	               return false;
	           }else{
	        	   $("#"+str_name+"_message").html("");
	        	   return true;
	           }
	       }
	      return true;
};
Reg.ifexit_Mobile=function(obj){
	var str_name = $(obj).attr("name");
	var curVal = $(obj).val();
	if ($.trim(curVal)==''){
		return false;
	}else{
		$.ajax({
	        type: "post",
	        dataType: "JSON",
	        url: "ifexit_Mobile",
	        data:{"Mobile" : curVal},
	        success: function (data) {//data就是返回的那个字符串
	        	if (data == "0") {
	        		 $("#"+str_name+"_message").html("");
	        		  return true;
	            }else {
	            	 $("#"+str_name+"_message").html($(obj).attr("meg")+"已存在");
	            	 return false;
	            }
	        }
	    });
		 return true;//$("#dName").html("<img src='image/check_right.gif'/>");});
	}
};
Reg.ifexit_email=function(obj){
	var str_name = $(obj).attr("name");
	var curVal = $(obj).val();
	if ($.trim(curVal)==''){
		return false;
	}else{
		$.ajax({
			type: "post",
			dataType: "JSON",
			url: "ifRegEmail",
			data:{"email" : curVal},
			success: function (data) {//data就是返回的那个字符串
				if (data == "0") {
					$("#"+str_name+"_message").html("");
					return true;
				}else {
					$("#"+str_name+"_message").html($(obj).attr("meg")+"已存在");
					return false;
				}
			}
		});
		return true;//$("#dName").html("<img src='image/check_right.gif'/>");});
	}
};
Reg.validate = function(obj){
	var validateTypes = $(obj).attr("validate");//required,email
	var validateArr = validateTypes.split(",");
	
	var vRequired = true;
	var ifexit_email = true;
	var vIllegal = true;
	var vEmail = true;
	var vMobile = true;
	var vEqual = true;
	var lengths = true;
	var ifexit_Mobile = true;
	for(var i=0;i<validateArr.length;i++){
		switch(validateArr[i]){
			case "required" : vRequired = Reg.required(obj);if(!vRequired){return vRequired;}break;
			case "illegal" : vIllegal = Reg.illegal(obj);if(!vIllegal){return vIllegal;}break;
			case "length" : lengths = Reg.length(obj);if(!lengths){return lengths;}break;
			case "email" : vEmail = Reg.email(obj);if(!vEmail){return vEmail;}break;
			case "Mobile" : vMobile = Reg.Mobile(obj);if(!vMobile){return vMobile;}break;
			case "equal" : vEqual = Reg.equal(obj);if(!vEqual){return vEqual;}break;
			case "ifexit_email" :  ifexit_email = Reg.ifexit_email(obj);if(!ifexit_email){return ifexit_email;}break;
			case "ifexit_Mobile" : ifexit_Mobile = Reg.ifexit_Mobile(obj);if(!ifexit_Mobile){return ifexit_Mobile;}break;
		}
	}
	//return (vRequired && lengths && VisChinese && ifexit_code && vifexit_Mobile && ifstudent && vId_card && ifexit_email && vIllegal && vEmail && vEqual);
	return true;
};
Reg.onsubmit = function(obj){
	var result = 1;
	$(obj).find("[validate]").each(function(){
		if(!Reg.validate($(this))){
			result++;
		}else{
			result=1;
		}
	});
	return (result==1?true:false);
};
