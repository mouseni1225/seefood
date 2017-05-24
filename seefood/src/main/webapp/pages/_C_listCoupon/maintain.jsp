<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="CouponBean"
	class="_C_listCoupon.model.DAO.CouponDAOJndi" />
<c:set var="subTitle" value="優惠Let's購!!" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="_C_listCoupon.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>


<%
	List<CouponBean> list = CouponBean.getAllCoupon();
	pageContext.setAttribute("list", list);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel='stylesheet prefetch'
	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>

<link rel="stylesheet" href="<c:url value="/css/shopping.css" />"
	type="text/css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

</head>
<body>
	<div id="overlay"></div>
	<span id="menu"><i class="fa fa-arrow-circle-left"
		aria-hidden="false"></i></span>
	<header>
	<h1>
		<span>食府</span><br>各項優惠
	</h1>
	</header>
	<jsp:include page="/indexleft.jsp" />
	<section>
	<div class="container">
		<article>
		<article>
		<center>


			<c:choose>
				<c:when test="${ShoppingCart.itemNumber > 0}">
					<!-- 購物車內有一項以上的商品 -->
					<c:set var="cartContent" value="購物車內有${ShoppingCart.itemNumber}項商品" />
				</c:when>
				<c:otherwise>
					<!-- 購物車內沒有商品 -->
					<c:set var="cartContent" value="您尚未購買任何商品" />
				</c:otherwise>
			</c:choose>
			<%@ include file="page1.file"%>
			<c:choose>
				<c:when test="${empty CouponBean.allCoupon}">
          目前尚未有任何資料
      </c:when>
				<c:otherwise>

					<div class="wrap cf">
						<h1 class="projTitle">
							<span>${cartContent}</span>
						</h1>
						<div class="heading cf" style="text-align: left;">
							<h1>
								暱稱:${bean.memberNicknName}<br>
								<br> 紅利:${bean.memberBonus}<br>
								<br>
								<li class="totalRow final"><span class="label">總消費:</span>
									<span class="value"><fmt:formatNumber
											value="${ShoppingCart.subtotal}" pattern="#,###,###" /></span></li>
							</h1>

							<c:choose>

								<c:when test="${bean.org_Text !=null}">
									<a class="continue" style="float: right;"
										href="<c:url value='Insert.jsp'/>"><span
										style="color: black;">新增優惠券</span></a>
									<br>
									<br>
									<br>
									<a class="continue" style="float: right;"
										href="<c:url value='seeselfcoupon'/>"><span
										style="color: black;">自家小本舖</span></a>


									<%--   				          <li><a href="<c:url value="/pages/_C_listCoupon/seeselfcoupon" />"><i class="fa fa-shopping-cart" aria-hidden="true"></i>自家小本舖</a></li> --%>
								</c:when>


							</c:choose>
							<br>
							<br>
							<br> <A style="float: right;"
								href="<c:url value="/pages/_D_shopping/ShowCartContent.jsp" />"
								class="continue"><span style="color: black;">查看購物車</span></A>

						</div>

						<div class="cart">
							<ul class="cartWrap">

								<c:forEach var="aBean" items="${list}" begin="<%=pageIndex%>"
									end="<%=pageIndex+rowsPerPage-1%>">
									<li class="items odd">

										<div class="infoWrap">
											<div class="cartSection">
												<img
													src="<c:url value='/_A_init/getImage?cpid=${aBean.cpId}&type=coupon'/>"
													alt="" class="itemImg" style="width: 170PX" />
												<p style="float: left">序號:&nbsp;${aBean.cpId}</p>
												<br> <br>
												<h3 style="font-size: 15px">種類:&nbsp;${aBean.cpType}</h3>
												<br>


											</div>


											<div class="prodTotal cartSection">
												<p class="stockStatus">${aBean.resName}</p>
												<br>
												<br>
												<p style="font-size: 13px">優惠內容:&nbsp;${aBean.cpData}</p>
												<br>
												<br>
												<p style="font-size: 13px">優惠時間:&nbsp;${aBean.cpStarTime}</p>
												<br>
												<br>
												<p style="font-size: 13px">結束時間:&nbsp;${aBean.cpOverTime}</p>
											</div>
											<br>
											<br>
											<br>
											<div style="float: right" class="cartSection removeWrap">
												兌換紅利:&nbsp; <span style="color: red;"> <fmt:formatNumber
														value="${aBean.cpHowBonus}" pattern="#,###,###" /></span>
												<FORM action="<c:url value='BuyCoupon.do' />" method="POST">
													購買數量: <select name='qty'>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
														<option value="10">10</option>
													</select>
													<!-- 這些隱藏欄位都會送到後端 -->
													<Input type='hidden' name='cpId' value='${aBean.cpId}'>
													<P />
													<Input type='hidden' name='cpResId'
														value='${aBean.cpResId}'>
													<P />
													<Input type='hidden' name='resName'
														value='${aBean.resName}'>
													<P />
													<Input type='hidden' name='cpType' value='${aBean.cpType}'>
													<P />
													<Input type='hidden' name='cpData' value='${aBean.cpData}'>
													<P />
													<Input type='hidden' name='cpHowBonus'
														value='${aBean.cpHowBonus}'>
													<P />
													<Input type='hidden' name='cpStarTime'
														value='${aBean.cpStarTime}'>
													<P />
													<Input type='hidden' name='cpOverTime'
														value='${aBean.cpOverTime}'>
													<P />
													<Input type='hidden' name='pageNo' value='${param.pageNo}'>
													<P />
													<Input type='submit' value='加入購物車'>

												</FORM>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							<div class="subtotal cf">
								<!--     <ul> -->
								<!--             <li class="totalRow"> -->
								<!--                <span class="label">會員紅利</span>            -->
								<%--                <span class="value"><fmt:formatNumber value="${bean.memberBonus}" pattern="#,###,###" />點</span> --%>
								<!--             </li> -->


								<!--     </ul> -->
							</div>

						</div>

					</div>


				</c:otherwise>
			</c:choose>
			<a href="<c:url value='../../index.jsp'/>" style="color: #428bca;">回首頁</a>
			<br> <br>
			<br>
			<br>
			<br>
			<br>
			<br>

			<%@ include file="page2.file"%>
		</center>
		
		
		</article></article>

		
	</div>
	<jsp:include page="../goTop/goTop.jsp" /> </section>
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

