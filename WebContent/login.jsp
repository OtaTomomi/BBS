<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "./css/style.css" rel = "stylesheet" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログイン</title>
</head>
<body>




<form action = "login" method = "post"><br />
<h2 class = "login">ログイン</h2>
<c:if test = "${ not empty errorMessages }">
	<div class = "errorMessagesLogin">
			<c:forEach items = "${ errorMessages }" var = "message"><c:out value = "${message}" /><br /></c:forEach>
	</div>
	<c:remove var = "errorMessages" scope = "session" />
	<br />
</c:if>



<div class = "login">
	<label for = "loginId"></label>
	<input name = "loginId" value = "${ loginId }" id = "loginId"placeholder="ID" size = "25"/><br />

	<br /><label for = "password"></label>
	<input name = "password" type = "password" id = "password" placeholder="パスワード" size = "25"/><br />
	<c:remove var = "loginId" scope = "session" />

	<br /><input type = "submit" value = "ログイン"style="width:192px;height:30px" class = "button" /><br />

 </div>
</form>

</body>
</html>