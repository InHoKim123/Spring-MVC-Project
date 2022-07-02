function deleteMember() {
	myform = document.join;
	
	if (!myform.id.value) {
		alert("아이디를 입력하세요");
		myform.id.focus();
		return false;
	}
	
	if (!myform.passwd.value) {
		alert("비밀번호를 입력하세요");
		myform.passwd.focus();
		return false;
	}
	
	if (confirm("회원탈퇴를 하시겠습니까?")) {
		myform.submit();
	}
}