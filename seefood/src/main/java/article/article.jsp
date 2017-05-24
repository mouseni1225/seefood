<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*,java.io.*,org.apache.commons.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章發表(article.jsp)</title>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<script src='<c:url value="/ckeditor/ckeditor.js"/>'></script>
<script src='<c:url value="/ckeditor/samples/js/sample.js"/>'></script>
<script src='<c:url value="/ckeditor/samples/js/jquery-3.1.1.js"/>'></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel='stylesheet prefetch'
	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
</head>


<body>
	<div id="overlay"></div>
	<span id="menu"><i class="fa fa-navicon"></i></span>
	<header>
	<h1>
		<span>${ bean.memberNicknName }</span>&nbsp你好<br>歡迎寫下你的所見所得
	</h1>
	</header>
	<jsp:include page="/indexleft.jsp" />
	<section>
	<div class="container">



		<center>
			<form name='form'
				action='<c:url value="/pages/article/change.controller"/>'
				method='post' enctype="multipart/form-data">

				<div>
					<table>
						<h1 style="color: #18B1FF;">
							文章標題:<input type="text" name="title" value="${param.title}"><span
								style="color: red;">${errors.title}</span>
						</h1>
<!-- 						<h1 style="color: #18B1FF;"> -->
<!-- 							文章封面:<input type="file" name="img" id="img" size="40" /> -->
<!-- 						</h1> -->
						<tr>
							<td style="background-color: #F7CCFF;"><input type="file"
								id="img" name="img" size="40"
								style="background-color: #F7CCFF; padding-left: 30px; width: 200px;" />
								<font color='red' size='-1' style="text-align: center;">${ErrMsg.errCpphoto}</font>
							</td>

						</tr>

					</table>
				</div>
				<textarea name="content" id="content" rows="10" cols="80">${param.content}</textarea>
				<script>
					CKEDITOR
							.replace(
									'content',
									{
										filebrowserImageUploadUrl : '<c:url value="/js/article1.controller"/>'
									});
				</script>
				<div>
					<center>
						<span><button type="submit">發表文章</button></span>
					</center>

				</div>
				<span style="color: red;">${errors.noword}</span> <span
					style="color: red;">${errors.wordLess}</span>

			</form>
		</center>
	</div>
	<c:remove var="selectMemberId" scope="session" /> <article>
	<div class="box" style="color: red">
		黑暗料理界提醒您:<br> 網路匿名發言仍需負相關法律責任, 注意勿發表毀謗等違法文章喔!! <img
			style="margin-left: 30px;" alt=""
			src="<c:url value="/images/black.jpg"/>">
	</div>
	</article> </section>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
	<script>
		$(function() {

			// Window Dimentions
			var w = $(window).width(), h = $(window).height();
			//$('header').width(w);
			$('header').height(h);
			// Window Dimentions Resize
			$(window).resize(function() {
				var w = $(window).width(), h = $(window).height();
				//$('header').width(w);
				$('header').height(h);
			});

			//
			$('#menu').click(function() {
				$(this).toggleClass('on');
				$('#overlay').toggleClass('on');
				$('html').toggleClass('on');
				$('menu').toggleClass('on');
				$('header').toggleClass('on');
				$('section').toggleClass('on');
				if ($('#menu > i').hasClass('fa-navicon')) {
					$('#menu > i').addClass('fa-arrow-left');
					$('#menu > i').removeClass('fa-navicon');
				} else {
					$('#menu > i').addClass('fa-navicon');
					$('#menu > i').removeClass('fa-arrow-left');
				}
			});
			$('#overlay').click(function() {
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