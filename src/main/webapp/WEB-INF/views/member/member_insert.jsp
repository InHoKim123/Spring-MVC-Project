<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="./css/styles.css">
<link href="./css/memberInsert.css" rel="stylesheet">

<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.placeholder.label.min.js" type="text/javascript"></script>
<script src="./js/placeholder.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/memberInsertform.js"></script>
<title>회원 정보입력</title>
<script type="text/javascript">
$(function() {
 $("#overlapcheck").click(function() {
	MemberIdLength();
   	var id = $("#id").val();
   	$.ajax({
   		url : "./CheckedId",
   		type : "POST",
   		data : {
   			"id" : id
   			},
   		success : function(idCheck) {
			if (idCheck == 1) {
				alert("사용할 수 없는 아이디 입니다.");
				$("#id").focus();
			}else {	
				if (confirm("사용할 수 있는 아이디 입니다. 사용하시겠습니까?")) {
					$("#idCheck").val("1");
					$("#id").css("background", "#C9C9C9");
					$("#id").attr("readonly", true);
					$("#passwd").focus();
				}else {
					$("#id").focus();
				}
					
			}
				
		}
	});
   	
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
 <form name="join" action="./MemberInsert" method="post" enctype="multipart/form-data">
  <div class="user-insert">
  <fieldset>
  <div><p><font> 회원가입 </font></p></div>
  <div class="insertMain">
  <p class="insert_user_email">회원가입</p><hr>
    <span>

    <label class="profileupdate" for="fileName">프로필 설정</label>
	<input type="file" class="profileupdate" id="fileName" name="fileName" style="display: none">
	<br><br>
    <input type="text" id="id" name="id" maxlength="15" placeholder="아이디 id/varchar2(30BYTE)" class="inputid">
    <button type="button" id="overlapcheck" name="overlapcheck" class="idbtn" onclick="">중복확인</button><br>
   
    <input type="hidden" name="idCheck" id="idCheck">
    </span>
    <input type="password" id="passwd" name="passwd" maxlength="20" placeholder=" 비밀번호 passwd/varchar2(30BYTE)" class="inputpd"><br>
    <input type="password" id="passwdre" name="passwdre" maxlength="20" placeholder=" 비밀번호 확인 passwd/varchar2(30BYTE)" class="inputpd"><br>
    <input type="text" id="name" name="name" maxlength="15" placeholder=" 이름 name/varchar2(20BYTE)" class="inputname"><br>
    <input type="email" id="email" name="email" maxlength="40" placeholder=" 이메일 email/varchar2(50BYTE)" class="inputemail"><br>
    <input type="text" id="nicname" name="nicname" maxlength="30" placeholder=" 닉네임 nicname/varchar2(30BYTE)" class="inputnic"><br> 
    <select name="managernum" class="mannum">
     <option value="0" selected="selected">일반 회원</option>
     <option value="1">관리자</option>
    </select>   <br>
    <input type="date" id="memberday" name="memberday" readonly="readonly" class="inputdate"><br>
    <select name="membertech" class="memtech">
     <optgroup label="프로그래밍 언어">
      <option value="C"> C </option>
      <option value="Java" selected="selected"> Java </option>
      <option value="JavaScritpt"> JavaScritpt </option>
      <option value="HTML"> HTML </option>
      <option value="C++"> C++ </option>
      <option value="C#"> C# </option>
      <option value="Python"> Python </option>
      <option value="Ruby"> Ruby </option>
      <option value="PHP"> PHP </option>
     </optgroup>
    </select><br>

      
   <br><br>
   <label class="doemail"><input type="checkbox" name="doemail">이메일 수신 동의 </label><br>
   <br>
   <input type="button" value="가입완료" class="inputsuc" onclick="insertMember()">
    <!-- <input type="submit" value="가입완료" class="inputsuc">-->


   </div>
  </fieldset>
  </div>
 </form>
</div> 
 <script type="text/javascript">
  document.getElementById("memberday").valueAsDate = new Date();
 </script>
  	<footer> <p class="footercla">Copyright KimInHo © 2022 SpringProject </p> </footer>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="./js/main.js"></script>

  
   
</body>
</html>