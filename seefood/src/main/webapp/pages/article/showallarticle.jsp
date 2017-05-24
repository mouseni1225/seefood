<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<link rel="stylesheet" href="<c:url value="/css/sun_star.css" />" type="text/css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
</head>
<body>
<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
  <header>
  <h1><span>膾炙人口</span>的美食文章</h1>
</header>
<jsp:include page="/indexleft.jsp" />

<section>
<div class="container">
<div class="box">
   <center> <form style="" id="form1"
						action='<c:url value='/pages/article/article.controller'/>'
						method="get">
						<input type="text" name="search" id="search">
						<!-- 可打關鍵字 -->
						<select name="select">
							<option value="nicknName">作者</option>
							<!-- 多選 -->
							<option value="articleTitle">標題</option>
						</select>
						<button type="submit">搜尋</button>
						<!--搜尋 -->
					</form></center>
    </div>

 <c:forEach var="data" items="${selectTitle}">
						<c:url value="/pages/article/article.controller" var="path">
							<c:param name="id" value="${data.articleId}" />
							網址後面串資料
						</c:url>
						<article>
<!-- <div class="box"><img src="http://goo.gl/nrfUsW" alt="" /></div>     -->
<div class="box"><img src="<c:url value='/pages/article/getimg?id=${data.articleId}'/>"></div>
<div class="box">
<h3>
          <span class="s_star_1"><i class="s_d${data.articleAverageStar}"></i></span>
          <span><i class="fa fa-heart">${data.memberNicknName}</i></span>
        </h3>
        <h2>${data.articleTitle}</h2>
        <p>${data.cutData}.....<a style="float: right;" href="${path}">&lt;繼續閱讀&gt;</a></p>
        <h4>
          <a ></a>${data.articlePeople} Comments
        </h4>
<!-- <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script> -->
</div>
</article>
</c:forEach>

</div>
		
<article>							
		<div class="box">
			<center><h1><!-- 沒有搜尋結果即顯示 --> <c:if test="${empty selectTitle}">查無結果</c:if></h1></center>
		</div>
</article>					
     
<jsp:include page="../goTop/goTop.jsp" />
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