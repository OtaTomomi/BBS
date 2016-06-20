<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "./css/style.css" rel = "stylesheet" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザー新規登録</title>
</head>
<body>

<div class = "header" >
<a href = "usercontroll">ユーザー管理画面</a>
<a href = "logout">ログアウト</a>
</div>

<h2>新規ユーザー登録</h2>



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




<div class = "signup">
<form action = "signup" method = "post">
<table border = "0" class = "sinup-table">

<tr>
	<td class = "row-left">
	<label for = "loginId">ログインID：</label>
	</td>
	<td class = "row-right">
		<input name = "loginId" value = "${ newUser.loginId }" id = "loginId"
		 placeholder="半角英数字、6文字以上20文字以下"size = "34" /><br />
	</td>
</tr>
<tr>
	<td class = "row-left">
	<label for = "name">名称：</label></td>
	<td class = "row-right">
	<input name = "name" value = "${ newUser.name }" id = "name"
	placeholder="10文字以下" size = "34"/>
	</td>
</tr>
<tr>
	<td class = "row-left">
	<label for = "password">パスワード：</label>
	</td>
	<td class = "row-right">
	<input name = "password" type = "password" id = "password"
	placeholder="半角英数字記号、6文字以上225文字以下"size = "34"/>
	</td>
</tr>
<tr>
	<td class = "row-left">
	<label for = "passwordCheck">パスワード(確認用)：</label>
	</td>
	<td class = "row-right">
	<input name = "passwordCheck" type = "password" id = "passwordCheck"
	placeholder="パスワードと同じものを入力"size = "34"/>
	</td>
</tr>
<tr>
	<td class = "row-left">
	支店名：
	</td>
	<td class = "row-right">
	<select name = "branchId" id = "branch">
		<c:forEach items = "${ branches }" var = "branch" >
			<option value = "${ branch.id }"
				<c:if test = "${ branch.id == 8}">
					class = "3"
				</c:if>
				<c:if test = "${ branch.id == 7}">
					class = "2"
				</c:if>
				<c:if test = "${ branch.id == 6}">
					class = "1"
				</c:if>
			<c:if test = "${ branch.id == 5}">
					class = "1"
				</c:if>
				<c:if test = "${ branch.id == 4}">
					class = "1"
				</c:if>
				<c:if test = "${ branch.id == 3}">
					class = "1"
				</c:if>
				<c:if test = "${ branch.id == 2}">
					class = "1"
				</c:if>
				<c:if test = "${ branch.id == 1}">
					class = "1"
				</c:if>

				<c:if test = "${ branch.id == newUser.branchId }"> selected</c:if>>
			<c:out value = "${ branch.name }"  />
			</option>
		</c:forEach>
	</select>
	</td>
</tr>
<tr>
	<td class = "row-left">
	部署・役職名：
	</td>
	<td class = "row-right">
	<select name = "positionId" id = "position">
		<c:forEach items = "${ positions }" var = "position" >
			<option value = "${ position.id }" id = "${ position.id }"

				<c:if test = "${ position.id == 5}">
					class = "3"
				</c:if>
				<c:if test = "${ position.id == 4}">
					class = "1"
				</c:if>
				<c:if test = "${ position.id == 3}">
					class = "1"
				</c:if>
				<c:if test = "${ position.id == 2}">
					class = "2"
				</c:if>
				<c:if test = "${ position.id == 1}">
					class = "2"
				</c:if>

					<c:if test = "${ position.id == newUser.positionId }">
					selected </c:if>>
				 <c:out value = "${ position.name }"  />
			</option>
		</c:forEach>
	</select>
	</td>
</tr>
<tr>
<td class = "submit-button" colspan="2">
<br />
<input type = "submit" value = "登録"
class = "button"style="width:224px;height:30px"/>
</td>
</tr>
</table>


	<c:remove var = "newUser" scope = "session" />

</form>
</div>





<script src = "http://code.jquery.com/jquery-3.0.0.min.js"></script>
	<script>


/*

	$('select#branch').change(function(){


		console.log($(this).val());
		$("select#branch option:selected").each(function () {



			var a,b,c,d,e;

			a = $('option#1').detach();
			b = $('option#2').detach();
			c = $('option#3').detach();
			d = $('option#4').detach();
			e = $('option#5').detach();


			if($(this).val() != 7 && $(this).val() != 8 ){
				$('select#position').append(c);
				$('select#position').append(d);
				console.log(a);
				console.log(c);
			}
			if($(this).val() == 7){
				$('select#position').append(a);
				$('select#position').append(b);
				console.log(a);
				console.log(c);

			}
			if($(this).val() == 8){
				$('select#position').append(a);
				$('select#position').append(b);
				$('select#position').append(c);
				$('select#position').append(d);
				$('select#position').append(e);

			}

		})

*/
$(function(){
	//$('select#position').change(function(){

		//console.log($('select#position').attr('select#position'));
	//})


	// 国名が変更されたら発動
	$('select[name="branchId"]').change(function() {

		// 選択されている国のクラス名を取得
		var branchName = $('select[name="branchId"] option:selected').attr("class");
		console.log(branchName);

		// 都市名の要素数を取得
		var count = $('select[name="positionId"]').children().length;

		// 都市名の要素数分、for文で回す
		for (var i=0; i<count; i++) {

			var position = $('select[name="positionId"] option:eq(' + i + ')');

			if(position.attr("class") === branchName) {
				// 選択した国と同じクラス名だった場合

				// 都市の要素を表示
				position.show();
			}else {
				// 選択した国とクラス名が違った場合
				if(position.attr("class") === "3") {
					// 「都市名を選択して下さい」という要素だった場合

						position.show();  //「都市名を選択して下さい」を表示させる
						position.prop('selected',true);  //「都市名を選択して下さい」を強制的に選択されている状態にする
				} else {

				// 都市の要素を非表示
				position.hide();
				}
			}
		}
	});







});




	</script>









</body>
</html>