<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server 
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance 
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale" 
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=DEL&cpId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=MOD&cpId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {

	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
// 	if(qty > ${bean.memberBonus}) {
// 		alert("超過擁有紅利，請再篩選產品");
// 		return false;
// 	}
// 	if (confirm("再次確認訂單內容 ? ") ) {
// 		return true;
// 	} else {
// 		return false;
// 	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


	<div id="overlay"></div>
	<span id="menu"><i class="fa fa-navicon"></i></span>
	<header>
	<h1>
		<span>食府</span><br>購物車內容
	</h1>
	</header>
	<jsp:include page="/indexleft.jsp" />
	<section>
	<div class="container">
		<article>
		<article> <c:set var="funcName" value="CHE" scope="session" />

		<c:choose>
			<c:when test="${ShoppingCart.itemNumber > 0}">
				<c:set var="cartContent" value="購物車內有${ShoppingCart.itemNumber}項商品" />
			</c:when>
			<c:otherwise>
				<c:set var="cartContent" value="您尚未購買任何商品" />
			</c:otherwise>
		</c:choose> <c:choose>
			<c:when test="${ShoppingCart.subtotal > 0}">
				<c:set var="subtotalMessage" value="金額小計:${ShoppingCart.subtotal} 元" />
				<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
			</c:when>
			<c:otherwise>
				<c:set var="subtotalMessage" value="金額小計:  0 點" />
				<c:set var="subtotal" value="0" />
			</c:otherwise>
		</c:choose>

		<center>
			<div class="wrap cf">
				<h1 class="projTitle">
					<span>購物車內容物</span>
				</h1>
				<!-- 頭 -->
				<div class="heading cf" style="text-align: left;">

					<h1>
						暱稱:${bean.memberNicknName}<br>
						<br>紅利:${bean.memberBonus}
					</h1>
					<div>
						<A class="continue" style="float: right;"
							href="<c:url value='/pages/_C_listCoupon/maintain.jsp' />"><span
							style="color: black;">繼續購物</span></A> <br>
						<br>
						<br> <A href="<c:url value='checkout.do' />" class="continue"
							onClick="return Checkout(${subtotal});"><span
							style="color: black;">再次確認</span></A> <br>
						<br>
						<br> <A class="continue" href="<c:url value='abort.do' />"
							onClick="return Abort();"><span style="color: black;">放棄購物</span></A>
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
										<p class="stockStatus">${anEntry.value.org_Text}</p>
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
										<div style="padding-top: 10px;">
											購買數量:&nbsp;<Input id="newQty${vs.index}"
												style="width: 28px; text-align: right" name="newQty"
												type="text"
												value="<fmt:formatNumber value="${anEntry.value.qty}" />"
												name="qty" onkeypress="return isNumberKey(event)" />
										</div>
										<div style="padding-top: 10px;">
											小計:&nbsp;
											<fmt:formatNumber
												value="${anEntry.value.cpHowBonus * anEntry.value.qty}"
												pattern="#,###,###" />
											點<br>
											<br> <Input type="button" name="update" value="修改"
												onClick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})">
											<Input type="button" name="delete" value="刪除"
												onClick="confirmDelete(${anEntry.key})">
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
							class="value"><fmt:formatNumber value="${subtotal}"
									pattern="#,###,###" />點</span></li>
					</ul>
				</div>
			</div>
		</center>

		<form>
			<input type="hidden" name="a" />
		</form>


		</article></article>
	</div>
	<jsp:include page="../goTop/goTop.jsp" />
	</section>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
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