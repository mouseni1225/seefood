<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seefood-食府</title>
<link rel="shortcut icon"
	href="../map0331/img/%E4%B8%AD%E5%BC%8F%E9%A4%90%E5%BB%B3.png">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
</head>
<body>
<div style="padding-top: 0px;">
    <img style="width: 130px;padding-left: 60px;" alt="" src="<c:url value="/images/here.jpg" />">
    <center>
        <h2>${message}</h2>
<%--         <h3>${filePath}</h3> --%>
<!--         <input type="text" name="" -->
<%-- 					value="${filePath}" readonly> --%>
		<textarea  rows="8" cols="60" readonly>${filePath}</textarea>
		<a name='8'></a>
    </center>
    </div>
</body>
</html>