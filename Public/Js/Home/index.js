/*
	[OElove] (C)2006-2011 OE Development team Inc.
	This is NOT a freeware, use is subject to license terms
	$Id: handle.js 2011-10-18 XiangFeng $
*/

/* 加入收藏 */
function hd_addfavorite(url, title) {
    var vDomainName=window.location.href;
    var description=document.title;
    try{//IE
        window.external.AddFavorite(vDomainName,description);
    }catch(e){//FF
        window.sidebar.addPanel(description,vDomainName,"");
    }
}

/* 设置主页 */
function hd_sethomepage(obj,vrl){
	try{
		obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
	}
	catch(e){
		if(window.netscape) {
			try { 
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");  
			}  
			catch (e){ 
				alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage',vrl);
		}
	}
}

/* 复制链接地址 */
function hd_copyurl(id){
	document.getElementById(id).select();
	hd_copycode(id);
 }
function hd_copycode(id){
	var testCode=document.getElementById(id).value;
	if(hd_copy2Clipboard(testCode)!=false){
		alert("复制成功，您可以使用Ctrl+V 贴到需要的地方去！");
	}
}
hd_copy2Clipboard=function(txt){
	if(window.clipboardData){
		window.clipboardData.clearData();
		window.clipboardData.setData("Text",txt);
	}
	else if(navigator.userAgent.indexOf("Opera")!=-1){
		window.location=txt;
	}
	else if(window.netscape){
		try{
			netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
		}
		catch(e){
			alert("您的firefox安全限制限制您进行剪贴板操作，请打开’about:config’将signed.applets.codebase_principal_support’设置为true’之后重试，相对路径为firefox根目录/greprefs/all.js");
			return false;
		}
		var clip=Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
		if(!clip)return;
		var trans=Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
		if(!trans)return;
		trans.addDataFlavor('text/unicode');
		var str=new Object();
		var len=new Object();
		var str=Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
		var copytext=txt;str.data=copytext;
		trans.setTransferData("text/unicode",str,copytext.length*2);
		var clipid=Components.interfaces.nsIClipboard;
		if(!clip)return false;
		clip.setData(trans,null,clipid.kGlobalClipboard);
	}
}


/* 随机数 */
function hd_rndnum(n) {
	var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	var res = "";
	for(var i = 0; i < n ; i ++) {
		var id = Math.ceil(Math.random()*35);
		res += chars[id];
	}
	return res;
}

/* 错误提示 */
function hd_tips(str, id, s, t) {
	var t = t ? t : 5000;
	var s = s ? true : false;
	try{
		if(s){
			window.scrollTo(0,0);
		}
		$('#d'+id).innerHTML = "<img src='"+_ROOT_PATH+"tpl/static/"+_LANG_PATH+"/images/check_error.gif' width='12' height='12' align='absmiddle' /> " +str+hd_sound('tip');
		$('#'+id).focus();
	}
	catch(e)
	{
	}
	window.setTimeout(function(){$('#d'+id).innerHTML = '';}, t);
}

/* sound */
function hd_sound(file) {
	return '<div style="float:left;"><embed src="'+_ROOT_PATH + 'tpl/static/'+_LANG_PATH+'/images/'+file+'.swf" quality="high" type="application/x-shockwave-flash" height="0" width="0" hidden="true"/></div>';
}


/* 只能由汉字，字母，数字和下横线组合 */
function hd_checkuser(str){  
    var re1 = new RegExp("^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|_|[a-zA-Z0-9])*$");
	if(!re1.test(str)){
		return false;
	}else{
		return true;
	}
}

/* 判断字符长度，一个汉字为2个字符 */
function hd_strlen(s){
	var l = 0;
	var a = s.split("");
	for (var i=0;i<a.length;i++){
		if (a[i].charCodeAt(0)<299){
			l++;
		}else{
			l+=2;
		}
	}
	return l;
}

/**
  $Id: 检查Email是否合法
  retrun true,false
*/
function hd_checkemail(str) {
	var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	return re.test(str);
}

/*
  $Id:: 注册验证用户名
  @params:: username 用户名
  @params:: tipsid 提示框
*/
function hd_check_reguser(username, tipsid){
	if(username != ""){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/checkusername.php",
			cache: false,
			data: {username: username,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg = json[0].msg;
				if(msg == 1){
					$("#"+tipsid).html("<font color='red'>对不起，用户名称格式不正确！</font>");
				}else if(msg == 2){
					$("#"+tipsid).html("<font color='red'>对不起，该用户名称被系统禁止注册！</font>");
				}else if(msg == 3){
					$("#"+tipsid).html("<font color='red'>对不起，该用户名称已被注册！</font>");
				}else if(msg == 4){
					$("#"+tipsid).html("<font color='green'>恭喜你，该用户名称可以注册。</font>");
				}
			},
			error: function() {}
		});
	}
}

/*
  $Id:: 注册验证邮箱
  @params:: email 邮箱
  @params:: tipsid 提示框
*/
function hd_check_regemail(email, tipsid){
	if(email != ""){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/checkemail.php",
			cache: false,
			data: {email: email,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg = json[0].msg;
				if(msg == 1){
					$("#"+tipsid).html("<font color='red'>对不起，邮箱格式不正确！</font>");
				}else if(msg == 2){
					$("#"+tipsid).html("<font color='red'>对不起，该邮箱已被注册！</font>");
				}else if(msg == 3){
					$("#"+tipsid).html("<font color='green'>恭喜你，该邮箱可以注册。</font>");
				}
			},
			error: function() {}
		});
	}
}



/*
  $Id:: 弹出举报会员窗口
  @params:: uid 会员ID
  <dl class="sub_3">
        <dt>投诉举报</dt>
        <dd>若您发现此会员有交友动机不纯、故意中伤、侮辱、提供虚假资料、散步广告等恶劣行为，请向<a href="javascript:void(0);" onclick="hd_complaintbox('162506');">网站投诉&gt;&gt;</a></dd>
      </dl>
*/

function hd_complaintbox(uid) {
	JqueryDialog.Open('举报会员',_ROOT_PATH+'member/complaint.php?touid='+uid+'&r='+hd_rndnum(6), 600, 300);
}

/*
  $Id:: 弹出打招呼窗口
  @params:: uid 会员ID
  @params:: fromtype 未登录窗口显示类型 jdbox或者空
*/
function hd_hibox(uid, fromtype) {
	if(typeof(fromtype) == 'undefined'){
		fromtype = '';
	}
	JqueryDialog.Open('打招呼',_ROOT_PATH+'member/hi.php?touid='+uid+'&r='+hd_rndnum(6)+"&fromtype="+fromtype, 610, 400);
}

/*
  $Id:: 弹出写信窗口
  @params:: uid 会员ID
  @params:: fromtype 未登录窗口显示类型 jdbox或者空
*/
function hd_msgbox(uid, fromtype) {
	if(typeof(fromtype) == 'undefined'){
		fromtype = '';
	}
	JqueryDialog.Open('写信件',_ROOT_PATH+'member/writemsg.php?touid='+uid+'&r='+hd_rndnum(6)+"&fromtype="+fromtype, 610, 350);
}

/*
  $Id:: 弹出阅读信件框
  @params:: uid 会员ID
  @params:: listype 列表显示方式
*/
function hd_readbox(mid, listtype) {
	if(typeof(listtype) == "undefined") {
		listtype = "";
	}
	JqueryDialog.Open('阅读信件',_ROOT_PATH+'member/readmsg.php?action=view&id='+mid+'&listtype='+listtype+'&r='+hd_rndnum(6), 610, 460, 0, 0);
}

/*
  $Id:: 加入关注
  @params:: uid 会员ID
*/
function hd_add_follow(uid){
	var id = parseInt(uid);
	if(id>0){
		$.ajax({
			type: "POST",
			url: URL+"/addAttention",
			//url: _ROOT_PATH + "data/ajax/addtofriend.php",
			cache: false,
			data: {fid: id,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg  = json[0].msg;
				if(msg == 0){
					alert("对不起，您还没登录，不能关注TA！");
				/*}else if(msg == 1){
					alert("对不起，您的好友上限数量已满，请升级会员关注更多的好友。");
				}else if(msg == 2){
					alert("操作失败，您不能关注自己！");*/
				}else if(msg == 3){
					alert("对不起，您已经关注TA了！");
//				}else if(msg == 4){
//					alert("对不起，TA已经在好友黑名单里，请解除后再添加！");
				}else if(msg == 5){
					alert("关注失败！");
				}else{
					alert("关注成功！");
				}
			},
			error: function() {}
		});
	}
}

/*
  $Id:: 取消关注
  @params:: uid 会员ID
*/
function hd_cancel_follow(uid){
	alert(uid);

}


/*
  $Id:: 加入黑名单
  @params:: uid 会员ID 
*/
function hd_add_black(uid){
	var id = parseInt(uid);
	if(id>0){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/addtoblack.php",
			cache: false,
			data: {fid: id,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg  = json[0].msg;
				if(msg == 0){
					alert("对不起，您还没登录，不能加TA进黑名单！");
				}else if(msg == 1){
					alert("对不起，你不能加自己进黑名单！");
				}else if(msg == 2){
					alert("对不起，TA已经在您的黑名单里了！");
				}else if(msg == 3){
					alert("加入黑名单成功！");
				}else if(msg == 4){
					alert("加入黑名单失败！");
				}
			},
			error: function() {}
		});
	}
}


/*
  $Id:: 提交测试准确率
  @params:: tid 测试ID 
  @params:: type 类型 1-准，0-不准
  @params:: tipsid 提示 
*/
function hd_add_testrate(tid,type,tipsid){
	if(typeof(tipsid) == "undefined") {
		tipsid = "";
	}
	var id = parseInt(tid);
	if(id>0){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/testtruerate.php",
			cache: false,
			data: {tid: id, type: type, r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg  = json[0].msg;
				if(msg == 0){
					alert("对不起，您还没登录，不能执行此操作！");
				}else if(msg == 1){
					alert("对不起，您已经提交过了！");
				}else if(msg == 2){
					alert("提交成功");

					if (tipsid != "") {
						$("#"+tipsid).hide();
					}
				}
			},
			error: function() {}
		});
	}
}


/*
  $Id : 保存许愿
*/
function hd_add_wish(){

	var content = $("#content").val();
	var item = $("input[name='wishtype']:checked");
	var len  = item.length;

	if(content==""){
		alert("对不起，许愿内容不能为空！");
		return false;
	}else{
		if(content.length>500){
			alert("对不起，许愿内容限定500字符以内！");
			return false;
		}
	}
	if(len==0) {
	    alert("请选择许愿类型");
		return false;
	}else{
		var wishtype = $("input[name='wishtype']:checked").val();
	}
	var requesturl = document.URL;

	$.ajax({
		type: "POST",
		url: _ROOT_PATH + "data/ajax/addtowish.php",
		cache: false,
		data: {content:content,wishtype:wishtype,r:hd_rndnum(6)},
		dataType: "json",
		beforeSend: function(XMLHttpRequest) {
			XMLHttpRequest.setRequestHeader("request_type","ajax");
		},
		success: function(data) {
			var json = eval(data);
			var msg  = json[0].msg;
			if(msg == 0){
				alert("对不起，您还没登录，不能进行许愿！");
			}
			else if(msg == 1){
				alert("对不起，许愿提交失败！");
			}
			else if(msg == 3) {
				alert('许愿提交成功，请等待审核。');
				$("#content").val('');
			}
			else if(msg == 2){
				alert("许愿提交成功！");
				top.window.location=requesturl;
			}
		},
		error: function() {}
	});

}

/*
  $Id:: 许愿祝福
*/
function hd_add_wishcomment(id){
	var requesturl = document.URL;
	var id = parseInt(id);

	if(id>0){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/addtowishcomment.php",
			cache: false,
			data: {id:id,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg  = json[0].msg;
				var vocontent = json[0].vocontent;
				if(msg == 0){
					alert("对不起，您还没登录，不能进行祝福！");
				}else if(msg == 1){
					alert("对不起，祝福提交失败！");
				}else if(msg == 2){
					alert("祝福提交成功！");
					top.window.location=requesturl;
				}
			},
			error: function() {}
		});
	}
}

/*
  $Id:: 保存成功故事祝福留言
  @params: int id 故事ID
*/
function hd_add_storycomment(id){
	var content = $("#content").val();
	if(content==""){
		alert("对不起，祝福内容不能为空！");
		return false;
	}else{
		if(content.length>500){
			alert("对不起，祝福内容限定500字符以内！");
			return false;
		}
	}
	var requesturl = document.URL;
	var id = parseInt(id);
	if(id>0){

		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/addstorycomment.php",
			cache: false,
			data: {id: id,content: content,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg  = json[0].msg;
				var vocontent = json[0].vocontent;
				if(msg == 0){
					alert("对不起，您还没登录，不能提交祝福！");
				}
				else if(msg == 10){
					alert("对不起，您所在的会员组没有发表祝福的权限，请升级VIP会员。");
				}
				else if(msg == 1){
					alert("对不起，故事不存在或者已删除！");
				}
				else if(msg == 2){
					alert("对不起，祝福提交失败！");
				}
				else if(msg == 4){
					alert('祝福提交成功，请等待审核。');
					$("#content").val('');
				}
				else if(msg == 3){
					alert("祝福提交成功！");
					top.window.location=requesturl;
				}
			},
			error: function() {}
		});
	}
}


/*
  $Id:: 求助建议
  @params: int id 求助ID
*/
function hd_add_askcomment(id){
	var content = $("#content").val();
	if(content==""){
		alert("对不起，建议内容不能为空！");
		return false;
	}else{
		if(content.length>500){
			alert("对不起，建议内容限定500字符以内！");
			return false;
		}
	}

	var requesturl = document.URL;
	var id = parseInt(id);

	if(id>0){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/addaskcomment.php",
			cache: false,
			data: {id: id,privatestatus: 0,content: content,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg  = json[0].msg;
				var vocontent = json[0].vocontent;
				if(msg == 0){
					alert("对不起，您还没登录，不能发表建议！");
				}
				else if (msg == 10) {
					alert("对不起，您所在的会员组没有发表建议的权限，请升级VIP会员。");
				}
				else if(msg == 1){
					alert("对不起，内容不存在或者已删除！");
				}
				else if(msg == 2){
					alert("对不起，发表建议失败！");
				}
				else if(msg == 4){
					alert('提交成功，请等待审核');
					$("#content").val('');
				}
				else if(msg == 3){
					//$("#tip_comment").html("<b>您刚刚的建议是：</b><br />"+vocontent);
					alert("提交成功！");
					top.window.location=requesturl;
				}
			},
			error: function() {}
		});
	}
}

/*
  $Id:: 采纳_求助建议
  @params: int askid 求助ID
  @params: int answerid 回答ID
*/
function hd_accept_answer(askid,answerid){
	if(askid==""){
		alert("提交错误，ID不存在或已删除！");
		return false;
	}
	if(answerid==""){
		alert("提交错误，ID不存在或已删除！");
		return false;
	}
	var requesturl = document.URL;
	$.ajax({
		type: "POST",
		url: _ROOT_PATH + "data/ajax/askacceptanswer.php",
		cache: false,
		data: {askid:askid,answerid: answerid,r:hd_rndnum(6)},
		dataType: "json",
		beforeSend: function(XMLHttpRequest) {
			XMLHttpRequest.setRequestHeader("request_type","ajax");
		},
		success: function(data) {
			var json = eval(data);
			var msg  = json[0].msg;
			if(msg == 0){
				alert("对不起，您还没登录，不能操作建议采纳！");
			}else if(msg == 1){
				alert("对不起，求助内容不存在或者已删除！");
			}else if(msg == 2){
				alert("对不起，您不能采纳自己的建议！");
			}else if(msg == 3){
				alert("采纳成功！");
				top.window.location=requesturl;
			}
		},
		error: function() {}
	});
}


/*
  $Id:: 约会报名
  @params: int id 约会ID
*/
function hd_dating_booking(id){
	if(id==""){
		alert("提交错误，ID不存在或已删除！");
		return false;
	}
	var contact = $("#contact").val();
	var message = $("#message").val();
	if(contact==""){
		alert("您的联系方式不能为空");
		return false;
	}
	if(message==""){
		alert("给发起人的留言不能为空");
		return false;
	}
	if(message.length>200){
		alert("对不起，给发起人的留言只能200个字符以内！");
		return false;
	}
	var requesturl = document.URL;
	$.ajax({
		type: "POST",
		url: _ROOT_PATH + "data/ajax/datingbooking.php",
		cache: false,
		data: {id:id,contact:contact,message:message,r:hd_rndnum(6)},
		dataType: "json",
		beforeSend: function(XMLHttpRequest) {
			XMLHttpRequest.setRequestHeader("request_type","ajax");
		},
		success: function(data) {
			var json = eval(data);
			var msg  = json[0].msg;
			if(msg == 0){
				alert("对不起，您还没登录，不能提交报名！");
			}else if(msg == 1){
				alert("对不起，约会不存在或者已结束报名！");
			}else if(msg == 2){
				alert("对不起，您不能报名自己发起的约会！");
			}else if(msg == 3){
				alert("对不起，该约会的报名时间已结束！");
			}else if(msg == 4){
				alert("对不起，您已经报过名，请不要重复报名！");
			}else if(msg == 5){
				alert("对不起，报名失败！");
			}else if(msg == 6){
				alert("报名成功，请等待发起人审核！");
				top.window.location=requesturl;
			}
		},
		error: function() {}
	});
}

/*
  $Id:: 日记评论
  @params: int id 日记ID
*/
function hd_add_diarycomment(id){
	var content = $("#content").val();
	if(content==""){
		alert("对不起，评论内容不能为空！");
		return false;
	}else{
		if(content.length>500){
			alert("对不起，评论内容限定500字符以内！");
			return false;
		}
	}
	var id = parseInt(id);
	var requesturl = document.URL;

	if(id>0){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/adddiarycomment.php",
			cache: false,
			data: {id: id,content: content,r:hd_rndnum(6)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg  = json[0].msg;
				var vocontent = json[0].vocontent;
				if(msg == 0){
					alert("对不起，您还没登录，不能发表日记评论！");
				}
				else if (msg == 10) {
					alert("对不起，您所在的会员组没有发表评论的权限，请升级VIP会员。");
				}
				else if(msg == 1){
					alert("对不起，日记不存在或者已删除！");
				}
				else if(msg == 2){
					alert("对不起，日记评论失败！");
				}
				else if(msg == 4) {
					alert('评论成功，请等待审核。');
					$("#content").val('');
				}
				else if(msg == 3){
					//$("#tip_comment").html("<b>您刚刚的评论：</b><br />"+vocontent);
					//$("#content").val('');
					alert("评论成功！");
					top.window.location=requesturl;
				}
			},
			error: function() {}
		});
	}
}


/*
  $Id:: 弹出绑定多平台登录
*/
function hd_binding_oauth() {
	JqueryDialog.Open('绑定多平台登录',_ROOT_PATH+'member/oauth.php?r='+hd_rndnum(6), 600, 260);
}


/*
  $Id :: JQbox登录
  @loginname :: 登录用户名/邮箱
  @password :: 密码
  @savecookie :: 是否保存密码
*/
function hd_ajaxlogin(loginname, password, savecookie){
	if(loginname == ''){
		alert("请填写登录帐号");
		return false;
	}
	if(password == ''){
		alert("请填写登录密码");
		return false;
	}
	var requesturl = document.URL;

	$.ajax({
		type: "POST",
		url: _ROOT_PATH + "data/ajax/jdlogin.php",
		cache: false,
		data: {loginname:loginname,password:password,savepass:savecookie,r:hd_rndnum(6)},
		dataType: "json",
		beforeSend: function(XMLHttpRequest) {
			XMLHttpRequest.setRequestHeader("request_type","ajax");
		},
		success: function(data) {
			var json = eval(data);
			var msg  = json[0].msg;
			if(msg == 0){
				alert("对不起，登录帐号格式不正确！");
			}
			else if(msg == 1){
				alert("对不起，该帐号已锁定登录！");
			}
			else if(msg == 2) {
				alert('对不起，该帐号已冻结！');
			}
			else if(msg == 3){
				alert("对不起，登录帐号或密码不正确！");
			}
			//登录成功
			else if(msg == 4) {
				parent.location.reload();
			}
		},
		error: function() {}
	});
}

/*
  $Id:: 弹出AJAX登录窗口
*/
function hd_loginbox() {
	JqueryDialog.Open('会员登录',_ROOT_PATH+'passport.php?mod=jdlogin&r='+hd_rndnum(6), 610, 350);
}


/*
  $Id:: 弹出注册推广页
*/
function hd_promotion() {
	JqueryDialog.Open('注册推广',_ROOT_PATH+'member/promotion.php?r='+hd_rndnum(6), 550, 210);
}

