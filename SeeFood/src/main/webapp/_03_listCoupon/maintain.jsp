<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="CouponBean"
	class="old._003_listCoupon.model.dao.CouponDAOJndi" />
<jsp:useBean id="Coupon" class="old._003_listCoupon.model.CouponBean" />

<c:set var="subTitle" value="優惠Let's購!!" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${subTitle}</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty CouponBean.allCoupon}">
          目前尚未有任何資料
      </c:when>
		<c:otherwise>
           	 現在優惠：<BR>
			<TABLE border='1'>
				<TR>
					<TH width=‘120’>cpId</TH>
					<TH width=‘120’>餐廳</TH>
					<TH width='140'>種類</TH>
					<TH width='170'>優惠內容</TH>
					<TH width='130'>產品圖片</TH>
					<TH width='130'>需求紅利</TH>
					<TH width='200'>優惠開始時間</TH>
					<TH width='130'>優惠結束時間</TH>
				</TR>
				<c:forEach var="aBean" items="${CouponBean.allCoupon}">
					<TR>
						<!--傳送ID變數，值=aBean.id到update.jsp -->
						<TD><a href="update.jsp?ID=${aBean.cpId}">${aBean.cpId}</a></TD>
						<TD>${aBean.cpResId}</TD>
						<TD>${aBean.cpType}</TD>
						<TD>${aBean.cpData}</TD>

						<TD><img height='100' width='80'
							src="<c:url value='/_00_init/getImage?cpid=${aBean.cpId}&type=coupon'/>">
						</TD>
						<TD>${aBean.cpHowBonus}</TD>
						<TD>${aBean.cpStarTime}</TD>
						<TD>${aBean.cpOverTime}</TD>

					</TR>
				</c:forEach>
			</TABLE>
		</c:otherwise>
	</c:choose>
	<br>
	<a href="<c:url value='../index.jsp'/>">回首頁</a>
	<a href="<c:url value='Insert.jsp'/>">新增資料</a>
</body>
</html>

