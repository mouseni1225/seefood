<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="baBean" class="_03_listCoupon.model.CouponDAOJndi" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
#paging {
	position: relative;
	left: 120px;
	top: 10px;
}

#pfirst {
	position: relative;
	left: 2px;
	top: 2px;
}

#pprev {
	position: relative;
	left: 2px;
	top: 2px;
}

#pnext {
	position: relative;
	left: 2px;
	top: 2px;
}

#plast {
	position: relative;
	left: 2px;
	top: 2px;
}

#main {
	position: relative;
	top: 5px;
	left: 40px;
	width: 100%;
}

#content {
	width: 820px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body style="background: #EBFFEB;">
	<!-- 下列敘述設定變數funcName的值為SHO，top.jsp 會用到此變數 -->
	<c:set var="funcName" value="SHO" scope="session" />
	<!-- 引入共同的頁首 -->
	<%-- <jsp:include page="/fragment/top.jsp" /> --%>
	<!-- 判斷購物車內是否有商品 -->
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
	<div id='content'>
		<TABLE border='2' width="820">
			<!--   購物車的標題   -->
			<TR>
				<TD colspan='4'>
					<TABLE width="820" style="background: #FFE4C4" border='0'>
						<TR height='2'>
							<TH width="270">&nbsp;</TH>
							<TH width="280">&nbsp;</TH>
							<TH width="270">&nbsp;</TH>
						</TR>
						<TR height='10'>
							<TD width="240">&nbsp;</TD>
							<TD width="320" align='center'><FONT color='#8000FA'
								size='+2' style="font-weight: 900;"> ${AppName} </FONT></TD>
							<TD width="270" align='right'><FONT color='red' size='-1'>
									${cartContent} </FONT></TD>
						</TR>

						<TR height='2'>
							<TD width="270"><A
								href="<c:url value='../_04_ShoppingCart/ShowCartContent.jsp' />">紅利選購清單</A></TD>
							<TD width="280">&nbsp;</TD>
							<TD width="270" align='right'><FONT color='red' size='-1'>
									紅利小計:<c:out value="${ShoppingCart.subtotal}" default="0" /> 點
							</FONT></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<!-- 
      forEach 顯示購物車的內容
      識別字串products_DPP是由_03_listBooks.controller.DisplayPageProducts.java放入
      request物件內
   -->
			<c:forEach varStatus="stVar" var="coupons" items="${coupons}">
				<!-- 用兩種顏色交替使用作為顯示商品資料的背景底色 -->
				<c:set var="rowColor" value="#DEFADE" />
				<c:if test="${ stVar.count % 2 == 0 }">
					<c:set var="rowColor" value="#FFEBFF" />
				</c:if>

				<TR bgColor="${rowColor}" height='25'>
					<TD rowspan='3' width='64'>
						<!-- 
                 getImage所對應的Servlet會到資料庫讀取圖片並傳送給前端的瀏覽器
              --> <img height='100' width='80'
						src='../_00_init/getImage?cpidid=${coupons.cpid}&type=cpPhoto'>
					</TD>
					<TD height='32' width='560'>
						<TABLE border='1'>
							<TR height='30'>
								<TD width='560'>優惠內容：${coupons.cpData}</TD>
							</TR>
						</TABLE>
					</TD>
					<TD rowspan='3' width='180' align='center'>
						<!-- <FORM  action='BuyBook.do' method="POST">  --> <!-- 
          FORM表單的資料會送後端的 _03_listBooks.controller.BuyBookServlet.java
                         來處理 
       -->
						<FORM action="<c:url value='BuyBook.do' />" method="POST">
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
							<Input type='hidden' name='cpId' value='${coupons.cpId}'>
							<P />
							<Input type='hidden' name='cpData' value='${coupons.cpData}'>
							<P />
							<Input type='hidden' name='cpResId' value='${coupons.cpResId}'>
							<P />
							<Input type='hidden' name='cpHowBonus'
								value='${coupons.cpHowBonus}'>
							<P />
							<Input type='hidden' name='pageNo' value='${coupons.pageNo}'>
							<P />
							<Input type='submit' value='加入購物車'>
						</FORM>
					</TD>
				</TR>
				<TR height='32' bgColor="${rowColor}">
					<TD width='560'>
						<TABLE border='1'>
							<TR height='31'>
								<TD width='420'>餐廳名稱：${coupons.cpResId}</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR height='32' bgColor="${rowColor}">
					<TD width='560'>
						<TABLE border='1'>
							<TR height='31'>
								<TD width='160'>書號：${coupons.cpId}</TD>
								<TD width='140'>所需紅利：<fmt:formatNumber
										value="${coupons.cpHowBonus}" pattern="####" />點
								</TD>

							</TR>
						</TABLE>
					</TD>
				</TR>
			</c:forEach>
		</TABLE>
	</div>
	<div id="paging">
		<!-- 以下為控制第一頁、前一頁、下一頁、最末頁 等超連結-->
		<table border="1">
			<tr>
				<td width='76'><c:if test="${pageNo > 1}">
						<div id="pfirst">
							<a href="<c:url value='DisplayPageCoupons?pageNo=1' />">第一頁</a>&nbsp;&nbsp;&nbsp;
						</div>
					</c:if></td>
				<td width='76'><c:if test="${pageNo > 1}">
						<div id="pprev">
							<a href="<c:url value='DisplayPageCoupons?pageNo=${pageNo-1}' />">上一頁</a>&nbsp;&nbsp;&nbsp;
						</div>
					</c:if></td>
				<td width='76'><c:if test="${pageNo != totalPages}">
						<div id="pnext">
							<a href="<c:url value='DisplayPageCoupons?pageNo=${pageNo+1}' />">下一頁</a>&nbsp;&nbsp;&nbsp;
						</div>
					</c:if></td>
				<td width='76'><c:if test="${pageNo != totalPages}">
						<div id="plast">
							<a
								href="<c:url value='DisplayPageCoupons?pageNo=${totalPages}' />">最末頁</a>&nbsp;&nbsp;&nbsp;
						</div>
					</c:if></td>
				<td width='176' align="center">第${pageNo}頁 / 共${totalPages}頁</td>
			</tr>
		</table>
	</div>
</body>
</html>
