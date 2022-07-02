<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제완료</title>
</head>
<body>
<c:choose>
 <c:when test="${sessionScope.seman eq 1}">
  <script type="text/javascript">
   alert("회원을 삭제했습니다.");
   location.href="./MemberSelect.me";
  </script>
 </c:when>
 <c:otherwise>
  <script type="text/javascript">
   alert("회원 탈퇴가 완료되었습니다.");
   location.href="./MemberSelectAll";
  </script>
 </c:otherwise>
</c:choose>
</body>
</html>