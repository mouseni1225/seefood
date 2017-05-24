<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,org.apache.commons.io.*"%>
<%@ page import="_C_listCoupon.model.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="CouponBean"
	class="_C_listCoupon.model.DAO.CouponDAOJndi" />
<%
	List<CouponBean> list = CouponBean.getAllCoupon();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="subTitle" value="新增優惠券" />

<!--載入CouponDAOJndi類別，以bab當識別字串 -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="jquery-1.7.1.min.js"></script>
<link href="bootstrap-datepicker3.css" rel="stylesheet">

<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>



<style type="text/css">
.ooo {
	
}
</style>


<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<link rel="stylesheet" href="<c:url value="/css/shopping.css" />" type="text/css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script type="text/javascript">
<!--使用GET方法傳送資料，這樣子CouponUpdate.do那邊才能用getPatemeter接資料-->
	function insertCoupon() { //新增
		document.forms[0].action = "../_C_listCoupon/CouponInsert.do";
		document.forms[0].method = "POST";
		document.forms[0].submit();
	}

	function clearForm() { //清除資料
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "text") {
				inputs[i].value = "";
			}
		}
	}
</script>

</head>
<body>
	
	
	<div id="overlay"></div>
<span id="menu"><i class="fa fa-arrow-circle-left" aria-hidden="false"></i></span>
<header>
  <h1>歡迎來到 <span>食府</span></h1>
</header>
<jsp:include page="/indexleft.jsp" />
<section>
     <div class="container">
       <article><article><center>
	      <form id="form1" name="form1" method="POST" action="/_C_listCoupon/CouponInsert.do" enctype="multipart/form-data">
	         <div class="wrap cf">
	            <h1 class="projTitle">食府<span>新增優惠</span> </h1>
	            <div class="heading cf">
                   <h1></h1>
			       
                </div>
                
                <div class="cart">
                   <ul class="cartWrap">
                      <li class="items odd">
                         <div class="infoWrap" >
                             <div class="cartSection" style="text-align: center;">
                                 <input name="cpResId" type="hidden" id="cpResId" value='${bean.memberId}' />
                                                                      產品圖片 <input type="file" id="cpPhoto" name="uploadFile" size="40" /><br><p class="itemNumber" style="color: red;font-size:13px;text-align:center;">${ErrMsg.errPicture}</p> 
                                 
                                 <br>
                                 <br>
                                 <h3>種類:&nbsp;
                                    <select name="cpType">
							         	 <option value="折數券">折數券</option>
										<option value="買一送一">買一送一</option>
										<option value="買一送多">買一送多</option>
										<option value="免費券">免費券</option>
											<option value="折價券">折價券</option>
					                 </select>
					             </h3>
                                 <br>
                              </div>
                              
                              <div class="prodTotal cartSection" style="text-align: left;">
                              
                                 <p class="stockStatus">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;餐廳:<input name="org_Text" type="text" id="org_Text" readonly="readonly" value='${bean.org_Text}' />
                                 </p><br><br>
                                 <p>
                                                            優惠內容:&nbsp;<input name="cpData" type="text" id="cpData" size="" />
                                 </p><br><p class="itemNumber" style="color: red;font-size:13px;font-weight: normal;">${ErrMsg.errCpData}</p><br>
                                 <p>
                                                            優惠時間:&nbsp;<input name="cpStarTime" type="text" id="from" readonly="readonly" />
                                 </p><br><p class="itemNumber" style="color: red;font-size:13px;font-weight: normal;">${ErrMsg.errCpStarTimeStr}</p><br>
                                 <p>
                                                            結束時間:&nbsp;<input name="cpOverTime" type="text" id="to" readonly="readonly"  />
                                 </p><br><p class="itemNumber" style="color: red;font-size:13px;font-weight: normal;">${ErrMsg.errCpOverTime}</p>
                              </div>
                              
                              <div class="cartSection removeWrap" style="text-align:left;">
                                                       兌換紅利:&nbsp; <input name="cpHowBonus" type="text" id="cpHowBonus"  size="10" />
                                   <br><p class="itemNumber" style="color: red;font-size:13px;text-align:center;">${ErrMsg.errCpHowBonus}</p>
                              </div>
                              
                         </div>
                      </li>
                   </ul>
                   <div class="subtotal cf">
                      <ul>
                         <li class="totalRow final">
                            <input type="button" name="confirm" value="確認"  onclick='insertCoupon()' />
					&nbsp;&nbsp;&nbsp; 
					        <input type="button" name="clear" value="清除" onclick="clearForm()" />
                         </li>
                      </ul>
                   </div>
                   <div class="text">
                   
                   </div>
                </div>
	         </div>
	      </form>
	      <a href="<c:url value='/index.jsp'/>">回首頁</a>
	   </center></article></article>
     </div>

</section>

<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
	<script type="text/javascript">
	
	$("#from").datepicker({
		  dateFormat: 'yy-mm-dd',
		  minDate: '1',//min date set to next day
		  onClose: function(dateStr) {
		    var d = $.datepicker.parseDate('yy-mm-dd', dateStr), //get selected date
		        date2 = $('#from').datepicker('getDate'),//get selected date
		        years = 1 //how many years add to selected date
		    d.setFullYear(d.getFullYear() + years); //add x years to selected date 
		    date2.setDate(date2.getDate()+1);//add x days to selected date
		    $('#to').datepicker('change','minDate', date2);//set to date atleast x days from selecteed date
		    $('#to').datepicker('change',"maxDate", d);//set max date to be exactly x year(s) from selected date
		    }
		});
		$("#from").datepicker("setDate", "1");//Set date x day(s) from current date and display it in input field. Needs to be done after initialization of datepicker.
		  
		$("#to").datepicker({
		  dateFormat: 'yy-mm-dd',
		  minDate: '+2d',//Set date x days from today
		  maxDate: '+1y +1d'//max date x year + 1 day
		});
	
	</script>
	

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

