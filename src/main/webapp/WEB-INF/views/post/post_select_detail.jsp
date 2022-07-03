<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/styles.css">
<link href="./css/postView.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<title>게시판</title>
<script type="text/javascript">
$(document).ready(function(){
	var pnum = $('input[name=pnum]').val();
	
	$.ajax({
		url : "./Reply",
   		type : "GET",
   		data : {
   			"pnum" : pnum
   			},
   		success: function(result){
   			console.log(pnum);
   			console.log(result);
   			var comments = "";
   			//작성된 댓글이없다면..
   			if (result.length < 1) {
				comments += "작성된 댓글이 없습니다.";
				$("#replylist").html(comments);
			}else {
				for (var i = 0; i < result.length; i++) {
	   				comments += "<span id='comwriter'>";
	   				comments += "<span> <font> 작성자 : </font></span>";
	   				comments += "<span><font>" + result[i].replywriter + "</font></span>";
					comments += "<span><font>" + " | " + "</font></span>";
					comments += "<span><font>" + result[i].replyday + "</font></span>"
	   				comments += "</span>";
	   				comments += "</div>";
	   				comments += "<div id='mycom'>";
	   				comments += "<font>" + result[i].replycontent + "</font>";
	   				comments += "</div>";
	   				comments += "<hr>";
					$("#replylist").html(comments);

				}
			}
   			
   			   			
   		}
	});
});



</script>
</head>
<body id="body-pd">
<div id="wrap">
<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
			    
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="./PostSelectAll" class="nav__logo">OKKY</a>
				</div>
				<div class="nav__list">
					<a href="./PostSelectAll" class="nav__link active">
					 <ion-icon name="home-outline" class="nav__icon"></ion-icon>
					 <span class="nav_name">홈</span>
					</a> 


    					<c:if test="${sessionScope.seman eq 1}">  
       						<a href="./MemberSelectAll" class="nav__link">
					 		 <ion-icon name="people-outline" class="nav__icon"></ion-icon>
					 		 <span class="nav_name">회원검색</span>
							</a> 
						</c:if>
				
					<c:choose>  
    					<c:when test="${!empty sessionScope.id}">  
       						<a href="./PostSelectAll" class="nav__link">
					 		 <ion-icon name="reader-outline" class="nav__icon"></ion-icon> 
					 		 <span class="nav_name">게시판</span>
							</a> 
    					</c:when>  
    				 <c:otherwise>  
         					 <a href="./Login" class="nav__link">
							  <ion-icon name="reader-outline" class="nav__icon"></ion-icon> 
							  <span class="nav_name">게시판</span>
							 </a> 
    				 </c:otherwise>  
					</c:choose>  
					<form action="./MemberSelectDetail" method="get">
					<c:if test="${!empty sessionScope.id}">
						<a href="./MemberSelectDetail?id=${sessionScope.id }" class="nav__link">					 
						 <ion-icon name="person-outline" class="nav__icon"></ion-icon>
						 <span class="nav_name"> 내정보</span>
						</a>
					</c:if>
					</form>
					<c:choose>  
    					<c:when test="${!empty sessionScope.id}">  
       						<a href="./LogOut" class="nav__link">
							 <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
				 			 <span class="nav_name">로그아웃</span>
							</a>
    					</c:when>  
    				 <c:otherwise>  
         					 <a href="./Login" class="nav__link">
							  <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
							  <span class="nav_name">로그인</span>
							 </a> 
    				 </c:otherwise>  
					</c:choose>  
					
						
				</div>
				
			</div>
		</nav>
	</div>

 <form action="#" method="get" enctype="application/x-www-form-urlencoded">
  <div class="read-post">
	<fieldset>
	<div class="con">
		<div>
		 <span id="writer">
		 	<span> <img class="profilepic" alt="프로필사진" src="./img/${postSelectDetail.attachedfile }"> </span>
			<span> <font> 작성자 : </font></span>
			<span> <font> ${postSelectDetail.postwriter}</font></span>
			<span> <font> | </font></span>
			<span> <font> ${postSelectDetail.postwriteday} </font></span>
			<span> <font> | </font></span>
			<span> <font> 조회: </font></span>
			<span> <font> ${postSelectDetail.views } </font></span>
			<c:choose>
				<c:when test="${sessionScope.seman eq 1}">
					<span><button type="button" onclick="location.href='./PostUpdate?postnum=${postSelectDetail.postnum}'" id="retouch">글 수정</button></span>
					<span><button type="button" onclick="location.href='./PostDelete?postnum=${postSelectDetail.postnum}'" id="deletepost">글 삭제</button></span>
				</c:when>
				<c:when test="${sessionScope.senic eq postSelectDetail.postwriter}">
					<span><button type="button" onclick="location.href='./PostUpdate?postnum=${postSelectDetail.postnum}'" id="retouch">글 수정</button></span>
					<span><button type="button" onclick="location.href='./PostDelete?postnum=${postSelectDetail.postnum}'" id="deletepost">글 삭제</button></span>
				</c:when>
			</c:choose>

		 </span>
		</div>
		<div>
		<br><br>
		<span class="title">		
			<span> <font> ${postSelectDetail.postname } </font> </span>				
		</span>		
		<span class="postnumtxt">#${postSelectDetail.postnum} ${postSelectDetail.postkind}</span>	
		</div>		
		<br><hr><br>
		<div id="contents">
			${postSelectDetail.postcontent}
		</div>
		<br>
	  </div>
	 </fieldset>
	</div>
	
 </form>
 <!-- 댓글 : 나중에 만들거임-->
 
  <div class="write-comment">
	<fieldset>
	
	<div class="con">
	<form action="./ReplyInsert" method="post">
		<div id="comment">
		 <font> 답글 </font>
		</div>		
		<div>
		<input type="hidden" name="replywriter" id="replywriter" value="${sessionScope.senic }">
		<input type="hidden" name="pnum" id="pnum" value="${postSelectDetail.postnum}">
		<input type="hidden" id="replyday" name="replyday">
		 <span> <textarea rows="5" cols="100" id="replycontent" name="replycontent"></textarea> </span> 
		</div>
		<div>
		 <span> <input type="submit" value="댓글작성" class="comsub"></span>
		 <span> <button type="button" onclick="location.href='./PostSelectAll'" class="list">글 목록</button> </span>	 
		</div>
		<hr>
	</form>
		<div id="replylist"></div>
	</div>
	
	</fieldset>
	</div>
	
		
      
   	</div>	

	<footer> <p class="footercla">Copyright KimInHo © 2022 SpringProject </p> </footer>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="./js/main.js"></script>

</body>
</html>