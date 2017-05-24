<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/bootstrap.min.css">

<script src="<c:url value='/js/jquery-1.12.3.min.js'/>"></script>

<script src="<c:url value='/js/jquery.twzipcode.min.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/js/jquery.timepicker.js'/>"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/jquery.timepicker.css'/>" />

<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">

<!-- <link rel='stylesheet prefetch' -->
<!-- 	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'> -->

<title>註冊會員</title>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>

<link rel='stylesheet prefetch'
	href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
<link rel='stylesheet prefetch'
	href='//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
<link rel='stylesheet prefetch'
	href='//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>

<style type="text/css">
.a2 {
	display: none; /*此類別是隱藏功能 */
}

.code {
	/* 	width: 60px; */
	/* 	border-radius: 5px; */
	/* 	padding: 4px; */
	display: none;
}

.countrydistrict {
	width: 75px;
	height: 27px;
	display: inline-block;
	line-height: 1.5;
	margin-right: 3px;
	padding-top: 2px;
	padding-right: 4px;
	padding-bottom: 2px;
	padding-left: 4px;
	font-size: 14px;
	color: black;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>

<script>
	window.onload = function() {

		document.getElementById("pwd1").onblur = password;
		document.getElementById("pwd2").onblur = password2;
		var div = document.getElementById('result0');
		alink = document.getElementById("accountlink");
		alink.onclick = function() {

			
			var userId = document.getElementById("userId").value;
			if (!userId) {
				div.innerHTML = "<strong>"+"<font color='red'>請輸入帳號</font>"+"</strong>";
				return;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "CheckUserIdServlet", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("userId=" + userId);
			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && xhr.status == 200) {
					result = JSON.parse(xhr.responseText);
					message = "帳號已存在";
					div.innerHTML = "<font color='red' >" + "<strong>"+message+"</strong>"+ "</font>";
					if (result.custId == null) {
						
						message = "帳號可用";
						div.innerHTML = "<font color='blue' >" + "<strong>"+message+"</strong>"+ "</font>";
					}
					
				}
			}
		}
		
	}
	//密碼jsp文字驗證
	function password() {
		var thePwd = document.getElementById("pwd1").value;
		var pCheck = document.getElementById("pwd1")
		var thePwdLen = thePwd.length;

		var re1 = /^[a-zA-Z0-9!@#$%\^&*]{8,}$/;
		var re2 = new RegExp("[a-zA-Z]+");
		var re3 = new RegExp("\\d+");
		var re4 = new RegExp("[!@#$%\^&*]+");
		var pwdCheckRes = document.getElementById("pwd12");
		if (re1.test(thePwd) && re2.test(thePwd) && re3.test(thePwd)
				&& re4.test(thePwd)) {
			pwdCheckRes.className = "correct";
			
			pwdCheckRes.innerHTML = "通過";

		} else {
			pwdCheckRes.className = "wrong";
			
			var wrmsg;
			if (thePwd == "") {
				wrmsg = "密碼不可空白";
				pwdCheckRes.innerHTML = wrmsg;
			} else {
				if (thePwdLen < 8)
					wrmsg = " 少於8個字";
				pwdCheckRes.innerHTML = wrmsg;
				if (!re2.test(thePwd))
					wrmsg = " 必須包含英文字母";
				pwdCheckRes.innerHTML = wrmsg;
				if (!re3.test(thePwd))
					wrmsg = " 必須包含數字";
				pwdCheckRes.innerHTML = wrmsg;
				if (!re4.test(thePwd))
					wrmsg = " 必須包含特殊字元";
				pwdCheckRes.innerHTML = wrmsg;

			}

		}
	}

	function password2() {
		var thePwd = document.getElementById("pwd1").value;
		var thePwd2 = document.getElementById("pwd2").value;
		var pwdCheckRes = document.getElementById("pwd22");
		if (thePwd2 == "") {
			pwdCheckRes.innerHTML = "不可空白";
		} else {
			if (thePwd2 == thePwd)
				pwdCheckRes.innerHTML = "一致";
			if (thePwd2 != thePwd)
				pwdCheckRes.innerHTML = "不一致";
		}
	}
	//叫出餐廳或一般註冊的表單
	function check() {

		$("#h2").removeClass("a2")//用id呼叫刪除節點類別

		$("#t2").removeClass("a2")//用id呼叫刪除節點類別
		
		$("#who").addClass("a2")
	}
	function uncheck() {

		$("#h2").addClass("a2")//用id呼叫新增節點類別

		$("#t2").addClass("a2")//用id呼叫新增節點類別
		
		$("#who").addClass("a2")
	}
	
	function nicknname()
	{$("#nicknname").addClass("a2")}
	
	function email()
	{$("#address").addClass("a2")}
	
	function res()
	{$("#res").addClass("a2")}
	
	function Text()
	{$("#Text").addClass("a2")}
	
	function spe()
	{$("#spe").addClass("a2")}
	
	function pri()
	{$("#pri").addClass("a2")}
	
	function Opentime()
	{$("#Opentime").addClass("a2")}
	
	function Closetime()
	{$("#Closetime").addClass("a2")}
	
	function Time()
	{$("#Time").addClass("a2")}
	
	function tel()
	{$("#tel").addClass("a2")}
	
	function resAdd()
	{$("#resAdd").addClass("a2")}
	
	
	//jquery地址
	$(function() {
		$('#twzipcode').twzipcode()
		$("input[name='zipcode']").addClass('code');//郵遞區號
		$("select[name='district']").attr("id","dd").addClass('countrydistrict').find(":selected").text();//某某區
		$("select[name='county']").attr("id","cc").addClass('countrydistrict').find(":selected").text();//某某縣市
		
	
		//把選好的值留下來
		$("option[value='${param.county}']").prop("selected", true);
		if ($("select[name='county']").change()) {
			$("option[value='${param.district}']").prop("selected", true);
		}
// 		function myFunction() {
// 		    var x = document.getElementById("dd").value;
// 		    var y = document.getElementById("cc").value;
// 		    document.getElementById("source").innerHTML = y + x;
// 		}
		var b=$("select[name='district']").find(":selected").val();
		var a=$("select[name='county']").find(":selected").val();
		
	});
	

	
	//	jquery時間	
	$(function() {
		$('#resOpentime').timepicker({
			'timeFormat' : 'H:i:A'
		});
		$('#resClosetime').timepicker({
			'timeFormat' : 'H:i:A'
		});
	});
	
	
    
    var split;
//地址轉經緯度
    function trans() {
    	var b=$("select[name='district']").find(":selected").val();
		var a=$("select[name='county']").find(":selected").val();
		 console.log(a);
		 console.log(b);
        i = 0;
        var content = $("#source").val();
        //呈現完整的地址
        split = a+b+content;
        console.log(split);
        delayedLoop();
        
    }

    function delayedLoop() {
        addressToLatLng(split);
        if (++i == split.length) {
            return;
        }
        window.setTimeout(delayedLoop, 1500);
    }

    function addressToLatLng(addr) {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({
            "address": addr
        }, function (results, status) {
			
            if (status == google.maps.GeocoderStatus.OK) {
             
              //把值塞進經緯度欄位
                $("#latt").val(results[0].geometry.location.lat());
                $("#lngg").val(results[0].geometry.location.lng());
               
           } 
        });
      
       
    }
	
</script>


        

</head>
<body>


	<div id="overlay"></div>
	<span id="menu"><i class="fa fa-navicon"></i></span>
	<header>
	<h1>
		<span>食府</span><br>歡迎你的加入
	</h1>
	</header>
	<jsp:include page="/indexleft.jsp" />
	<section>
	<div class="container">
		<article>

		<div class="box" style="width: auto;">

			<form class="well form-horizontal" action="<c:url value='/pages/information/registerCustomer' />"
				method="post" id="contact_form" enctype="multipart/form-data">
				<fieldset>

					<!-- Form Name -->
					<center>
						<legend>註冊會員</legend>
					</center>

					<div class="form-group">
						<label class="col-md-4 control-label">我是誰</label>
						<div class="col-md-4">
							<div class="radio">
								<label> <input type="radio" name="depId" value="10"
									onclick="check()" checked/> 掌櫃
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
									name="depId" value="20" onclick="uncheck()" /> 食客
								</label> <label style="color: red ; font-weight: 700;" id="who">${ErrMsg.depId}</label>
							</div>
						</div>

					</div>

					<script>
						$("input[value='${param.depId}']")
								.prop("checked", true);
					</script>

					<div class="form-group">
						<label class="col-md-4 control-label">上傳照片</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input name="pic"
									placeholder="" class="form-control" type="file">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label">暱稱</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input
									name="memberNicknName" placeholder="Your Name"
									class="form-control" type="text"
<%-- 									value="${requestScope.memberNicknName }"  --%>
                                         value="小當家"
									onclick="nicknname()">
							</div>
							<center>
								<label style="color: red;" id="nicknname">${ErrMsg.memberNicknName}</label>
							</center>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">帳號(E-Mail)</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> 
									<input name="memberAddress" placeholder="ex.seefood@gmail.com"
									class="form-control" type="email" 
<%-- 									value="${requestScope.memberAddress}"  --%>
                                        value="yicheng1231@yahoo.com.tw"
									id="userId" onclick="email()">
							</div>
							
							<div style='font-size: 10pt; text-align: right;'>
			    <a href='#' id='accountlink' style='font-size: 10pt;'>檢查帳號</a>
			</div>
			<div id='result0' style="height: 10px;"></div>
							<center>
								<label style="color: red;" id="address">${ErrMsg.memberAddress}</label>
							</center>
						</div>
					</div>


					<div class="form-group">
						<label class="col-md-4 control-label">密碼</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-pencil"></i></span>
								<!--         	<textarea class="form-control" name="memberBonus" placeholder="Project Description" ></textarea> -->
								<input class="form-control" type="PASSWORD"
									name="memberPassword" id="pwd1" placeholder="須包含!@#$%^&*、數字、英文"
<%-- 									value="${requestScope.memberPassword}" --%>
                                        value="service1231*"
									
									pattern="(?!.*[^a-zA-Z0-9!@#$%^&*])(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*]).{8,}" >
							</div>
							<center>
								<label id="pwd12" style="color: red;">${ErrMsg.memberPassword}</label>
							</center>
						</div>
					</div>

					<div class="form-group" style="height: auto;">
						<label class="col-md-4 control-label">確認密碼</label>
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-pencil"></i></span>
								<!--         	<textarea class="form-control" name="memberBonus" placeholder="Project Description" ></textarea> -->
								<input class="form-control" type="PASSWORD"
									name="memberPassword2" id="pwd2" minlength="8"
<%-- 									value="${requestScope.memberPassword2}" --%>
									value="service1231*"
									>
							</div>
							<center>
								<label id="pwd22" style="color: red;">${ErrMsg.memberPassword2}</label>
							</center>
						</div>
					</div>


					<fieldset id="t2" class="a2">
						<center>
							<legend>餐廳資料</legend>
						</center>
						<div id="t2" class="form-group">
							<label class="col-md-4 control-label">料理風格</label>
							<div class="col-md-4" onclick="res()">
								<div class="radio" >
									<label> <input type="radio" name="servItem" value="100" />
										異國料理
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="servItem" value="200" />
										日式料理
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="servItem" value="300" />西式餐廳
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="servItem" value="400"  checked/>中式餐廳
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="servItem" value="500" />健康素食
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="servItem" value="600" />甜點輕食
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="servItem" value="700" />複合餐廳
									</label>
								</div>
                                	<div class="radio">
									<label> <input type="radio" name="servItem" value="800" />泰式料理
									</label>
								</div>
                             
								<center>
									<label style="color: red;" id="res">${ErrMsg.resTypes}</label>
								</center>
							</div>
						</div>

						<script>
							$("input[value='${param.servItem}']").prop(
									"checked", true);
						</script>


						<div class="form-group">
							<label class="col-md-4 control-label">店名</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span> <input name="org_Text"
										placeholder="" class="form-control" type="text"
<%-- 										value="${requestScope.resName}"  --%>
                                            value="小當家的店"
										
										onclick="Text()">
								</div>
								<center>
									<label style="color: red;"id="Text">${ErrMsg.resName}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">推薦料理</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span> <input name="special"
										placeholder="" class="form-control" type="text"
<%-- 										value="${requestScope.special}"  --%>
										value="誠實豆沙包"
										onclick="spe()">
								</div>
								<center>
									<label style="color: red;" id="spe">${ErrMsg.special}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">平均價位</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span> <input name="price"
										placeholder="NT:~NT:" class="form-control" type="text"
<%-- 										value="${requestScope.price}" --%>
										value="NT:50~NT:100"
										onclick="pri()">
								</div>
								<center>
									<label style="color: red;" id="pri">${ErrMsg.price}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">營業時間</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span> <input
										name="resOpentime" id="resOpentime" placeholder=""
										class="time" type="text" 
<%-- 										value="${requestScope.resOpentime}" --%>
                                            value="10:30:AM "
										
										maxlength="8" onclick="Opentime()">
								</div>
								<center>
									<label style="color: red;" id="Opentime">${ErrMsg.resOpentime}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">休業時間</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span> <input
										name="resClosetime" id="resClosetime" placeholder=""
										class="time" type="text" 
<%-- 										value="${requestScope.resClosetime}" --%>
										  value="21:30:PM "
										maxlength="8" onclick="Closetime()">
								</div>
								<center>
									<label style="color: red;" id="Closetime">${ErrMsg.resClosetime}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">公休時間</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span> <input
										name="resRestTime" placeholder="每周一,每月1號" type="text"
<%-- 										value="${requestScope.resRestTime}"  --%>
										value="不公休"
										onclick="Time()">
								</div>
								<center>
									<label style="color: red;" id="Time">${ErrMsg.resRestTime}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">電話</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-earphone"></i></span> <input
										name="informtel" placeholder="0X-XXXXXXX" class="form-control"
										type="tel"
										pattern="[0][0-9]{1}[-]{1}[0-9]{7}||[0][0-9]{1}[-]{1}[0-9]{8}||[0][0-9]{1}[0-9]{1}[-]{1}[0-9]{7}||[0][0-9]{1}[0-9]{1}[-]{1}[0-9]{8}"
<%-- 										value="${requestScope.resPhone}" --%>
                                          value="03-8354031"
										 onclick="tel()">
								</div>
								<center>
									<label style="color: red;" id="tel">${ErrMsg.resPhone}</label>
								</center>
							</div>
						</div>

						<div id="tr1" class="a2">
							<!-- class="form-group"  frg_Id 緯度 經度-->
							<label class="col-md-4 control-label">frg_Id</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="frg_Id"
										placeholder="" class="form-control" type="text" value="5">
								</div>
								<center>
									<label style="color: red;">${ErrMsg.frg_Id}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">緯度</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="lat" id="latt"
										placeholder="" class="form-control" type="text" readonly value>
								</div>
								<center>
									<label style="color: red;">${ErrMsg.lat}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">經度</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="lng" id="lngg"
										placeholder="" class="form-control" type="text" readonly value>
									<%--   ${requestScope.lng} ${requestScope.lat}--%>
								</div>
								<center>
									<label style="color: red;">${ErrMsg.lng}</label>
								</center>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">地址</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <span id="twzipcode" ></span><input
										name="resAddress" placeholder="" class="form-control"
										type="text" 
<%-- 										value="${requestScope.resAddress}" --%>
										value="信義路四段92號"
										 onclick="resAdd()" id="source">
								</div>
								<center>
									<label style="color: red;"id="resAdd">${ErrMsg.resCity} ${ErrMsg.resArea} ${ErrMsg.resAddress}</label>
								</center>
                                <input type="button" value="開始轉換" name="B1" onclick="trans();">
                                
<!--                                 <textarea rows="9" name="S2" cols="67" id="target"></textarea> -->
							</div>
						</div>

					</fieldset>

					<div class="form-group">
						<label class="col-md-4 control-label"></label>
						<div class="col-md-4">
							<center>
								<button type="submit" class="btn btn-warning" >
									送出 <span class="glyphicon glyphicon-send" ></span>
									
								</button>
								
							</center>
						</div>
					</div>


				</fieldset>
			</form>
			<br>
			<center>
				<br> <a href="<c:url value="/index.jsp" />" style="color:;">回首頁</a>
			</center>
		</div>

		</article>
	</div>


	</section>
	<!-- 	<script -->
	<!-- 		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> -->
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
<!-- 		以下今天新增 -->
<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-1478416-8']);
		  _gaq.push(['_setDomainName', 'uhooamber.com']);
		  _gaq.push(['_trackPageview']);

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>
	
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOdlj2evg5vBlAzrA3Z8lSa7pLhvdqlAQ&callback=initMap" async defer></script>
</body>
</html>