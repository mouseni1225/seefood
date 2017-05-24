<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<style type="text/css">
.star{
width: 20px;
}


a {
  -moz-transition: all 0.1s ease-out;
  -o-transition: all 0.1s ease-out;
  -webkit-transition: all 0.1s ease-out;
  transition: all 0.1s ease-out;
  color: #e74c3c;
}
a:hover {
  color: #4BD3F4;
}

/* Card */
.card {
  background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2VjZjBmMSIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
  background-size: 100%;
  background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #ffffff), color-stop(100%, #ecf0f1));
  background-image: -moz-linear-gradient(top, #ffffff 0%, #ecf0f1 100%);
  background-image: -webkit-linear-gradient(top, #ffffff 0%, #ecf0f1 100%);
  background-image: linear-gradient(to bottom, #ffffff 0%, #ecf0f1 100%);
  -moz-box-shadow: 0 3px 10px rgba(0, 0, 0, 0.5);
  -webkit-box-shadow: 0 3px 10px rgba(0, 0, 0, 0.5);
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.5);
  display: block;
  position: relative;
  padding: 20px;
}

.card .card-modal {
  -moz-transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  -o-transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  -webkit-transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  border-radius: 10px;
  background-color: #bdc3c7;
  color: white;
  display: none;
  position: absolute;
  top: 40px;
  left: 130px;
  z-index: 2;
  padding: 20px;
}
.card .card-modal.active {
  left: 140px;
}
.card .card-modal:before {
  content: "";
  border-style: solid;
  border-width: 15px 15px 15px 0;
  border-color: transparent #bdc3c7 transparent transparent;
  width: 0;
  height: 0;
  display: block;
  position: absolute;
  top: 20%;
  left: -15px;
}

.card .card-image {
  position: absolute;
  top: 20px;
  left: 20px;
}
.card .card-image  {
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;
  border-radius: 50px;
  background-position: -45px 0;
  background-repeat: no-repeat;
  background-size: cover;
  border: 0;
  cursor: pointer;
  width: 100px;
  height: 100px;
  overflow: hidden;
  position: absolute;
  padding: 0;
}

.btn {

/* 圖框內的照片重不重複 */
background-repeat: no-repeat;
/* 圖片擴大塞進框內 */
background-size: cover;
/*   改變滑鼠游標 */
  cursor: pointer;
  width: 100px;
  height: 100px;
/*   圖片是否會被裁切 */
  overflow: visible;
  /*class定位的位置*/
  position: absolute;
  
}

.card .card-image .btn:after {
/*   content: "";  透明度 */
  -moz-transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  -o-transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  -webkit-transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  transition: all 0.3s cubic-bezier(0.19, 1, 0.22, 1);
  -moz-border-radius: 50px;
  -webkit-border-radius: 50px;
  border-radius: 50px;
  border: rgba(255, 255, 255, 0.4) 50px solid;
  width: 100%;
  height: 100%;
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 5;
}
.card .card-image .btn:hover:after {
  border-width: 0;
}
.card .card-image .btn img {
  display: none;
}

.card .card-info {
  margin-left: 120px;
}

.card .card-info .name {
  font-size: 28px;
  font-weight: 100;
  display: inline-block;
  vertical-align: top;
  position: relative;
}

.card .card-info .social-network {
  font-size: 0;
  display: inline-block;
  vertical-align: top;
  overflow: hidden;
  margin-bottom: 15px;
}
@media (min-width: 639px) {
  .card .card-info .social-network {
    float: right;
    margin: 5px 0 0;
  }
}
.card .card-info .social-network .icon {
  background-color: #bdc3c7;
  border: 0;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  border-radius: 50%;
  width: 32px;
  height: 32px;
  display: inline-block;
  vertical-align: top;
  overflow: hidden;
  position: relative;
  margin-left: 10px;
}
.card .card-info .social-network .icon:first-child {
  margin: 0;
}
.card .card-info .social-network .icon:before {
  -moz-transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1);
  -o-transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1);
  -webkit-transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1);
  transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1);
  -moz-border-radius: 16px;
  -webkit-border-radius: 16px;
  border-radius: 16px;
  content: "";
  width: 32px;
  height: 32px;
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
}
.card .card-info .social-network .icon.facebook:before {
  border: rgba(59, 89, 152, 0.7) 0 solid;
}
.card .card-info .social-network .icon.facebook:hover:before {
  border-width: 30px;
}
.card .card-info .social-network .icon.twitter:before {
  border: rgba(15, 191, 242, 0.7) 0 solid;
}
.card .card-info .social-network .icon.twitter:hover:before {
  border-width: 30px;
}
.card .card-info .social-network .icon.youtube:before {
  border: rgba(179, 18, 23, 0.7) 0 solid;
}
.card .card-info .social-network .icon.youtube:hover:before {
  border-width: 30px;
}
.card .card-info .social-network .icon i {
  color: white;
  font-size: 16px;
  text-align: center;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 50%;
  z-index: 1;
  margin-top: -7px;
}

.card .card-info hr {
  margin: 0 0 15px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"type="text/css">
<link rel="stylesheet" href="<c:url value="/css/sun_star.css" />"type="text/css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
</head>
<body>
<%-- <%@ page import="java.lang.String" %> --%>
<div id="overlay"></div>
<span id="menu"><i class="fa fa-navicon"></i></span>
<header>
  <h1><span>${articleid.articleTitle}</span><br></h1>
 
</header>
<jsp:include page="/indexleft.jsp" />
<section>
<div class="container">
<center><h2 style="position:static;color:#40FAFF;">作者:${articleid.memberNicknName}</h2></center>
<%-- <div class="box" style="width: 500px;height: 300px;"><center><img  src="<c:url value='/pages/article/getimg?id=${articleid.articleId}'/>"></center></div>  --%>
<div class="box">
      <div  class="cite">
      <blockquote>
        ${articleid.articleData}
      </blockquote>
      <div class="box" style="border-color:#aaaaee;border-width:3px;border-style:solid;padding:5px;">
     <a name="24"></a>
     <img style="float:left; width: 50px;" class='star' id="st1" name="1" src="star.gif" />
     <img style="float:left; width: 50px;" class='star' id="st2" name="2" src="star.gif" />
     <img style="float:left; width: 50px;" class='star' id="st3" name="3" src="star.gif" />
     <img style="float:left; width: 50px;" class='star' id="st4" name="4" src="star.gif" />
     <img style="float:left; width: 50px;" class='star' id="st5" name="5" src="star.gif" />
     
<form>

     <button style="margin-top: 30px;margin-left: 0px;float: left;" onclick='text()'>頂一下</button>

<br>


</form>
    <p style="float: left;" id="ii"></p>
</div>
${noStar.thanks} ${noStar.already}
    </div>
    <div>
    
    <c:forEach var="msg" items="${mbean}">

<div class="car-container">
  <div class="row">    
    <div class="col-xs-12">

      <div class="card">                

        <div class="card-image" id="num"> 
          
            <img  class="btn" src='<c:url value='/pages/information/atriclegetimg?id=${msg.memberId}' />' alt="user-image" />
<%--           換成該留言者的頭像 用${msg.memberNicknName}判別 --%>
         
        </div>

<!--         <div class="card-modal">Take a look at my Profile!</div> -->
        
        <div class="card-info">
          
          <div class="name">
            <p>${msg.memberNicknName}</p> 
          </div>
          
          
          
          <hr>
          
          <div class="content">
            <p>
              <b>留言:</b> 
                                              ${msg.lookmessage}
            </p>
            <p><b>日期:</b> ${String(msg.postTime).substring(5,16)}</p>
            
          </div>
        </div>
      </div>    
    </div>
  </div>
</div>


</c:forEach>
<div class="card">
<div class="card-image" id="num"> 
          
            <img class="btn" src="<c:url value='/pages/information/getimg?id=${bean.memberAddress}' />" alt="user-image" />
         
        </div>
        <div class="card-info">
<form action="<c:url value="/pages/article/article.controller"/>" method="post">
<table style="margin-left:0 auto; " >
  
  <tr>
    
     <td>${bean.memberNicknName}</td>
     <td>
        <textarea name="lookmessage" rows="5" cols="30" style="width: 100%;"></textarea><br><br><br>
        <center> <input  type="submit" value="我要留言" style=""> <a name="32"></a></center>
     </td>
     
   </tr>
</table>
<input type="hidden" name="articleId" value="${articleid.articleId}">
</form>
</div>
</div>
</div>
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
var num = 0;
var star=0;
var total=$('img').length;
var total2=$('#num img').length;
console.log(total2);
$(".star").ready(function () {
           var imgs = document.getElementsByClassName("star");
           for (var i = 0; i < imgs.length; i++) {
               imgs[i].onmouseover = function () { mouseOver(this.id); };
               imgs[i].onmouseout = function () { mouseOut(this.id); };
               imgs[i].onclick = function () { Click(this.id); }
               
           }


           function mouseOver(aa) {
               if (num % 2 == 0) {
                   for (j = 0; j < aa.substr(2) ; j++) {
                       document.images[total-5+j-total2].src = "chngstar.gif";
                       document.getElementById("ii").innerHTML = "評分中" + (aa.substr(2))+"顆星!?";
                   }
                   num = 0;
               }
           }

           function mouseOut(aa) {
               if(num%2==0){
               for (k = 4; (k + 1) >=aa.substr(2) ; k--) {
                   document.images[total-5+k-total2].src = "star.gif";
               }
           }
           }
          
           function Click(aa) {
               num = num + 1;
               if (num % 2 != 0) {
                   for (j = 0; j < aa.substr(2) ; j++) {
                       document.images[total-5+j-total2].src = "chngstar.gif";
                       document.getElementById("ii").innerHTML = "您給" + (aa.substr(2))+"顆星";
                       star=aa.substr(2);
                       
                   }
                  
               }
              
           }
           
       })
       
       
       function text() {
       		document.forms[0].action="<c:url value='/pages/article/bonuscontroller?star="+star+"'/>";
       		document.forms[0].method="POST";
       		document.forms[0].submit();
       }
</script>	
<script>/* From img to background */
bg_image_replace(".card-image a img", ".card-image a");

function bg_image_replace(image, parent){   
  $(image).each(function(index,elem){
    
    var src = $(elem).attr("src"),
        $parent = $(elem).closest(parent);       
    
    $parent.css("background-image","url(" + src + ")");    
  });   
}


/* Review */
$( '.card-image' ).mouseover(function(){
        $('.card-modal').fadeIn(100).toggleClass('active');
    }).mouseout(function(){
        $('.card-modal').fadeOut(100).toggleClass('active');
    });
//# sourceURL=pen.js
</script>

<c:remove var="noStar" scope="session"/>	
<c:remove var="mbean" scope="session"/>
</body>
</html>