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
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch' href='//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>
<style type="text/css">
a{
color: #FFFFFF;
}
</style>
</head>
<body>



<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
<header>
  <h1><span>食府</span><br>維護餐廳才有好客源</h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
  <div class="container">
    <article>

       <div class="box" style="width: auto;">
      <form class="well form-horizontal" action="" method="post"  id="contact_form">
      
<fieldset>

<!-- Form Name -->
<center> <legend>我的餐廳</legend></center>



<div class="form-group">
  <label class="col-md-4 control-label" >店名</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="" placeholder="" class="form-control"  type="text" value="${selectres.org_Text}" readonly>
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">餐館類型</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="" placeholder="" class="form-control"  type="text" value="${selectres.servItem}" readonly>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">營業時間</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="" placeholder="" class="form-control"  type="text" value="${selectres.time}"  readonly>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">招牌餐點</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="" placeholder="" class="form-control"  type="text" value="${selectres.special}" readonly>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">平均價位</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="" placeholder="" class="form-control"  type="text" value="${selectres.price}" readonly>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">餐館電話</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="" placeholder="" class="form-control"  type="text" value="${selectres.informtel}" readonly>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">地址</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="" placeholder="" class="form-control"  type="text" value="${selectres.informaddress}"  readonly>
    </div>
  </div>
</div>

<!-- <div class="form-group"> -->
<!--   <label class="col-md-4 control-label">經度</label>   -->
<!--     <div class="col-md-4 inputGroupContainer"> -->
<!--     <div class="input-group"> -->
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> -->
<%--   <input name="" placeholder="" class="form-control"  type="text" value="${selectres.lng}" readonly> --%>
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

<!-- <div class="form-group"> -->
<!--   <label class="col-md-4 control-label">緯度</label>   -->
<!--     <div class="col-md-4 inputGroupContainer"> -->
<!--     <div class="input-group"> -->
<!--         <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> -->
<%--   <input name="" placeholder="" class="form-control"  type="text" value="${selectres.lat}" readonly> --%>
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

</fieldset>
</form>
<br><center>
     
	<br>
	<a href="<c:url value="/resinfo"/>" style="color:#428bca;">修改餐廳資料 </a>&nbsp;&nbsp;&nbsp;
	<a href="<c:url value="/index.jsp" />" style="color:#428bca;">回首頁</a>
	
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
	
</body>
</html>