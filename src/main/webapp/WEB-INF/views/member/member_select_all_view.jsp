<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./css/styles.css">
<link href="./css/memberSelect.css" rel="stylesheet">
<link rel="stylesheet" href="./css/bootstrap.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.placeholder.label.min.js" type="text/javascript"></script>
<script src="./js/placeholder.js" type="text/javascript"></script>
<title>회원 정보</title>
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
 <div class="user-selectmember">
  <fieldset>
   <font class="member_profile">회원검색</font><br><br><hr>
   <table class="table table-hover">
    <tr>
     <td scope="col" class="text-center">아이디</td>
     <td scope="col" class="text-center">비밀번호</td>
     <td scope="col" class="text-center">이름</td>
     <td scope="col" class="text-center">닉네임</td>
     <td scope="col" class="text-center">이메일</td>
     <td scope="col" class="text-center">권한</td>
     <td scope="col" class="text-center">가입일</td>
     <td scope="col" class="text-center">관심분야</td>
     <td>&nbsp;</td>
    </tr>
    <tr>
     <td colspan="8"><hr></td>   
    </tr>
       
    <c:forEach var="memberlist" items="${memberlist}">
     <tr class="memberdetail" onclick="location.href='./MemberSelectDetail?id=${memberlist.id}'">
     <td scope="col" class="text-center">${memberlist.id}</td>
     <td scope="col" class="text-center">****</td>
     <td scope="col" class="text-center">${memberlist.name}</td>
     <td scope="col" class="text-center">${memberlist.nicname}</td>
     <td scope="col" class="text-center">${memberlist.email}</td>
     <td scope="col" class="text-center">${memberlist.managernum}</td>
     <td scope="col" class="text-center">${memberlist.memberday}</td>
     <td scope="col" class="text-center">${memberlist.membertech}</td>
    </tr>
    </c:forEach>
    
   </table>

  <br><br>
    <select name="memberselectDetail" class="search_memberDetail">
        <option value="아이디검색" selected="selected"> 아이디검색
        <option value="닉네임검색"> 닉네임검색
  </select>
   <input type="text" id="member" name="member" placeholder="member/varchar2(50BYTE)" class="search_input">
   <input type="submit" value="검색" class="search_submit">  
  </fieldset>
  </div>
 </form>
</div> 
   	<footer> <p class="footercla">Copyright KimInHo © 2022 SpringProject </p> </footer>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="./js/main.js"></script>
</body>
</html>