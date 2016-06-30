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
<title>ホーム</title>
</head>
<body>



<div class = "header" >
<a href = "posting">新規投稿画面</a>
<c:if test = "${ loginUser.branchId == 7 && loginUser.positionId == 1 }">
	<a href = "usercontroll">ユーザー管理画面</a>
</c:if>

<a href = "logout">ログアウト</a>
</div>
<h2>ホーム</h2>
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

<br />
<div class = "search">

<form action = "home" method = "get"name = "search">
<table border = "0">
<tr>
<td class = "row-search">
	カテゴリーを指定して検索
</td>
<td class = "row-right">
	：&nbsp;<input type = "text" name = "category" size = "20" class = "categrysearch-box" value = "${category }">
</td>
</tr>
<tr>
<td class = "row-search">
	日にちを指定して検索
</td>
<td class = "row-right">
	：&nbsp;<select name = "beginYear" >
		<c:forEach begin = "${ defaultBeginDate.year }"  var = "year" end = "${defaultEndDate.year}">
			<option value = "${ year }"
				<c:if test = "${ year == beginDate.year }">
				 selected
				</c:if>
				><c:out value = "${ year }"  />
			</option>
		</c:forEach>
	</select>年

	<select name = "beginMonth"onchange="beginDaySet()" >
			<c:forEach items = "${ months }"  var = "month">
				<option value = "${ month }"
				<c:if test = "${ month == beginDate.month}">
				 selected
				</c:if>
				><c:out value = "${ month }"  />
				</option>
			</c:forEach>
	</select>月

	<select name = "beginDay" >
			<c:forEach items = "${ days }"  var = "day">
				<option value = "${ day }"
				<c:if test = "${ day == beginDate.day }">
				 selected
				</c:if>
				><c:out value = "${ day }"  />
				</option>
			</c:forEach>
	</select>日

	～
	<select name = "endYear" >
			<c:forEach begin = "${ defaultBeginDate.year }"  var = "year" end = "${defaultEndDate.year}">
				<option value = "${ year }"<c:if test = "${ year == endDate.year }">
				 selected
				</c:if>>
				<c:out value = "${ year }"  />
				</option>
			</c:forEach>
	</select>年

	<select name = "endMonth"onchange="daySet()" >
			<c:forEach items = "${ months }"  var = "month">
				<option value = "${ month }"
				<c:if test = "${month == endDate.month}">
				 selected
				</c:if>><c:out value = "${ month }"  />
				</option>
			</c:forEach>
	</select>月

	<select name = "endDay" >
			<c:forEach items = "${ days }"  var = "day">
				<option value = "${ day }"
				<c:if test = "${ day == endDate.day }">
				 selected
				</c:if>><c:out value = "${ day }"  />
				</option>
			</c:forEach>
	</select>日
	<input type = "hidden" value = "1" name = "search">
	<input type = "submit" value = "検索"class = "button">

	</td>

	</tr>
</table>
</form>
	<form action = "home" method = "post">
		<input type = "hidden" value = "1" name = "reset">
		<input type = "submit" value = "検索リセット" class = "button">
	</form>











</div>

<br />
<c:forEach items = "${ userMessages }" var = "userMessage" >
<div class = "tables">
	<table border = "1" align = "center" class = "table">
		<tr class = "first-sell">

			<td class = "subject">
			<div class = "subject"><c:out value = "${ userMessage.subject }" /></div>
			</td>
		</tr>
		<tr>
			<td class = "contents">
			<div class = "text">
			<pre><font size = +1 ><c:out value = "${ userMessage.text }" /></font></pre></div>
			<div class = "postInfo">
				<font size = -1>投稿者：</font><span class = "user"><c:out value = "${ userMessage.userName }" /></span>
				<font size = -1>投稿日時：</font><span class = "insert"id = "${userMessage.id }">
				<fmt:formatDate value = "${ userMessage.insertDate }" pattern = "yyyy/MM/dd HH:mm:ss"/>
					</span>
				<font size = -1>カテゴリー：</font><span class = "category"><c:out value = "${ userMessage.category }" /></span>





			</div>
				<span class = "deleteButton">
				<c:if test = "${ loginUser.branchId == 7 && loginUser.positionId == 2 }">
					<form action = "home" method = "post">
						<input type = "hidden" value ="${ userMessage.id }" name = "deleteMessageId">
						<input type = "submit" value = "投稿削除"class = "button"
						onClick = "return confirm('本当にこの投稿を削除してよろしいですか？')">
					</form>
				</c:if>
				<c:if test = "${ loginUser.positionId != 2 }">
					<c:if test = "${ loginUser.positionId == 3 }">
						<c:forEach items = "${ users }" var = "user">
							<c:if test = "${ userMessage.userName == user.name }">
								<c:if test = "${ loginUser.branchId == user.branchId && user.positionId ==4}">
							 		<form action = "home" method = "post">
										<input type = "hidden" value ="${ userMessage.id }" name = "deleteMessageId">
										<input type = "submit" value = "投稿削除"class = "button"
										onClick = "return confirm('本当にこの投稿を削除してよろしいですか？')">
									</form>
							 	</c:if>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test = "${ userMessage.userName == loginUser.name }">
						<form action = "home" method = "post">
							<input type = "hidden" value ="${ userMessage.id }" name = "deleteMessageId">
							<input type = "submit" value = "投稿削除"class = "button"
							onClick = "return confirm('本当にこの投稿を削除してよろしいですか？')">
						</form>
					 </c:if>
				</c:if>
				</span>

			</td>
			</tr>

		<c:forEach items = "${ userComments }" var = "userComment" >
			<c:if test = "${ userMessage.id == userComment.messageId }" >
			<tr class = "comment">
				<td class = "comment">
					<div class = comment>
						<div class = commentText>
							<pre class = "cmmentText"><c:out value = "${ userComment.commentText }" /></pre><br />
						</div>
						<div class = "commentInfo">
						<%--<font size = -1> --%>
						<span class = commentName>
							<c:out value = "${ userComment.commentName }" />
						</span>
						&nbsp;
						<span class = commentInsertDate id = "${userComment.commentId }">
							<fmt:formatDate value = "${ userComment.commentInsertDate }"
							pattern = "yyyy/MM/dd HH:mm:ss"/>
						</span>

						<script src = "http://code.jquery.com/jquery-3.0.0.min.js"></script>
	<script>

	$(function(){
    	$("span.commentInsertDate#${ userComment.commentId }").mouseover(function(){
    		var insertDate = Date.parse("${ userComment.commentInsertDate }") / 1000;
   			today = Math.ceil(new Date()/1000);
   			relativeTime = today - insertDate ;
   		var marginTop = 0;
	     	var marginLeft = 0;
	     	var speed = 300;
	     	var pop;
	     	pop = $("<p/>").addClass("popWindow").appendTo($("body"));
			if(relativeTime < 5){
   			var msg = "たった今";
   		}
   		if(5 <= relativeTime &&relativeTime < 60){
   			var msg = "約" + relativeTime + "秒前";
   		}
   		if(60 <= relativeTime && relativeTime < 3600){
   			var minits = Math.round(relativeTime / 60);
   			var msg = "約" + minits + "分前";
   		}
   		if(3600 <= relativeTime && relativeTime < 86400){
   			var hour = Math.round(relativeTime / 3600);
   			var msg = "約" + hour + "時間前";
   		}
   		if(86400 <= relativeTime && relativeTime < 604800){
   			var day = Math.round(relativeTime / 86400);
   			var msg = "約" + day + "日前";
   		}
   		if(604800<= relativeTime && relativeTime < 2419200){
   			var week = Math.round(relativeTime / 604800);
   			var msg = "約" + week + "週前";
   		}
   		if(2419200 <= relativeTime && relativeTime < 29030400){
   			var month = Math.round(relativeTime / 2419200);
   			var msg = "約" + month + "月前";
   		}
   		if(29030400 <= relativeTime){
   			var year = Math.round(relativeTime / 29030400);
   			var msg = "約" + year + "年前";
   		}
   		pop.text(msg);
    		var offsetTop = $(this).offset().top + marginTop;
    		var offsetLeft = $(this).offset().left + marginLeft;
    		pop.css({
    		      "top": offsetTop,
    		      "left": offsetLeft
    		    }).show(speed);
    	}).mouseout(function(){
    		 $(".popWindow").text("").hide("fast");
    	});
	});
				</script>




						<%--</font> --%>
						</div>
						<div class = "commentDeleteButton">
							<c:if test = "${ loginUser.branchId == 7 && loginUser.positionId == 2 }">
								<form action = "home" method = "post">
									<input type = "hidden" value ="${ userComment.commentId }" name = "deleteCommentId">
									<input type = "submit" value = "コメント削除"class = "button"
									onClick = "return confirm('本当にこのコメントを削除してよろしいですか？')">
								</form>
							</c:if>
							<c:if test = "${loginUser.positionId != 2 }">
								<c:if test = "${ loginUser.positionId == 3 }">
									<c:forEach items = "${ users }" var = "user">
										<c:if test = "${ userComment.commentName == user.name }">
											<c:if test = "${ loginUser.branchId == user.branchId
											 && user.positionId ==4}">
							 					<form action = "home" method = "post">
													<input type = "hidden" value ="${ userComment.commentId }" name = "deleteCommentId">
													<input type = "submit" value = "コメント削除"class = "button"
													onClick = "return confirm('本当にこのコメントを削除してよろしいですか？')">
												</form>
							 				</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test = "${ userComment.commentName == loginUser.name }">
									<form action = "home" method = "post">
										<input type = "hidden" value ="${ userComment.commentId }" name = "deleteCommentId">
										<input type = "submit" value = "コメント削除"class = "button"
										onClick = "return confirm('本当にこのコメントを削除してよろしいですか？')">
									</form>
								 </c:if>
							</c:if>
						</div>
					</div>
					</td>
				</tr>
			</c:if>
		</c:forEach>
		<tr>
			<td class = "comment-post">

			<form action = "home" method = "post">
			<div class = "comment-area">

			<span class = "postCommentTitle">
			コメント投稿&nbsp;：&nbsp;
			 </span>
					<textarea name = "commentText" cols = "100" rows = "5" class = "comment-box" wrap = "hard"placeholder="500字以下で入力してください"></textarea>
					<input type = "hidden" value ="${ userMessage.id }" name = messageId>
				</div>
				<div class = "postCommentButton"><input type = "submit" value = "コメント投稿"class = "button"style="width:100px;height:30px"></div>

			</form>
			</td>
				</tr>



	</table>
	<br />
	</div>





<c:if test = "${ userMessages.size() == 0 }">
検索に一致する投稿はありません
</c:if>

<script src = "http://code.jquery.com/jquery-3.0.0.min.js"></script>
	<script>

	     $(function(){
	     	$("span.insert#${ userMessage.id }").mouseover(function(){
	     		var insertDate = Date.parse("${ userMessage.insertDate }") / 1000;
	    			today = Math.ceil(new Date()/1000);
	    			relativeTime = today - insertDate ;
	    		var marginTop = 0;
		     	var marginLeft = 0;
		     	var speed = 300;
		     	var pop;
		     	pop = $("<p/>").addClass("popWindow").appendTo($("body"));
    			if(relativeTime < 5){
	    			var msg = "たった今";
	    		}
	    		if(5 <= relativeTime &&relativeTime < 60){
	    			var msg = "約" + relativeTime + "秒前";
	    		}
	    		if(60 <= relativeTime && relativeTime < 3600){
	    			var minits = Math.round(relativeTime / 60);
	    			var msg = "約" + minits + "分前";
	    		}
	    		if(3600 <= relativeTime && relativeTime < 86400){
	    			var hour = Math.round(relativeTime / 3600);
	    			var msg = "約" + hour + "時間前";
	    		}
	    		if(86400 <= relativeTime && relativeTime < 604800){
	    			var day = Math.round(relativeTime / 86400);
	    			var msg = "約" + day + "日前";
	    		}
	    		if(604800<= relativeTime && relativeTime < 2419200){
	    			var week = Math.round(relativeTime / 604800);
	    			var msg = "約" + week + "週前";
	    		}
	    		if(2419200 <= relativeTime && relativeTime < 29030400){
	    			var month = Math.round(relativeTime / 2419200);
	    			var msg = "約" + month + "月前";
	    		}
	    		if(29030400 <= relativeTime){
	    			var year = Math.round(relativeTime / 29030400);
	    			var msg = "約" + year + "年前";
	    		}
	    		pop.text(msg);
	     		var offsetTop = $(this).offset().top + marginTop;
	     		var offsetLeft = $(this).offset().left + marginLeft;
	     		pop.css({
	     		      "top": offsetTop,
	     		      "left": offsetLeft
	     		    }).show(speed);
	     	}).mouseout(function(){
	     		 $(".popWindow").text("").hide("fast");
	     	});
	     });
	</script>

	</c:forEach>
<br/>


</body>
</html>