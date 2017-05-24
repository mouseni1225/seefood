<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="text/javascrip.1.0t" src="http://ajax.googleapis.com/ajax/libs/jquery/0/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel="stylesheet" href="<c:url value="/css/sun_star.css" />"
	type="text/css">  <!-- 星星 -->
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	
</head>
<body>

<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
  <header>
  <h1><span>${ bean.memberNicknName }</span>的美食文章</h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
<div class="container">

<c:forEach var="datafromid" items="${selectMemberId}">
						<c:url value="/pages/article/article.controller" var="path">
							<c:param name="id" value="${datafromid.articleId}" />
							<!-- 網址後面串資料 -->
						</c:url>
						<c:url value="/pages/article/article.controller" var="path2">
                             <c:param name="id" value="${datafromid.articleId}" />
                             <c:param name="title" value="${datafromid.articleTitle}" />
                        </c:url>
                        <c:url value="/pages/article/article.controller" var="path3">
                             <c:param name="delect" value="${datafromid.articleId}" />
                        </c:url>
						<article>
<div class="box" style="width:580px;height:360px;"><img src="<c:url value='/pages/article/getimg?id=${datafromid.articleId}'/>"></div>    
<div class="box">
        <h3>
          <span class="s_star_1"><i class="s_d${datafromid.articleAverageStar}"></i></span>
          <span><i class="fa fa-heart">${datafromid.memberNicknName}</i></span>
        </h3>
        <h2>${datafromid.articleTitle}</h2>
        <p>${datafromid.cutData}.....<a style="float: right;" href="${path}">&lt;繼續閱讀&gt;</a></p>
       <form>
        <h4>
          ${datafromid.articlePeople} Comments
          <a></a>
          <a href="${path2}">修改文章</a>
          <a></a>
          <button name="delect" value="${datafromid.articleId}" onclick='text(this.form)'>刪除文章</button>
        </h4>
        </form>
<!-- <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script> -->
</div>
</article>
</c:forEach>

</div>				
     
  <jsp:include page="../goTop/goTop.jsp" />
</section>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script type="text/javascript">

function text(form) {
	if(confirm("確定刪除嗎?")){
		form.action="<c:url value='/pages/article/article.controller?'/>";
		form.method="get";
		form.submit();

	}else{
		
		form.action="";
		form.method=" ";
		form.submit();
	}
	
}

</script>
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

</script>
</body>
</html>