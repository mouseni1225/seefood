<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel='stylesheet prefetch'
	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch' href='//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>

<script>
	window.onload = function() {

		document.getElementById("pwd1").onblur = password;
		document.getElementById("pwd2").onblur = password2;
	}
	//密碼jsp文字驗證
	function password() {
		var thePwd = document.getElementById("pwd1").value;
		var pCheck = document.getElementById("pwd1")
		var thePwdLen = thePwd.length;

		var re1 = /^[a-zA-Z0-9!@#$%\^&*]{8,}$/;
		var re2 = new RegExp("[a-zA-Z]+");
		var re3 = new RegExp("\\d+");
		var re4 = new RegExp("[!@#$%\^&*]+");
		var pwdCheckRes = document.getElementById("pwd12");
		if (re1.test(thePwd) && re2.test(thePwd) && re3.test(thePwd)
				&& re4.test(thePwd)) {
			pwdCheckRes.className = "correct";
			
			pwdCheckRes.innerHTML = "通過";

		} else {
			pwdCheckRes.className = "wrong";
			
			var wrmsg;
			if (thePwd == "") {
				wrmsg = "密碼不可空白";
				pwdCheckRes.innerHTML = wrmsg;
			} else {
				if (thePwdLen < 8)
					wrmsg = " 少於8個字";
				pwdCheckRes.innerHTML = wrmsg;
				if (!re2.test(thePwd))
					wrmsg = " 必須包含英文字母";
				pwdCheckRes.innerHTML = wrmsg;
				if (!re3.test(thePwd))
					wrmsg = " 必須包含數字";
				pwdCheckRes.innerHTML = wrmsg;
				if (!re4.test(thePwd))
					wrmsg = " 必須包含特殊字元";
				pwdCheckRes.innerHTML = wrmsg;

			}

		}
	}

	function password2() {
		var thePwd = document.getElementById("pwd1").value;
		var thePwd2 = document.getElementById("pwd2").value;
		var pwdCheckRes = document.getElementById("pwd22");
		if (thePwd2 == "") {
			pwdCheckRes.innerHTML = "不可空白";
		} else {
			if (thePwd2 == thePwd)
				pwdCheckRes.innerHTML = "一致";
			if (thePwd2 != thePwd)
				pwdCheckRes.innerHTML = "不一致";
		}
	}
</script>
</head>
<body>
	

<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
<header>
  <h1><span>食府</span><br>歡迎你的加入</h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
  <div class="container">
    <article>

       <div class="box" style="width: auto;">
      
<form class="well form-horizontal" action="<c:url value='/changpass' />" method="post"  id="contact_form">
<fieldset>
<center>
<!-- Form Name -->
<legend>修改密碼</legend>


<div class="form-group">
  <label class="col-md-4 control-label" >暱稱</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="memberNicknName" placeholder="Last Name" class="form-control"  type="text" value="${memberNicknName }" readonly>
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">帳號(E-Mail)</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="memberAddress" placeholder="E-Mail Address" class="form-control"  type="text" value="${memberAddress}" readonly>
    </div>
  </div>
</div>

  
<div class="form-group">
  <label class="col-md-4 control-label">密碼</label>
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
<!--         	<textarea class="form-control" name="memberBonus" placeholder="Project Description" ></textarea> -->
        	<input  class="form-control" type="PASSWORD" name="memberPassword" id="pwd1" placeholder="須包含!@#$%^&*、數字、英文"
        	value="${requestScope.memberPassword}" pattern="(?!.*[^a-zA-Z0-9!@#$%^&*])(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*]).{8,}"><label id="pwd12" style="color: red;">${ErrMsg.memberPassword}</label>
  </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">確認密碼</label>
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
<!--         	<textarea class="form-control" name="memberBonus" placeholder="Project Description" ></textarea> -->
        	<input  class="form-control" type="PASSWORD" name="memberPassword2" id="pwd2" 
        	minlength="8" value="${requestScope.memberPassword2}"><label
						id="pwd22" style="color: red;">${ErrMsg.memberPassword2}</label>
  </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
   <center> <button type="submit" class="btn btn-warning" >送出 <span class="glyphicon glyphicon-send"></span></button></center>
  </div>
</div>

</center>
</fieldset>
</form>
<br><center> 
	<br>
	<a href="<c:url value="/index.jsp" />" style="color: ;">回首頁</a>
		</center>
   </div>

    </article>
  </div>
</section>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script>$(function(){
  
  // Window Dimentions
  var w = $(window).width(), h = $(window).height();
  //$('header').width(w);
  $('header').height(h);
  // Window Dimentions Resize
  $(window).resize(function(){
    var w = $(window).width(), h = $(window).height();
    //$('header').width(w);
    $('header').height(h);    
  });
  
  //
  $('#menu').click(function(){
    $(this).toggleClass('on');
    $('#overlay').toggleClass('on');
    $('html').toggleClass('on');
    $('menu').toggleClass('on');
    $('header').toggleClass('on');
    $('section').toggleClass('on');
    if($('#menu > i').hasClass('fa-navicon')) {
      $('#menu > i').addClass('fa-arrow-left');
      $('#menu > i').removeClass('fa-navicon');
    } else {
      $('#menu > i').addClass('fa-navicon');
      $('#menu > i').removeClass('fa-arrow-left');
    }
  });
  $('#overlay').click(function(){
    $(this).removeClass('on');
    $('#menu').removeClass('on');
    $('html').removeClass('on');
    $('menu').removeClass('on');
    $('header').removeClass('on');
    $('section').removeClass('on');
    $('#menu > i').addClass('fa-navicon');
    $('#menu > i').removeClass('fa-arrow-left');
  });
  
});
//# sourceURL=pen.js
</script>
	<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
	
</body>
</html>