
	
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
/*-----------------------图片滚动-----------------------------------------*/
	function $(id) { return document.getElementById(id); }
	function addLoadEvent(func){
	 var oldonload = window.onload;
	 if (typeof window.onload != 'function') {
	  window.onload = func;
	 } else {
	  window.onload = function(){
	   oldonload();
	   func();
	  }
	 }
	}
	function moveElement(elementID,final_x,final_y,interval) {
	  if (!document.getElementById) return false;
	  if (!document.getElementById(elementID)) return false;
	  var elem = document.getElementById(elementID);
	  if (elem.movement) {
	    clearTimeout(elem.movement);
	  }
	  if (!elem.style.left) {
	    elem.style.left = "0px";
	  }
	  if (!elem.style.top) {
	    elem.style.top = "0px";
	  }
	  var xpos = parseInt(elem.style.left);
	  var ypos = parseInt(elem.style.top);
	  if (xpos == final_x && ypos == final_y) {
	  return true;
	  }
	  if (xpos < final_x) {
	    var dist = Math.ceil((final_x - xpos)/10);
	    xpos = xpos + dist;
	  }
	  if (xpos > final_x) {
	    var dist = Math.ceil((xpos - final_x)/10);
	    xpos = xpos - dist;
	  }
	  if (ypos < final_y) {
	    var dist = Math.ceil((final_y - ypos)/10);
	    ypos = ypos + dist;
	  }
	  if (ypos > final_y) {
	    var dist = Math.ceil((ypos - final_y)/10);
	    ypos = ypos - dist;
	  }
	  elem.style.left = xpos + "px";
	  elem.style.top = ypos + "px";
	  var repeat = "moveElement('"+elementID+"',"+final_x+","+final_y+","+interval+")";
	  elem.movement = setTimeout(repeat,interval);
	}
	function classNormal(iFocusBtnID,iFocusTxID){
	 var iFocusBtns= $(iFocusBtnID).getElementsByTagName('li');
	 var iFocusTxs = $(iFocusTxID).getElementsByTagName('li');
	 for(var i=0; i<iFocusBtns.length; i++) {
	  iFocusBtns[i].className='normal';
	  iFocusTxs[i].className='normal';
	 }
	}
	function classCurrent(iFocusBtnID,iFocusTxID,n){
	 var iFocusBtns= $(iFocusBtnID).getElementsByTagName('li');
	 var iFocusTxs = $(iFocusTxID).getElementsByTagName('li');
	 iFocusBtns[n].className='current';
	 iFocusTxs[n].className='current';
	}
	function iFocusChange() {
	 if(!$('ifocus')) return false;
	 $('ifocus').onmouseover = function(){atuokey = true};
	 $('ifocus').onmouseout = function(){atuokey = false};
	 var iFocusBtns = $('ifocus_btn').getElementsByTagName('li');
	 var listLength = iFocusBtns.length;
	 iFocusBtns[0].onmouseover = function() {
	  moveElement('ifocus_piclist',0,0,5);
	  classNormal('ifocus_btn','ifocus_tx');
	  classCurrent('ifocus_btn','ifocus_tx',0);
	 }
	 if (listLength>=2) {
	  iFocusBtns[1].onmouseover = function() {
	   moveElement('ifocus_piclist',0,-225,5);
	   classNormal('ifocus_btn','ifocus_tx');
	   classCurrent('ifocus_btn','ifocus_tx',1);
	  }
	 }
	 if (listLength>=3) {
	  iFocusBtns[2].onmouseover = function() {
	   moveElement('ifocus_piclist',0,-450,5);
	   classNormal('ifocus_btn','ifocus_tx');
	   classCurrent('ifocus_btn','ifocus_tx',2);
	  }
	 }
	 if (listLength>=4) {
	  iFocusBtns[3].onmouseover = function() {
	   moveElement('ifocus_piclist',0,-675,5);
	   classNormal('ifocus_btn','ifocus_tx');
	   classCurrent('ifocus_btn','ifocus_tx',3);
	  }
	 }
	}
	setInterval('autoiFocus()',3000);
	var atuokey = false;
	function autoiFocus() {
	 if(!$('ifocus')) return false;
	 if(atuokey) return false;
	 var focusBtnList = $('ifocus_btn').getElementsByTagName('li');
	 var listLength = focusBtnList.length;
	 for(var i=0; i<listLength; i++) {
	  if (focusBtnList[i].className == 'current') var currentNum = i;
	 }
	 if (currentNum==0&&listLength!=1 ){
	  moveElement('ifocus_piclist',0,-225,5);
	  classNormal('ifocus_btn','ifocus_tx');
	  classCurrent('ifocus_btn','ifocus_tx',1);
	 }
	 if (currentNum==1&&listLength!=2 ){
	  moveElement('ifocus_piclist',0,-450,5);
	  classNormal('ifocus_btn','ifocus_tx');
	  classCurrent('ifocus_btn','ifocus_tx',2);
	 }
	 if (currentNum==2&&listLength!=3 ){
	  moveElement('ifocus_piclist',0,-675,5);
	  classNormal('ifocus_btn','ifocus_tx');
	  classCurrent('ifocus_btn','ifocus_tx',3);
	 }
	 if (currentNum==3 ){
	  moveElement('ifocus_piclist',0,0,5);
	  classNormal('ifocus_btn','ifocus_tx');
	  classCurrent('ifocus_btn','ifocus_tx',0);
	 }
	 if (currentNum==1&&listLength==2 ){
	  moveElement('ifocus_piclist',0,0,5);
	  classNormal('ifocus_btn','ifocus_tx');
	  classCurrent('ifocus_btn','ifocus_tx',0);
	 }
	 if (currentNum==2&&listLength==3 ){
	  moveElement('ifocus_piclist',0,0,5);
	  classNormal('ifocus_btn','ifocus_tx');
	  classCurrent('ifocus_btn','ifocus_tx',0);
	 }
	}
	addLoadEvent(iFocusChange);/*图片滚动结束*/
