<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function cancelOrder() {
		if (confirm("確定取消此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "CANCEL";
			return true;
		} else {
			return false;
		}
	}
	function reconfirmOrder() {
		if(${ShoppingCart.subtotal} > ${bean.memberBonus}) {
			alert("超過擁有紅利，請再篩選產品");
			return false;
		}
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			return true;
		} else {
			return false;
		}
	}
	
// 	function Checkout(qty) {

// 		if (qty == 0)  {
// 			alert("無購買任何商品，不需結帳");
// 			return false;
// 		}

// 		if (confirm("再次確認訂單內容 ? ") ) {
// 			return true;
// 		} else {
// 			return false;
// 		}
// 	}	
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean id="today" class="java.util.Date" scope="session" />
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel='stylesheet prefetch'
	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<link rel="stylesheet" href="<c:url value="/css/shopping.css" />"
	type="text/css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
</head>
<body>
	<c:set var="funcName" value="CHE" scope="session" />




	<div id="overlay"></div>
	<span id="menu"><i class="fa fa-navicon"></i></span>
	<header>
	<h1>
		<span>食府</span><br>提醒你
	</h1>
	</header>
	<jsp:include page="/indexleft.jsp" />
	<section>
	<div class="container">
		<article>
		<article>

		<FORM action="<c:url value='ProcessOrder.do' />" method="POST">
			<div class="wrap cf">
				<h1 class="projTitle">
					<span>再次確認</span>購物車內容
				</h1>
				<!-- 頭 -->
				<div class="heading cf">
					<h1>
						暱稱：${bean.memberNicknName}<br> 訂單日期：
						<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
						<br> 會員信箱：${bean.memberAddress}
					</h1>
					<div>
						<a href="#" class="continue" style="float: right;"><INPUT
							TYPE="hidden" name="finalDecision" value=""> <INPUT
							TYPE="SUBMIT" name="OrderBtn" value="確定送出"
							style="background: #82ca9c;" onclick="return reconfirmOrder();"></a>
						<br>
						<br>
						<br> <a href="#" class="continue"><INPUT TYPE="SUBMIT"
							name="CancelBtn" value="取消訂單" onclick="return cancelOrder();"
							style="background: #82ca9c;"></a>
					</div>
				</div>

				<c:forEach varStatus="vs" var="anEntry"
					items="${ShoppingCart.content}">
					<!--身 -->
					<div class="cart">
						<ul class="cartWrap">
							<li class="items odd">
								<div class="infoWrap" style="color: red;">
									<div class="cartSection" style="text-align: left;">
										<img
											src="<c:url value='/_A_init/getImage?cpid=${anEntry.value.cpId}&type=coupon'/>"
											alt="" class="itemImg" />
										<p class="itemNumber">cpId:&nbsp;${anEntry.value.cpId}</p>
										<br> <br>
										<h3>種類:&nbsp;${anEntry.value.cpType}</h3>
										<br>
									</div>

									<div class="prodTotal cartSection" style="">
										<p class="stockStatus">${anEntry.value.resName}</p>
										<br>
										<br>
										<p>優惠內容:&nbsp;${anEntry.value.cpData}</p>
										<br>
										<br>
										<p>優惠時間:&nbsp;${anEntry.value.cpStarTime}</p>
										<br>
										<br>
										<p>結束時間:&nbsp;${anEntry.value.cpOverTime}</p>
									</div>

									<div class="cartSection removeWrap" style="">
										兌換紅利:&nbsp;<span style="color: red;">${anEntry.value.cpHowBonus}</span>
										<div>
											購買數量:&nbsp;<span style="color: red;">${anEntry.value.qty}</span>
										</div>
										<div>
											小計:&nbsp;<span style="color: red;"><fmt:formatNumber
													value="${anEntry.value.cpHowBonus  * anEntry.value.qty}"
													pattern="#,###,###" />點</span>
										</div>
									
									</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>
				<div class="subtotal cf" style="">
					<ul>
						<li class="totalRow final"><span class="label">總消費</span> <span
							class="value"><fmt:formatNumber
									value="${ShoppingCart.subtotal}" pattern="#,###,###"/>點</span></li>
										<input type="hidden" name="subtotal"value="${ShoppingCart.subtotal}"/>
					</ul>
				</div>
			</div>



		</FORM>

		</article></article>
	</div>
	<jsp:include page="../goTop/goTop.jsp" />
	</section>
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