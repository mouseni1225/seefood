<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<!-- <link rel="shortcut icon" href="http://getbootstrap.com/docs-assets/ico/favicon.png"> -->
<link href='<c:url value="/css/bootstrap2.css" />' rel="stylesheet">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">	
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
</head>

<body>
<c:remove var="bean" scope="session"/>

<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
<header>
  <h1><span>食府</span><br> 歡迎你的到來</h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
  <div class="container">
    <article>

      <div class="box">
        <div class="body">
				<div>
					<!--放會員資訊?? -->
					<div style="border-color: #dfdfdf;">
						<form class="form-signin"
							action="<c:url value="/login.controller"/>" name="loginForm"
							method="get">
							<h1 style="content:;" class="form-signin-heading">Please sign in</h1>
							<input type="text" class="form-control" name="userId"
								value="${param.userId}" placeholder="Email address"
								requiredautofocus>${ErrorMsg.noId} <input
								type="password" class="form-control" name="userPsd"
								value="${param.userPsd}" placeholder="Password" required>${ErrorMsg.noPsd}
						<center><a style="color: black;" href="<c:url value="/pages/information/registerCustomer.jsp" />">註冊</a></center>
							<p>
						<center><a style="color: black;" href="<c:url value="/pages/information/forgetpassword.jsp" />">忘記密碼</a></center>
							<p style="color: red;">${ErrorMsg.loginerror}</p>

							<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
								in</button>
						</form>
					</div>
				</div>
			</div>
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


</body>
</html>