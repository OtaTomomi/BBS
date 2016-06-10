<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "./css/style.css" rel = "stylesheet" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編集画面</title>
<c:if test = "${ not empty error}">
	<meta http-equiv="refresh" content="5;URL=usercontroll">
</c:if>

</head>
<body>


<c:if test = "${not empty error}">
	編集画面に飛ぶにはユーザー管理画面からやり直してください。5秒後に遷移します。
	遷移しない場合はリンクをクリックしてください
	<a href = "usercontroll">ユーザー管理画面</a>

</c:if>

<c:if test = "${ empty error}">
<div class = "header" >
<a href = "usercontroll">ユーザー管理画面</a>
<a href = "logout">ログアウト</a>
</div>
<h3>${superEditUser.name}の編集</h3>

<c:if test = "${ not empty errorMessages }">
	<div class = "errorMessages">
		<ul>
			<c:forEach items = "${ errorMessages }" var = "message">
				<li><c:out value = "${message}" /></li>
			</c:forEach>
		</ul>
	</div>
	<c:remove var = "errorMessages" scope = "session" />
</c:if>



<form action = "edituser" method = "post">
<table border = "0">
	<tr>
	<td class = "row-left">
		<label for = "loginId" >ログインID：</label>
	</td>
	<td class = "row-right">
		<input name = "loginId" value = "${ editUser.loginId }" id = "loginId"
		placeholder="半角英数字、6文字以上20文字以下"size = "34" />
	</td>
	</tr>
	<tr>
	<td class = "row-left">
		<label for = "name" >名称：</label>
	</td>
	<td class = "row-right">
		<input name = "name" value = "${ editUser.name }"  id = "name"
		placeholder="10文字以下" size = "34"/>
	</td>
	</tr>
	<tr>
		<td class = "row-left">
		<label for = "password" >パスワード：</label>
		</td>
		<td class = "row-right">
		<input name = "password"  type = "password" id = "password"
		placeholder="半角英数字記号、6文字以上225文字以下"size = "34"/>
		</td>
	</tr>
	<tr>
		<td class = "row-left">
		<label for = "passwordCheck">パスワード(確認用)：</label>
		</td>
		<td class = "row-left">
		<input name = "passwordCheck" type = "password" id = "passwordCheck"
		placeholder="パスワードと同じものを入力"size = "34"/>
		</td>
	</tr>
	<tr>
		<td class = "row-left">
		支店名：
		</td>
		<td class = "row-right">
		<select name = "branchId" >
			<c:forEach items = "${ branches }" var = "branch" >
				<option value = "${ branch.id }"
					<c:if test = "${branch.id == editUser.branchId}">
					selected
					</c:if>
				><c:out value = "${ branch.name }"  />
				</option>
			</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td class = "row-left">
		部署・役職名：
		</td>
		<td class = "right">
		<select name = "positionId" >
			<c:forEach items = "${ positions }" var = "position" >
				<option value = "${ position.id }"
					<c:if test = "${position.id == editUser.positionId}">
					selected
					</c:if>
				>
				<c:out value = "${ position.name }"  />

				</option>
			</c:forEach>
		</select>
		<input type = "hidden" value = "${ editUser.id }" name = "id" />
		</td>
	</tr>
	<tr>
		<td colspan="2"class = "submit-button">
		<br />
		<input type = "submit" value = "編集内容を確認"class =  "button"
		style="width:224px;height:30px" />
		</td>
	</tr>

</table>
</form>
</c:if>






</body>
</html>