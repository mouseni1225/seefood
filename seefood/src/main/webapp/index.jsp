<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="pages/map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel='stylesheet prefetch'
	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
</head>
<body>
	<div id="overlay"></div>
	<span id="menu"><i class="fa fa-arrow-circle-left"
		aria-hidden="false"></i></span>
	<header>
	<h1>
		歡迎來到 <span>食府</span>
	</h1>
	</header>
	<jsp:include page="/indexleft.jsp" />
	<section>

	<div class="container">
		<article>

		<div style="" class="box">
			<img src="<c:url value="/images/theme.jpg" />" alt="" /><br>
		</div>

		<div class="box">
			<h3>
				<!--           <span>14 April 2015</span> -->
				<!--           <span><i class="fa fa-heart"></i> 15</span> -->
			</h3>
			<h2>關於我們</h2>
			<p>我們是六位宅宅工程師，因為常一起吃飯聚會而不知道應該選擇哪一間餐廳而困擾，於是便發想了製作美食地圖的網站。因應現代人生活忙碌，沒有太多時間實際去探訪餐廳的位置，或者決定要到哪一間餐廳吃飯無所適從，為了提升人們搜尋美食地點的速度，「食府」孕育而生。

				我們提供各式類型的小吃、美食及餐廳的地點、評價、菜色、價格等資訊、路線規劃功能、隨機推薦餐廳功能，讓你吃輕輕鬆鬆快速吃美食！</p>
			<h4>
				<!--           <a href="">Continue Reading</a> -->
				<!--           <a href="">45 Comments</a> -->
			</h4>
		</div>
		</article>
		<div class="cite">
			<blockquote>
				<p>
						天天登入抽紅利，兌換美食優惠券，換、換、換不完！
					 <br> 今天不知道想要吃什麼嗎？快來試試我們的自動推薦餐廳服務！
					 <br> 直接線上和店家諮詢的聊天室功能！ 
					 <br> 眾多美食部落客的精選好文就在「食府」！
					 <br> 快來加入我們一起 搜 美 食！
					 <br> <a style="color: blue;" href="http://eeit9232discuss.azurewebsites.net/discuss_temp.php">聯絡我們</a>
				</p>

			</blockquote>
		</div>
		<article>
		<div class="box">
			<img src="<c:url value="/images/template2.jpg" />" alt="" />
		</div>

		<div class="box">
			<img src="<c:url value="/images/template1.jpg" />" alt="" />
		</div>
		</article>
	</div><jsp:include page="pages/goTop/goTop.jsp" /> </section>
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
	<c:remove var="articleid" scope="session" />
</body>
</html>