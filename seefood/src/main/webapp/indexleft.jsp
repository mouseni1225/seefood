<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
</head>
<body>
<c:set var="bean" value="${ bean }" scope="session" />
<menu>
  <div class="container">
    <div class="box">
      <ul>
        <li>
           <a href="<c:url value="/index.jsp" />"><i class="fa fa-home"></i> 首頁</a>
        </li>
        
        <li>
            <c:if test="${empty bean.memberNicknName }">
			<a href="<c:url value="/pages/information/registerCustomer.jsp" />"><i class="fa fa-users" aria-hidden="true"></i>註冊會員</a>
		    </c:if>
		</li>
		
        <c:if test="${! empty bean.memberNicknName }">
        <li>
          <a href="<c:url value="/pages/information/information.jsp" />"><i class="fa fa-address-book" aria-hidden="true"></i>會員專區</a>
        </li>
        </c:if>
        
        <li>
           <a href="<c:url value="/pages/map0331/map.jsp" />"><i class="fa fa-globe" aria-hidden="true"></i> 地圖</a>
        </li>
        
        <c:if test="${! empty bean.memberNicknName }">
        <li>
           <a href="<c:url value="/pages/article/article.jsp" />"><i class="fa fa-book"></i> 發表文章</a>
        </li>
        </c:if> 
        
        <c:if test="${! empty bean.memberNicknName }">
        <li>
           <a href="<c:url value='/pages/SeeMyArticle'/>"><i class="fa fa-book"></i> 自己的文章</a>  
        </li>
        </c:if>
        
        <li>
            <c:if test="${bean.depId==10 }">
            <a href="<c:url value="/selectresinfo"/>"><i class="fa fa-image"></i> 查看店家資訊</a>
            </c:if>
        </li>
        
        <li>
            <a href="<c:url value="/pages/article/article.controller"/>"><i class="fa fa-cutlery" aria-hidden="true"></i>美食文章</a>
        </li>
        
        <c:if test="${! empty bean.memberNicknName }">
        <li>
            <a href="<c:url value="/pages/_C_listCoupon/DisplayPageCoupons" />"><i class="fa fa-shopping-bag" aria-hidden="true"></i>美食優惠券</a>
        </li>
        <li>
            <a href="<c:url value="/pages/_E_orderProcess/OrderList.jsp" />"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>兌換紀錄</a>
        </li>
        </c:if>
        
        <li>
        <c:if test="${!empty bean.memberNicknName }">
            <a href="<c:url value="/index_2.jsp" />"><i class="fa fa-comments-o" aria-hidden="true"></i>聊天大廳</a>
        </c:if>
        </li>
        
        <li>
            <c:if test="${empty bean.memberNicknName }"><a href="<c:url value="/pages/login/login.jsp" />"><i class="fa fa-info-circle"></i>登入</a></c:if>
            <c:if test="${!empty bean.memberNicknName }"><a href="<c:url value="/pages/login/logout.jsp" />"><i class="fa fa-info-circle"></i>登出</a></c:if>
        </li>
        
      </ul>
    </div>
    <br>
    <c:if test="${!empty bean.memberNicknName }">
    <div class="box">
                   <span style="padding-left: 60px;color:#86FD12 ;">個人資訊版</span>
      <ul>
<%--          <li><img alt="" src="/seefood/websocket/getimg?id=${bean.memberNicknName}"></li> --%>
         <li><a ><i class="fa fa-id-badge" aria-hidden="true"></i>${bean.memberNicknName}</a></li>
         <li><a ><i class="fa fa-money" aria-hidden="true"></i>累積紅利：${bean.memberBonus}</a></li>
      </ul>
    </div>
    </c:if>
  </div>
</menu>
</body>
</html>