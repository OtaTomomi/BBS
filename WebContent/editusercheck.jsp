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
<title>編集確認画面</title>

</head>
<body>
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
<div class = "header" >
<a href = "usercontroll">ユーザー管理画面</a>
<a href = "logout">ログアウト</a>
</div>

<h3>編集内容確認</h3>
		<div class = "warning"><FONT color = "	#ff0000">まだ編集は完了していません。</FONT><br />
		</div>
		<br />
		以下の情報で更新します。よろしいですか？<br />
		<br />
<table border = "0">


	<tr>
	<td class = "row-left">
		ログインID：
	</td>
	<td class = "row-right">
	<c:out value ="${ editUser.loginId }"/>
	</td>
	</tr>
	<tr>


		<c:if test = "${ empty editUser.password }">
		<td class = "row-left">パスワード：</td>
		<td class = "row-right">変更なし</td>
		</c:if>
		<c:if test = "${ !empty editUser.password }">
		<td class = "row-left">パスワード：</td>
		<td class = "row-right">変更あり</td>
		</c:if>
	</tr>
	<tr>
		<td class = "row-left">
		名称：
		</td>
		<td class = "row-right">
		<c:out value = "${ editUser.name }" />
		</td>
	</tr>
	<tr>
		<td class = "row-left">
		支店名：
		</td>
		<td class = "row-right">
		<c:forEach items = "${ branches }" var = "branch" >
			<c:if test = "${branch.id == editUser.branchId}">
				<c:out value = "${ branch.name }" /><br />
			</c:if>
		</c:forEach>
		</td>
	</tr>
	<tr>
		<td class = "row-left">
		部署・役職名：
		</td>
		<td class = "row-right">
		<c:forEach items = "${positions }" var = "position" >
			<c:if test = "${position.id == editUser.positionId}">
				<c:out value = "${ position.name }" /><br />
			</c:if>
		</c:forEach>
		</td>
	</tr>





	<tr>
	<td class = "submit-button" colspan="2">
	<br />
	<form action = "editusercheck" method = "post">
	<!------------------>
		<input type = "hidden" value = "${ editUser.id }" name = id />
		<input type = "hidden" value = "${ editUser.loginId }" name = loginId />
		<input type = "hidden" value = "${ editUser.password }" type = password name = password />
		<input type = "hidden" value = "${ editUser.name }" name = name />
		<input type = "hidden" value = "${ editUser.branchId }" name = branchId />
		<input type = "hidden" value = "${ editUser.positionId }" name = positionId />
		<input type = "hidden" value = "0" name = "revision" />



	<input type = "submit" value = "この内容で更新"onClick = "alert('更新しました')"
	class = "button"style="width:224px;height:30px"/><br />
	</form>
	</td>

	<tr>

	<td  class = "submit-button" colspan="2">
	<form action = "editusercheck" method = "post">

		<input type = "hidden" value = "${ editUser.id }" name = id />
		<input type = "hidden" value = "${ editUser.loginId }" name = loginId />
		<input type = "hidden" value = "${ editUser.password }" type = password name = password />
		<input type = "hidden" value = "${ editUser.name }" name = name />
		<input type = "hidden" value = "${ editUser.branchId }" name = branchId />
		<input type = "hidden" value = "${ editUser.positionId }" name = positionId />
		<input type = "hidden" value = "1" name = "revision" />
	<input type  = "submit" value = "戻る"
	class = "button"style="width:224px;height:30px" /><br />
	</form>
	</td>
	</tr>
</table>

</body>
</html>