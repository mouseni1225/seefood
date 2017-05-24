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
		<link rel="stylesheet" href="<c:url value='/css/bootstrap.css'/>"></link>
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/ui-lightness/jquery-ui.css">
		<link rel="stylesheet" href="<c:url value='/css/bootstrap-responsive.css'/>"></link>
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/ui-lightness/jquery-ui.css">
		<link rel="stylesheet" href="<c:url value='/css/demo.css'/>"></link>
		<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
        <link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<style type="text/css">
.a {
    text-decoration: none;
    font-family: "Montserrat", sans-serif;
    letter-spacing: -.015em;
    font-size: .75em;
    padding: 1em;
    color: #fff;
    background: #82ca9c;
    font-weight: bold;
    border-radius: 50px;
    float: right;
    text-align: right;
    -webkit-transition: all 0.25s linear;
    -moz-transition: all 0.25s linear;
    -ms-transition: all 0.25s linear;
    -o-transition: all 0.25s linear;
    transition: all 0.25s linear;
}
</style>
</head>
<body>
<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
<header>
  <h1>歡迎來到 <span>食府</span></h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
  <div class="container">
    <article>
      <div class="box">
      
      <div class="row" >
				<div class="span4">
				<center><h2 style="color: blue;position:static;">${msg}</h2></center>
					<div class="roulette_container">
						<div class="roulette" style="padding-right: 50px;padding-top:30px;border-color: black;border-width:2px;border-style:solid;">
							<img style="width: 150px;height: 150px;" src="<c:url value='/images/2000.jpg'/>"/>
							<img style="width: 150px;height: 150px;" src="<c:url value='/images/1500.jpg'/>"/>
							<img style="width: 150px;height: 150px;" src="<c:url value='/images/500.jpg'/>"/>
							<img style="width: 150px;height: 150px;" src="<c:url value='/images/300.jpg'/>"/>
							<img style="width: 150px;height: 150px;" src="<c:url value='/images/100.jpg'/>"/>
							<img style="width: 150px;height: 150px;" src="<c:url value='/images/50.jpg'/>"/>       
<!-- 							旋轉圖片 -->
						</div>
					</div>
					<div class="btn_container">
						<p>
						<button class="btn btn-large btn-primary start"> START </button>
						<button class="stop btn-large btn btn-warning"> STOP </button>
						</p>
					</div>
					<div class="log_container" style="border-color: black;border-width:2px;border-style:solid;">
						<p  class="demo_label"></p>
						<div id="msg"  >
						</div>
					</div>
					<br><br><br>
						<center><a href="<c:url value="/index.jsp" />" style="text-decoration: none;
    font-family: Montserrat, sans-serif;
    letter-spacing: -.015em;
    padding: 1em;
    color: black;
    background: #82ca9c;
    font-weight: bold;
    border-radius: 50px;
    text-align: right;
    -webkit-transition: all 0.25s linear;
    -moz-transition: all 0.25s linear;
    -ms-transition: all 0.25s linear;
    -o-transition: all 0.25s linear;
    transition: all 0.25s linear;">確認</a></center>
				</div>
				<div class="span4">
					<div class="right_container" style="margin-left: 1000px;">
						<p class="demo_label">Paramater</p>
						<div class="speed_value param_label">
							<span class="param_name">speed :</span> <span class="speed_param"></span>
						</div>
						<div id="speed"> </div>
						<div class="duration_value param_label">
							<span class="param_name">duration :</span> <span class="duration_param"></span>
						</div>
						<div id="duration"> </div>
						
						<div class="stop_image_number_value param_label">
							<span class="param_name">stop image number :</span> <span class="stop_image_number_param"></span>
						</div>
						<input id="stopImageNumber" name="stopImageNumber"/>
						<span class="image_sample">
							<img data-value="0" style="width: 128px;height: 128px;" src="<c:url value='/images/2000.jpg'/>"/>
							<img data-value="1" style="width: 128px;height: 128px;" src="<c:url value='/images/1500.jpg'/>"/>
							<img data-value="2" style="width: 128px;height: 128px;" src="<c:url value='/images/500.jpg'/>"/>
							<img data-value="3" style="width: 128px;height: 128px;" src="<c:url value='/images/300.jpg'/>"/>
							<img data-value="4" style="width: 128px;height: 128px;" src="<c:url value='/images/100.jpg'/>"/>
							<img data-value="5" style="width: 128px;height: 128px;" src="<c:url value='/images/50.jpg'/>"/>
							<img data-value="-1" style="width: 128px;height: 128px;" src="<c:url value='/images/random.png'/>" title="random"/>
<!-- 							旋轉內容 -->
						</span>
					</div>
					
				
				</div>
			</div>
      
      </div>
    </article>
</div>
  <jsp:include page="../goTop/goTop.jsp" />
</section>
<!-- <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> -->
<!-- <script src='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script> -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/jquery-ui.min.js"></script>
<script src="<c:url value='/scripts/roulette.min.js'/>"></script>
<script src="<c:url value='/scripts/demo.js'/>"></script>
		
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