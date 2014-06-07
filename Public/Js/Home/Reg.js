
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
	if($.trim(curVal).length<6 && $.trim(curVal).length>0){
		$("#"+str_name+"_message").html($(obj).attr("meg")+"不能少于6位！");
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

Reg.ifexit_idcard = function(obj){
	//用户名是否存在
	var idcard = $(obj).val();
	var id_card = $(obj).attr("name");
	if($.trim(idcard)==""){
		return false;
	}else{
		$.ajax({
	        type: "post",
	        dataType: "JSON",
	        url: "ifHave",//同模块url
	        data:{"id_card":idcard},
	        success: function (data) {
	        	//data就是返回的那个字符串
	        	if (data == "0") {
	        		 $("#"+id_card+"_message").html("");
	        		 return true;
	            }else if(data == "1") {
	            	 $("#"+id_card+"_message").html("身份证已注册过！");
	            	 return false;
	            }
	        }
		});
		return true;
	}
	 return true;
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
		 return true;
	}
};

Reg.validate = function(obj){
	var validateTypes = $(obj).attr("validate");//required,email
	var validateArr = validateTypes.split(",");
	
	var vRequired = true;
	var ifexit_email = true;
	var vIllegal = true;
	var vEmail = true;
	var vEqual = true;
	var vId_card = true;
	var lengths = true;
	
	for(var i=0;i<validateArr.length;i++){
		switch(validateArr[i]){
			case "required" : vRequired = Reg.required(obj);if(!vRequired){return vRequired;}break;
			case "illegal" : vIllegal = Reg.illegal(obj);if(!vIllegal){return vIllegal;}break;
			case "length" : lengths = Reg.length(obj);if(!lengths){return lengths;}break;
			case "email" : vEmail = Reg.email(obj);if(!vEmail){return vEmail;}break;
			case "equal" : vEqual = Reg.equal(obj);if(!vEqual){return vEqual;}break;
			case "ifexit_email" :  ifexit_email = Reg.ifexit_email(obj);if(!ifexit_email){return ifexit_email;}break;
			case "ifexit_idcard" : vIfexit_idcard = Reg.ifexit_idcard(obj);if(!vIfexit_idcard){return vIfexit_idcard;}break;
		}
	}
	//return (vRequired && lengths && VisChinese && ifexit_code && vIfexit_idcard && ifstudent && vId_card && ifexit_email && vIllegal && vEmail && vEqual);
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
