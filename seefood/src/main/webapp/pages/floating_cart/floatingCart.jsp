<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
                                
<%-- <jsp:useBean id="SYSTEM" class="_A_init.GlobalService" --%>
<%-- 	scope="application" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--購物車樣式-->
<link rel="stylesheet" href="/seefood/css/sticky.css" media="screen" />
<!--購物車樣式-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<%-- <c:set var="AppName" value="${SYSTEM.systemName}" scope="application" /> --%>

<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">

</head>

<body>

	<CENTER>

		<!--浮動購物車 -->
		<div id="wrap">
			<div id="main">
				<div id="side">
					<div id="basket">
						<p>
							<!--<strong>$ 455.00</strong> -->
						</p>

						<a href="<c:url value='../_D_shopping/ShowCartContent.jsp' />"><span
							id="items"><br></span> </a>
					</div>
				</div>
			</div>
		</div>

	</CENTER>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		
	<script src="/seefood/js/jquery.easing.1.3.js"></script>

	<script src="/seefood/js/stickysidebar.jquery.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#basket").stickySidebar({
				timer : 400,
				easing : "easeInOutBack"
			});
		});
	</script>

</body>
</html>