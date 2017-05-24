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
<script src='<c:url value="/ckeditor/ckeditor.js"/>'></script>
<script src='<c:url value="/ckeditor/samples/js/sample.js"/>'></script>
<script src='<c:url value="/ckeditor/samples/js/jquery-3.1.1.js"/>'></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
</head>
<body>
<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
  <header>
  <h1><span>${ bean.memberNicknName }</span>&nbsp你好<br>歡迎寫下你的所見所得</h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
<div class="container">
    
    

<center>
							<form name='form' action='<c:url value="/pages/article/changearticle"/>' method='post' enctype="multipart/form-data">
							<input type="hidden" name="id" value="${param.id}">
<div class="box" style="width: 500px;height: 300px;"><center><img  src="/seefood/pages/article/getimg?id=${param.id}"></center></div>
							<center><input type="file"
								id="img" name="img" size="40"
								style="background-color: #939E98; padding-left: 30px; width: 200px;" /></center>
								<div>
									<h1 style="color: #18B1FF;">
										 文章標題:<input type="text" name="title" value="${articleid.articleTitle}"><span style="color: red;">${errors.title}</span>
                                    </h1>
								</div>
								<textarea name="content" id="content" rows="10" cols="80">${articleid.articleData}</textarea>
								<script>
									CKEDITOR
											.replace(
													'content',
													{   uiColor: '#939E98',
														filebrowserImageUploadUrl : '<c:url value="/js/article1.controller"/>'
													});
								</script>
								 <div><span><button type="submit">修改文章</button></span></div>
								<span style="color: red;">${errors.noword}</span><span style="color: red;">${errors.wordLess}</span> 
                                       
							</form>
</center>
</div>
						<c:remove var="selectMemberId" scope="session" />
		
<article>							
		<div class="box" style="color:red">
			黑暗料理界提醒您:<br> 
			網路匿名發言仍需負相關法律責任,
			注意勿發表毀謗等違法文章喔!!
			<img style="margin-left: 30px;" alt="" src="<c:url value="/images/black.jpg"/>">
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