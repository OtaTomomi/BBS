<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "./css/style.css" rel = "stylesheet" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新規投稿</title>
</head>
<body>
<div class = "main-contents">

<div class = "header" >
<a href = "home">ホーム画面</a>
<a href = "logout">ログアウト</a>
</div>
<h2>新規投稿</h2>
</div>
<c:if test = "${ not empty errorMessages }" >
	<div class = "errorMessages">
		<ul>
			<c:forEach items = "${ errorMessages }" var = "message">
				<li><c:out value = "${ message }" /></li>
			</c:forEach>
		</ul>
	</div>
	<c:remove var = "errorMessages" scope = "session" />
</c:if>


	<form action = "posting" method = "post"><br />
		<div class = "form-area">
		<table border = "0">
		<tr>
		<td class = "row-left">
			件名：
		</td>
		<td class = "row-right">
			<input type = "text" name = "subject"<c:if test = "${ message != null }"> value = "${ message.subject}"</c:if> size = "100"placeholder="50字以内で入力してください">
		</td>
		</tr>
		<tr>
		<td class = "row-left-special">
			本文：
		</td>
		<td class = "row-right">
			<textarea name = "text" cols = "102" rows = "10" class = "text-box" wrap = "hard"placeholder="1000字以内で入力してください"><c:if test = "${ message != null }"><c:out value = "${ message.text}" /></c:if></textarea>
		</td>
		<tr>
		<td class = "row-left">
			カテゴリー：
		</td>
		<td class = "row-right">
			<input type = "text" name = "category"<c:if test = "${ message != null }"> value = "${ message.category}"</c:if> size = "20"placeholder="10字以内で入力してください">
		</td>
		<tr>
		<td class = "putting-button" colspan="2">
			<c:remove var = "message" scope = "session" />
			<input type = "submit" value = "投稿" class = "button">
		</td>
		</tr>
		</table>
		</div>
	</form>
</body>
</html>