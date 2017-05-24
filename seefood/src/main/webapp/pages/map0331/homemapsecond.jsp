<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html xmlns:og='http://ogp.me/ns#'>
<head>
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<link rel="stylesheet" href="css/index.css" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<link rel="shortcut icon"
	href="img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel='stylesheet prefetch'
	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />" type="text/css">
<link rel='stylesheet prefetch' href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<style>
      .item{
         font-family: 'Roboto','sans-serif';
        
         color:#66009D;
         
      }
      .itemleft{
        padding-left:10px;
        
      }
     
/*       #btnSubmit{ */
/*          float:right; */
/*       } */
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
    <script type="text/javascript">
         
    
//     window.onload=function(){
//     	   document.getElementById("submit").click();
//        }
    
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

  <div class="container" style="background-color: #FFFFFF;">
   

      <div name="mainmap">
   <div  style="margin-left: 400">
      <div >
                  <font size="50px" style="margin: 60"> 路徑規劃</font><p>
                   起始&nbsp;&nbsp;<input type="text" id="txtFrom" style="width:300px; margin-top:20" value="台北市大安區復興南路一段390號"></input><p>
                    目的&nbsp;&nbsp;<input type="text" id="txtEnd" style="width:300px;margin-top:20" value="${name}"></input><p>
      </div>
      
      
      
       <div>           
       <button style="margin-left: 150 ;margin-top: 10"id="btnSubmit" onclick="initialize2(txtFrom.value,txtEnd.value)">送出</button>
       </div>  
  </div>

  
   <div id="map-canvas" style="float:center;margin-bottom:60;"></div>
<!--    <div style="float:right;width:30%;height:100%;overflow:auto" >  --> 
<!--          <div id="directions_panel" style="width:100%;font-family:標楷體;font-size:xx-large;background-color:#FFDDAA;"></div> -->
<!--    </div> -->
   <div></div>
</div>
    
    
  </div>
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





<script type="text/javascript">
         
    
    window.onload=function(){
    	   document.getElementById("btnSubmit").click();
       }
    
    </script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCt3_Zx8d8ZCeOottS5wJEcKsZDrcpgXJQ&libraries=places&callback"></script>

<script>
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;
  var oldDirections = [];
  var currentDirections = null;
  
  

  function initialize2(pFrom,pEnd) {
    var myOptions = {
      zoom: 17,      
	  center: new google.maps.LatLng(25.033635, 121.543459),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
    

    
    directionsDisplay = new google.maps.DirectionsRenderer({
        'map': map,
        'preserveViewport': true,
        'draggable': true
    });	
	
    directionsDisplay.setPanel(document.getElementById("directions_panel"));

    google.maps.event.addListener(directionsDisplay, 'directions_changed',
      function() {
        if (currentDirections) {
          oldDirections.push(currentDirections);          
        }
        currentDirections = directionsDisplay.getDirections();
      });
    
	
    calcRoute2(pFrom,pEnd);
	
  }
  

  
  function calcRoute2(pFrom,pEnd) {
    
	var start = pFrom;
	var end = pEnd;
    var request = {
        origin:start,		//起始地
        destination:end,	//目的地
        travelMode: google.maps.DirectionsTravelMode.DRIVING //旅行工具 WALKING | DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);

		
      }
    });
		
  }
  

</script>
</body>
</html>