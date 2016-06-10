<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "./css/style.css" rel = "stylesheet" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー管理画面</title>



</head>
<body>
<div class = "main-contents">
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
</div>

<div class = "header" >
<a href = "signup">新規登録画面</a>
	<a href = "home">ホーム画面</a>
	<a href = "logout">ログアウト</a><br />
</div>


<br />
<h2>ユーザー管理</h2>

	<table class = "user-table" cellspacing="1" cellpadding="6" border="0">
		<tr>
			<th class = "id">ID</th><th class = "name">名称</th><th class = "option">支店名</th>
			<th class = "option">部署・役職</th><th class = "button">利用制限</th><th class = "button">削除実行</th>
		</tr>
		<c:forEach items = "${ users }" var = "user" >
				<tr class = "row">
					<td class = "row"><c:out value = "${ user.loginId }"  /></td>
					<td class = "row">
					<form action = "edituser" method = "get">
						<input type = "hidden" name = "userId" value = "${ user.id }">
						<a href = "edituser?userId=${ user.id }">
						<c:out value = "${ user.name }"  /></a>
						<span class = "user-button">
						<%--
							<input type = "submit" value = 編集 class = "button">
						 --%>
						</span>
					</form>
					</td>
					<td class = "row-option">
					<c:forEach items = "${ branches }" var = "branch">
						<c:if test = "${ branch.id == user.branchId }">
							<c:out value = "${ branch.name }"/>
						</c:if>
					</c:forEach>
					</td>
					<td class = "row-option">
					<c:forEach items = "${ positions }" var = "position">
						<c:if test = "${ position.id == user.positionId }">
							<c:out value = "${ position.name }"/>
						</c:if>
					</c:forEach>
					</td>
					<td class = "row-button">
					<form action = "usercontroll" method = "post" >
						<c:if test = "${ user.useable == true }"  >
							<input type = "hidden" name = "useable" value = "false">
							<input type = "hidden" name = "userId" value = "${ user.id }">
							<input type = "submit" name = "useableButton" value = "停止"
							onClick = "return confirm('本当に${ user.name }を停止してよろしいですか？')"
							<c:if test = "${ loginUser.id == user.id }">disabled="disabled"</c:if>
							<c:if test = "${ loginUser.id != user.id }">class = "button"</c:if>>
						</c:if>
					</form>
					<form action = "usercontroll" method = "post">
						<c:if test = "${ user.useable == false }"  >
							<input type = "hidden" name = "useable" value = "true">
							<input type = "hidden" name = "userId" value = "${ user.id }">
							<input type = "submit" name = "useableButton" value = "復活"
							onClick = "return confirm('本当に${ user.name }を復活させてよろしいですか？')"
							<c:if test = "${ loginUser.id == user.id }">disabled="disabled"</c:if>
							<c:if test = "${ loginUser.id != user.id }">class = "button"</c:if>>
						</c:if>
					</form>
					</td>
					<td class = "row-button">
						<form action = "usercontroll" method = "post">
						<input type = "hidden" name = "delete" value = "1">
						<input type = "hidden" name = "userId" value = "${ user.id }">
						<input type = "submit" name = "delete" value = "削除" onClick = "return confirm('本当に${ user.name }を削除してよろしいですか？')"
						<c:if test = "${ loginUser.id == user.id }">disabled="disabled"</c:if>
						<c:if test = "${ loginUser.id != user.id }">class = "button"</c:if>>
						</form>

					</td>
				</tr>



		</c:forEach>

	</table>

	<br />






</body>
</html>