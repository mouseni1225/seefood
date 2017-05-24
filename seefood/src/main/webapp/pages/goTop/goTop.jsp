<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<style>
/* Start:回最頂端樣式 */
#gotop {
	display: none;
	position: fixed;
	right: 40px;
	bottom: 40px;
	padding: 10px 15px;
	font-size: 20px;
	background: #F64359;
	color: white;
	cursor: pointer;
	border-radius: 70px
}
/* End:回最頂端樣式 */
</style>

<!--Start:回到最頂端 (引入jQuery)，改用gotop的版本
-->
<script src='http://code.jquery.com/jquery-1.11.2.min.js'></script>
<!--End:回到最頂端 (引入jQuery)-->

<!--Start:回到最頂端功能-->
<script type="text/javascript">
	
	$(function() {
		$("#gotop").click(function() {
			jQuery("html,body").animate({
				scrollTop : 0
			}, 500);
		});

		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('#gotop').fadeIn("fast");
			} else {
				$('#gotop').stop().fadeOut("fast");
			}
		});
	});
</script>
<!--END:回到最頂端功能-->

</head>

<body>
<!-- <div style="height: 5000px;"></div> -->
<!--Start:回最頂端HTML呈現-->
	<b:if cond='data:blog.isMobile'>
		<b:else />
		<div id='gotop'>
			<center>^</center>
		</div>
	</b:if>
<!--End:回最頂端HTML呈現-->

</body>
</html>