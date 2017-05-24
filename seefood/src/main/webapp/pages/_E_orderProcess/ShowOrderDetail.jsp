<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty bean}">
	<c:redirect url="/pages/login/login.jsp" />
</c:if>
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<link rel="stylesheet" href="<c:url value="/css/shopping.css" />" type="text/css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<style type="text/css">
#main {
	position: absolute;
	top: 110px;
	left: 210px;
}
</style>
</head>
<body>



<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
<header>
  <h1><span>${bean.memberNicknName}</span><br>的錦囊妙計</h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
  <div class="container">
    <article><article>

      
      <center>
        	
<div class="wrap cf">
            <h1 class="projTitle"><span>${cartContent}</span> </h1>
            <div class="heading cf" style="text-align: left;">
               <h1>
                                                 訂購日期:${OrderBean.orderDate}<br><br>
                                                 訂單編號:${OrderBean.orderNo}
			   </h1>
			   
			   
			   <a class="continue" style="float: right;" href="<c:url value='OrderList.jsp' />"><span style="color:black;">回上一頁</span></a>
			   
			   <br><br><br>
				   <a class="continue" href="<c:url value='../../index.jsp' />"><span style="color:black;">回首頁</span></a>
            </div>
		
	<div class="cart">	
	 <ul class="cartWrap">
	    <c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
	   
         <li class="items odd">
        
           <div class="infoWrap" > 
                <div class="cartSection">
                       <img src="<c:url value='/_A_init/getImage?cpid=${aBean.cpId}&type=coupon'/>" alt="" class="itemImg" />
<%--                        <p class="itemNumber"><a href="update.jsp?ID=${aBean.cpId}">序號:&nbsp;${aBean.cpId}</a></p> --%>
                       <br>
                       <br>
<%--                        <h3>種類:&nbsp;${aBean.cpType}</h3> --%>
                       <br>
                       
        
                </div>  
    
        
                <div class="prodTotal cartSection">
                       <p class="stockStatus">${aBean.org_Text}</p><br><br>
                       <p>優惠內容:&nbsp;${aBean.cpData}</p><br><br>
                       <p>優惠時間:&nbsp;${aBean.cpStarTime}</p><br><br>
                       <p>結束時間:&nbsp;${aBean.cpOverTime}</p>
                </div>
                <div class="cartSection removeWrap">
                                                      兌換紅利:&nbsp; <span style="color: red;"> ${aBean.howCoupon}</span>
                     <br>
                                                       購買數量: ${aBean.amount}
								
								

							
                </div>
            </div>
          </li>
          </c:forEach>
         </ul>
         <c:set var="subtotal" value="${ subtotal + aBean.howCoupon*aBean.amount }" />
         <div class="subtotal cf">
    <ul>
            
            <li class="totalRow final">
               <span class="label">總消費</span>
               <span class="value"><fmt:formatNumber
					value="${OrderBean.total}" pattern="#,###,###" />點</span>
            </li>
      
    </ul>
   </div>
  </div>
  </div>
	  </center> 
	
      </div>

    </article></article>
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



