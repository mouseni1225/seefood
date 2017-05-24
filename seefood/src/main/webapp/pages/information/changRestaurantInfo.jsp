<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="<c:url value='/js/jquery-1.12.3.min.js'/>"></script>


<title>修改餐廳</title>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>


<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch' href='//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>


<c:set var="bean" value="${ bean }" scope="session" />

<style type="text/css">
.a2 {
	display: none; /*此類別是隱藏功能 */
}

.code {
	/* 	width: 60px; */
	/* 	border-radius: 5px; */
	/* 	padding: 4px; */
	display: none;
}

.countrydistrict {
	width: 75px;
	height: 27px;
	display: inline-block;
	line-height: 1.5;
	margin-right: 3px;
	padding-top: 2px;
	padding-right: 4px;
	padding-bottom: 2px;
	padding-left: 4px;
	font-size: 14px;
	color: black;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>


</head>
<body>



<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
<header>
  <h1><span>更新維護</span><br>是致富的捷徑</h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
  <div class="container">
    <article>

       <div class="box" style="width: auto;">
      
<form class="well form-horizontal" action="<c:url value='ChangRes'/>" method="post"  id="contact_form">
<fieldset>

<!-- Form Name -->
<center> <legend>餐館資料</legend></center>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">帳號(E-Mail)</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="memberAddress" placeholder="E-Mail Address" class="form-control"  type="text" value="${selectmemberAddress.memberAddress }" readonly>
    </div>
  </div>
</div>

   <div class="form-group">
                        <label class="col-md-4 control-label">料理風格</label>
                        <div class="col-md-4">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="異國料理" />異國料理
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="日式料理" />日式料理
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="西式餐廳" />西式餐廳
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="中式餐廳" />中式餐廳
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="健康素食" />健康素食
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="甜點輕食" />甜點輕食
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="複合餐廳" />複合餐廳
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="servItem" value="泰式料理" />泰式料理
                                </label>
                            </div>
                            ${ErrMsg.resTypes}
                        </div>
                    </div>
                    
<script>$("input[value='${selectmemberAddress.servItem}']").prop("checked", true);</script>

 



<div class="form-group">
  <label class="col-md-4 control-label">店名</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="org_Text" placeholder="" class="form-control"  type="text" value="${selectmemberAddress.org_Text}" required>
    ${ErrMsg.org_Text}
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">推薦料理</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="special" placeholder="" class="form-control"  type="text" value="${selectmemberAddress.special}" required>
    ${ErrMsg.special}
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">平均價位</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="price" placeholder="" class="form-control"  type="text" value="${selectmemberAddress.price}" required>
    ${ErrMsg.price}
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">營業時間</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
  <input name="time" id="resOpentime" placeholder="" class="time"  type="text" value="${selectmemberAddress.time}" size="45" required>
    ${ErrMsg.resOpentime}
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">電話</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="informtel" placeholder="0X-XXXXXXX" class="form-control" type="tel" pattern="[0][0-9]{1}[-]{1}[0-9]{7}||[0][0-9]{1}[-]{1}[0-9]{8}||[0][0-9]{1}[0-9]{1}[-]{1}[0-9]{7}||[0][0-9]{1}[0-9]{1}[-]{1}[0-9]{8}"
						required value="${selectmemberAddress.informtel}">
	${ErrMsg.informtel}
    </div>
  </div>
</div>

<div class="a2">
  <label class="col-md-4 control-label">frg_Id</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="frg_Id" placeholder="" class="form-control"  type="text" value="5">
  ${ErrMsg.frg_Id}
    </div>
  </div>
</div>

<div class="a2">
  <label class="col-md-4 control-label">緯度</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="lat" placeholder="" class="form-control"  type="text" value="${selectmemberAddress.lat}" required>
  ${ErrMsg.lat}
    </div>
  </div>
</div>

<div class="a2">
  <label class="col-md-4 control-label">經度</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="lng" placeholder="" class="form-control"  type="text" value="${selectmemberAddress.lng}" required>
  ${ErrMsg.lng}
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">地址</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <input name="informaddress" placeholder="Address" class="form-control" type="text" value="${selectmemberAddress.informaddress}" required>
    ${ErrMsg.resAddress}
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
   <center> <button type="submit" name="prodaction" class="btn btn-warning" >送出<span class="glyphicon glyphicon-send"></span></button></center>
  </div>
</div>


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