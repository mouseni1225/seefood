<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:og='http://ogp.me/ns#'>
<head>
<meta charset="UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<link rel="stylesheet" href="css/index.css" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/style3.css" />"
	type="text/css">
<link rel='stylesheet prefetch'
	href='//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<script src="https://use.fontawesome.com/63852fa2ad.js"></script>
<script>
	$(function() {
		var myLatLng = {
			lat : 25.03678,
			lng : 121.5426981
		};
		var geocoder, map, lastCity;

		google.maps.event.addDomListener(window, 'load', initialize,
				'bounds_changed');
		spin();

		// Create the search box and link it to the UI element.
		var input = document.getElementById('pac-input');
		var searchBox = new google.maps.places.SearchBox(input);

		// Bias the SearchBox results towards current map's viewport.
		(function() {
			searchBox.setBounds(map.getBounds());
		});

		var markers = [];
		// Listen for the event fired when the user selects a prediction and retrieve
		// more details for that place.
		searchBox.addListener('places_changed', function() {
			var places = searchBox.getPlaces();
			if (places.length == 0) {
				return;
			}

			// Clear out the old markers.
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];

			// For each place, get the icon, name and location.
			var bounds = new google.maps.LatLngBounds();
			places.forEach(function(place) {
				if (!place.geometry) {
					console.log("Returned place contains no geometry");
					return;
				}
				var image = {
					scaledSize : new google.maps.Size(35, 35),
				};
				// Create a marker for each place.
				markers.push(new google.maps.Marker({
					map : map,
					icon : image,
					title : place.name,
					position : place.geometry.location
				}));

				if (place.geometry.viewport) {
					// Only geocodes have viewport.
					bounds.union(place.geometry.viewport);
				} else {
					bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
		});

		function spin() {
			$(".roller ul").css('animation',
					'scroll-numbers 1s linear infinite');
			$(".stop").text("你要吃什麼?").off().on("click", stop);
		}

		function stop() {
			var randomIndex = pickRandomIndex();
			var store = $($(".roller li").get(randomIndex)).text();
			console.log(randomIndex);
			var top = (randomIndex * -2);
			console.log(top);
			$(".roller ul").css({
				"top" : top-0.15 + "em",
				"animation" : "none"
			});
			geocodeAddress(store);//可選擇類型:store,city,area
			$(".stop").text("不喜歡嗎? 再轉一次").off().on("click", spin);
		}

		function pickRandomIndex() {
			return Math.floor(Math.random() * ($(".roller li").length - 1 + 1));
			alert(Math.floor(Math.random() * ($(".roller li").length - 1 + 1)));
		}

		function initialize() {
			geocoder = new google.maps.Geocoder();
			var latlng = new google.maps.LatLng(25.03678, 121.5426981);
			var mapOptions = {
				zoom : 17,
				center : latlng
			}
			map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
			geocodeAddress(myLatLng);
		}

		function geocodeAddress(addr) {
			lastCity = addr;
			geocoder.geocode(
							{
								'address' : addr
							},
							function(results, status) {
								if (status == 'OK') {
									map.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : map,
										position : results[0].geometry.location
									});
								} else {
// 									alert('Geocode was not successful for the following reason: '
// 											+ status);
								}
							});
		}
	});
</script>

</head>

<body>
	<script type="text/javascript"
		src="//maps.googleapis.com/maps/api/js?key=AIzaSyCt3_Zx8d8ZCeOottS5wJEcKsZDrcpgXJQ&libraries=places&callback"></script>
	<script
		src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script>
		function tMap() {
			var area = document.getElementById("area").value;
			var category = document.getElementById("category").value;
			console.log(area);
			console.log(category);

			$
					.ajax({
						type : 'GET',
						//url:'http://data.kaohsiung.gov.tw/Opendata/DownLoad.aspx?Type=2&CaseNo1=AE&CaseNo2=6&FileType=1&Lang=C&FolderType=', 
						//url : '01.json',
						
						//url :'http://localhost:8080/seefood/pages/information/ConnectionMap',
						  url :'http://seefood.azurewebsites.net/seefood/pages/information/ConnectionMap',
						dataType: "json",
						
						success : function(data) {
							var myLatLng = {
								lat : 25.03678,
								lng : 121.5426981
							};

							var map = new google.maps.Map(document
									.getElementById('map-canvas'), {
								zoom : 13, //map視窗遠近
								center : myLatLng, //我的中心點
								fullscreenControl : true
							//全螢幕
							});

							// Create the search box and link it to the UI element.
							var input = document.getElementById('pac-input');
							var searchBox = new google.maps.places.SearchBox(
									input);

							// Bias the SearchBox results towards current map's viewport.
							map.addListener('bounds_changed', function() {
								searchBox.setBounds(map.getBounds());
							});

							var markers = [];
							// Listen for the event fired when the user selects a prediction and retrieve
							// more details for that place.
							searchBox
									.addListener(
											'places_changed',
											function() {
												var places = searchBox
														.getPlaces();
												if (places.length == 0) {
													return;
												}

												// Clear out the old markers.
												markers
														.forEach(function(
																marker) {
															marker.setMap(null);
														});
												markers = [];

												// For each place, get the icon, name and location.
												var bounds = new google.maps.LatLngBounds();
												places
														.forEach(function(place) {
															if (!place.geometry) {
																console
																		.log("Returned place contains no geometry");
																return;
															}
															var image = {

																size : new google.maps.Size(
																		71, 71),
																origin : new google.maps.Point(
																		0, 0),
																anchor : new google.maps.Point(
																		17, 34),
																scaledSize : new google.maps.Size(
																		35, 35)
															};
															// Create a marker for each place.
															markers
																	.push(new google.maps.Marker(
																			{
																				map : map,
																				icon : image,
																				title : place.name,
																				position : place.geometry.location
																			}));

															if (place.geometry.viewport) {
																// Only geocodes have viewport.
																bounds
																		.union(place.geometry.viewport);
															} else {
																bounds
																		.extend(place.geometry.location);
															}
														});
												map.fitBounds(bounds);
											});

							for (i = 0; data.length > i; i++) {

								//var thisData = JSON.parse(data);
								var thisData = data;
								var str;
								var informaddress = thisData[i].informaddress;
								var servItem = thisData[i].servItem;
								var address = thisData[i].dataOrg;
								var informtel = thisData[i].informtel;
								var informname = thisData[i].org_Text;
								var informtime = thisData[i].time;
								var informprice = thisData[i].price;
								var informdish = thisData[i].special;
								var informinfo = thisData[i].info;
								var informfriendly = thisData[i].friendly;

								if (informaddress.match(area)
										&& servItem.match(category)) {

									str = '<li>' + thisData[i].id + '</li>';
									var lat = '<li>' + thisData[i].lat
											+ '</li>';
									var lng = '<li>' + thisData[i].lng
											+ '</li>';
									$('.inform').append(str, lat, lng);
									var uta = thisData[i].lat;
									var lnga = thisData[i].lng;
									var locate = {
										lat : parseFloat(uta),
										lng : parseFloat(lnga)
									};
									addMarker(category);
								}
							}

							function addMarker(category) {
								//判斷 category 是不是不限//
								if (category != '') {
									var image = {
										url : 'img/' + category + '.png',
										scaledSize : new google.maps.Size(35,
												35),
									};
								}

								var marker = new google.maps.Marker({
									position : locate,
									map : map,
									title : 'Hello World!',
									animation : google.maps.Animation.DROP,
									icon : image
								});

								var infowindow = new google.maps.InfoWindow(
										{
											content : '<div style="font-size:20px;color:blue;"><h1>店家資訊</h1><br><button onclick="Data()" >加入轉盤</button></div>'//點擊function叫Data
													+ '<p style="color:red;">店家名稱:</p>'
													+ '<span id=info>'
													+ informname
													+ '</span>'
													+ '<p style="color:red;">電話:</p>'
													+ informtel
													+ '<p style="color:red;">營業時間:</p>'
													+ informtime
													+ '<p style="color:red;">價位:</p>'
													+ informprice
													+ '<p style="color:red;">推薦菜色:</p>'
													+ informdish
													//+ '<p style="color:red;">簡介:</p>'+ informinfo
													+ '<p style="color:red;">店家地址:</p>'
													+ '<span id=infoaddr>'
													+ informaddress
										});
								marker.addListener('click', toggleBounce); //click事件 點擊點彈出資訊視窗
								google.maps.event.addListener(marker, 'click',

								function() {
									infowindow.open(map, marker);
								});
								
	
								marker.addListener('onblur', toggleBounce);
								google.maps.event.addListener(marker, 'onblur',
										function() {
											infowindow.close(map, marker);
										});

								function toggleBounce() {
									if (marker.getAnimation() !== null) {
										marker.setAnimation(null);
									} else {
										marker
												.setAnimation(google.maps.Animation.BOUNCE);
									}
								}
							}
						}

					});
		}
		//用陣列放選取的餐廳
		var x = 1
		var i = ".";
		var Arrays = new Array();

		function Data(category) {

			var itemname = $('#info').html(); //取得單一餐廳的值
			var itemaddress = $('#infoaddr').html();
			var thisID = $(this).attr(itemname);
			var thisIDA = $(this).attr(itemaddress);
			Arrays.push(itemname, itemaddress);
			$('#yet').append(
					'<li class='+x+'>' + itemname + '</li>' + "<button class="
							+ x + " " + "onclick='remove(" + '"' + '.' + x
							+ '"' + ")'" + '>刪除</button>');//<ul>底下增加<li>欄位
			// 			$('#ye').append('<li class='+x+' id='+x+'>' + itemname + '</li>');//<ul>底下增加<li>欄位
			$('#ye').append(
					'<a href="/seefood/pages/map0331/test?name=' + itemaddress
							+ '">' + '<li class='+x+' id='+x+'>' + itemname
							+ '</li>' + '</a>');//<ul>底下增加<li>欄位

			x = x + 1;
		}

		var Arrays = new Array();
		function remove(i) {
			//$('#yet').remove('<li>' + itemname + '</li>');
			//$('#ye').remove('<li>' + itemname + '</li>');
			$(i).remove();
		}
	</script>

	<script>
		function initMap() {
			var map = new google.maps.Map(
					document.getElementById('map-canvas'), {
						center : {
							lat : 22.663,
							lng : 120.344
						},
						zoom : 17,
						scrollwheel : false
					});
			var infoWindow = new google.maps.InfoWindow({
				map : map
			});

			// Create the search box and link it to the UI element.
			var input = document.getElementById('pac-input');
			var searchBox = new google.maps.places.SearchBox(input);

			// Bias the SearchBox results towards current map's viewport.
			map.addListener('bounds_changed', function() {
				searchBox.setBounds(map.getBounds());
			});

			var markers = [];
			// Listen for the event fired when the user selects a prediction and retrieve
			// more details for that place.
			searchBox.addListener('places_changed', function() {
				var places = searchBox.getPlaces();
				if (places.length == 0) {
					return;
				}

				// Clear out the old markers.
				markers.forEach(function(marker) {
					marker.setMap(null);
				});
				markers = [];

				// For each place, get the icon, name and location.
				var bounds = new google.maps.LatLngBounds();
				places.forEach(function(place) {
					if (!place.geometry) {
						console.log("Returned place contains no geometry");
						return;
					}
					var image = {
						size : new google.maps.Size(71, 71),
						origin : new google.maps.Point(0, 0),
						anchor : new google.maps.Point(17, 34),
						scaledSize : new google.maps.Size(25, 25)
					};
					// Create a marker for each place.
					markers.push(new google.maps.Marker({
						map : map,
						icon : image,
						title : place.name,
						position : place.geometry.location
					}));

					if (place.geometry.viewport) {
						// Only geocodes have viewport.
						bounds.union(place.geometry.viewport);
					} else {
						bounds.extend(place.geometry.location);
					}
				});
				map.fitBounds(bounds);
			});

			// Try HTML5 geolocation.
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var pos = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};

					infoWindow.setPosition(pos);
					infoWindow.setContent('Your Position.');
					map.setCenter(pos);
				}, function() {
					handleLocationError(true, infoWindow, map.getCenter());
				});
			} else {
				// Browser doesn't support Geolocation
				handleLocationError(false, infoWindow, map.getCenter());
			}
		}

		function handleLocationError(browserHasGeolocation, infoWindow, pos) {
			infoWindow.setPosition(pos);
			infoWindow.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
							: 'Error: Your browser doesn\'t support geolocation.');
		}
		
		

	</script>



	<div id="overlay"></div>
	<span id="menu"><i class="fa fa-navicon"></i></span>
	<header>
	<h1>
		<span>食府</span><br>帶你找好餐館
	</h1>
	</header>
	<jsp:include page="/indexleft.jsp" />
	<section >
	<div class="container" onclick="hiddiv()">



		<div class="map-canvas">

			<div class="index_space"></div>


			<div class="select_result">
				<div id="map-canvas"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</section>
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
	<div class="ooo" align="center">

		<ul>
			<div class="box2">
				<li>搜尋店家<br> <input id="pac-input" class="controls"
					type="text" placeholder="搜尋">
					<div id="map"></div>
					<br>
				</li>
			</div>

			<div class="box2">
				<li>請選擇地區<br> <select id="area">
						<option value="" disabled selected>--請選擇--</option>
						<option value="大安區">大安區</option>
						<option value="中正區">中正區</option>
						<option value="中山區">中山區</option>
						<option value="信義區">信義區</option>
						<option value="大同區">大同區</option>
						<option value="板橋區">板橋區</option>
						<option value="三峽區">三峽區</option>
						<option value="松山區">松山區</option>
						<option value="淡水區">淡水區</option>
						<option value="三重區">三重區</option>
						<option value="汐止區">汐止區</option>
						<option value="萬華區">萬華區</option>
						<option value="汐止區">汐止區</option>
						<option value="中和區">中和區</option>
						<option value="新店區">新店區</option>
						<option value="南港區">南港區</option>
						<option value="士林區">士林區</option>
						<option value="北投區">北投區</option>
						<option value="內湖區">內湖區</option>
						<option value="文山區">文山區</option>
						<option value="">不限</option>
				</select>
				</li> <br>
				<li>請選擇類別<br> <select id="category">
						<option value="" disabled selected>--請選擇--</option>
						<option value="異國料理">異國料理</option>
						<option value="健康素食">健康素食</option>
						<option value="西式餐廳">西式餐廳</option>
						<option value="中式餐廳">中式餐廳</option>
						<option value="日式料理">日式料理</option>
						<option value="泰式料理">泰式料理</option>
						<option value="複合餐廳">複合餐廳</option>
						<option value="甜點輕食">甜點輕食</option>
						<option value="">不限</option>
				</select>
				</li> <br> <input class="select_btn" type="submit" onclick="tMap()">
			</div>
			<div class="box2">
				<li>您的選擇<br>
					<ul id="yet">
					</ul>
				</li>
			</div>
	</div>
	<!-- 餐廳選單的空間 -->
	<section class="spinner">
	<div class="roller">
		<ul id="ye" class="test">
		</ul>
	</div>
	<footer>
	<button class="stop">你要吃什麼?</button>
	</footer> 
	</section>
</body>
</html>