<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />

<link rel="stylesheet" href="./css/styles.css">
<link href="./css/postInsert.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="./css/site.css" rel="stylesheet">
<link href="./js/richtext.min.css" rel="stylesheet">

<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/postInsertform.js"></script>

<script src="./js/jquery.richtext.js" type="text/javascript"></script>

<style>
  .text-area{
   width: 80%;
   margin-top: 8%;
  }
</style>

<title>게시글 작성</title>
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
	<div>
	<hr>
	</div>
 <form name="join" action="./PostInsert" method="post">
 <span><font class="write_post">글 작성</font></span>
 <div class="post-insert">

     <div class="text-area">
       <div>
       <input type="hidden" id="postwriter" name="postwriter" value="${sessionScope.senic}">
       <input type="hidden" id="postpasswd" name="postpasswd" value="">
	   </div>
	   
      
	  <div>
       <select name="postkind" style=" width: 100%; height: 30px; font-size: 16pt;">
        <option value="자유게시판" selected="selected"> 자유게시판
        <c:if test="${sessionScope.seman eq 1}">
        <option value="공지사항"> 공지사항
        </c:if>
        <option value="질문게시판"> 질문게시판 
       </select>
      </div> 
	  <br> 
	  <div class="form-floating mb-3">
       <input type="text" class="form-control" id="floatingInput" placeholder="제목" name="postname">
      </div>
       
	    <div class="page-wrapper box-content">
			<div name="postcontent" class="content"></div> 
        </div>

       <br>
       <div>
       <input type="date" id="postwriteday" name="postwriteday" readonly="readonly">
  	   </div>
  
  <br><br>
   <input type="hidden" name="views" value="0">
   <div>
   <button type="button" class="post-info-insert" onclick="insertPost()">게시글 작성</button>
    </div>
   </div>   
  </div>
 </form>
 <!--  
 <c:if test="${empty sessionScope.seid}">
  <script type="text/javascript">
   alert("로그인 후 이용가능합니다.");
   location.href="./Login";
  </script>
 </c:if>
 -->
  <script>
        $(document).ready(function() {
            $('.content').richText();
        });
  </script>
 
</div>
 
 <script type="text/javascript">
  document.getElementById("postwriteday").valueAsDate = new Date();
 </script>
    <footer> <p class="footercla">Copyright KimInHo © 2022 SpringProject </p> </footer>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="./js/main.js"></script>
</body>
</html>