<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="subTitle" value="優惠券修改" />

<!--載入model.dao.ProductDAOJdbc類別，以bab當識別字串 -->
<jsp:useBean id="bab" class="_03_listCoupon.model.dao.CouponDAOJndi"
	scope="page" />
<!-- ${param.ID}:為maintain.jsp所傳送過來的變數，將此變數的值用setProperty傳送到CouponDAOJndi類別的setId方法 -->
<jsp:setProperty name="bab" property='id' value='${param.ID}' />
<!-- 使用c:set，取得CouponDAOJndi類別的select_1()方法的回傳值 -->
<c:set var="bean" value="${bab.select_1}" scope='session' />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${subTitle}</title>
<script type="text/javascript">
<!--使用GET方法傳送資料，這樣子ProductUpdate.do那邊才能用getPatemeter接資料-->
	function updateProduct() { //更新
		document.forms[0].action = "CouponUpdate.do";
		document.forms[0].method = "GET";
		document.forms[0].submit();
	}

	function confirmDelete() { //刪除
		if (confirm("確定刪除此ID資料(ID:${bean.cpId})?")) {
			document.forms[0].action = "CouponDelete.do";
			document.forms[0].method = "GET";
			document.forms[0].submit();
		} else {
		}
	}
</script>

</head>
<body>
	<c:choose>
		<c:when test="${not empty param.ID}">
			<!-- 
     <c:out value="第一次"/>
      -->
			<c:set var="cpId" value='${bean.cpId}' />
			<c:set var="cpResId" value='${bean.cpResId}' />
			<c:set var="cpType" value='${bean.cpType}' />
			<c:set var="cpData" value='${bean.cpData}' />
			<c:set var="cpPhoto" value='${bean.cpPhoto}' />
			<c:set var="cpHowBonus" value='${bean.cpHowBonus}' />
			<c:set var="cpStarTime" value='${bean.cpStarTime}' />
			<c:set var="cpOverTime" value='${bean.cpOverTime}' />
		</c:when>
		<c:otherwise>
			<!-- 
     <c:out value="第二次"/>
      -->
			<c:set var="cpId" value='${bean.cpId}' />
			<c:set var="cpResId" value='${bean.cpResId}' />
			<c:set var="cpType" value='${bean.cpType}' />
			<c:set var="cpData" value='${bean.cpData}' />
			<c:set var="cpPhoto" value='${bean.cpPhoto}' />
			<c:set var="cpHowBonus" value='${bean.cpHowBonus}' />
			<c:set var="cpStarTime" value='${bean.cpStarTime}' />
			<c:set var="cpOverTime" value='${bean.cpOverTime}' />
		</c:otherwise>
	</c:choose>
	<form id="form1" name="form1" method="GET" action="ProductUpdate.do"
		enctype="multipart/form-data">


		優惠券內容： <BR>
		<TABLE border='1'>
			<TR>
				<TH width=‘120’>cpId</TH>
				<TH width=‘120’>餐廳</TH>
				<TH width='140'>種類</TH>
				<TH width='170'>優惠內容</TH>
				<TH width='130'>產品圖片</TH>
				<TH width='130'>需求紅利</TH>
				<TH width='200'>優惠開始時間</TH>
				<TH width='130'>優惠結束時間</TH>
			</TR>
			<TR>
				<td width="15" align="right"><input name="id" type="text"
					id="id" value="${cpId}" readonly="readonly" size="10" /></td>
				<td width="25" align="right"><input name="name" type="text"
					id="name" value="${cpResId}" size="10" /></td>
				<td width="25" align="right"><input name="price" type="text"
					id="price" value="${cpType}" size="10" /></td>
				<td width="25" align="right"><input name="make" type="text"
					id="make" value="${cpData}" size="10" /></td>
				<td width="25" align="right"><input name="make" type="text"
					id="make" value="${cpPhoto}" size="10" /></td>
				<td width="25" align="right"><input name="expire" type="text"
					id="expire" value="${cpHowBonus}" size="10" /></td>
				<td width="25" align="right"><input name="expire" type="text"
					id="expire" value="${cpStarTime}" size="10" /></td>
				<td width="25" align="right"><input name="expire" type="text"
					id="expire" value="${cpOverTime}" size="10" /></td>
			</TR>
			<tr height='35'>
				<td colspan='5' align='center'><input type="button"
					name="update" value="修改" onclick='updateProduct()' />
					&nbsp;&nbsp;&nbsp; <input type="button" name="delete" value="刪除"
					onclick="confirmDelete()" /></td>
			</tr>

		</TABLE>
		<br> <a href="<c:url value='../index.jsp'/>">回首頁</a>
	</form>
</body>
</html>

