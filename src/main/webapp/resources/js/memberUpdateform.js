//function updateMember() {
//	if(confirm("회원 정보를 수정하시겠습니까?")){
//		location.href="./MemberUpdate"
//	}else{
//		
//	}
//	
//}

//function deleteMemberAlert() {
//	if(confirm("해당 회원을 삭제 하시겠습니까?")){
//		location.href="./MemberDelete";
//	}else{
//		
//	}
//}

function updateMemberDone() {
	
	myform = document.join;
	
	if (!myform.id.value) {
		alert("수정할 아이디를 입력하세요!");
		myform.id.focus();
		return false;
	}
	
	if (!myform.passwd.value) {
		alert("수정할 비밀번호를 입력하세요!");
		myform.passwd.focus();
		return false;
	}
	
	 var regExppasswd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	 var passwdcheck = myform.passwd.value;
	 if (!regExppasswd.test(passwdcheck)) {
		alert("비밀번호는 8~16자 영문, 숫자, 특수문자를 조합하여 작성하세요");
		myform.passwd.focus();
		return false;
	}
	
	
	if (myform.passwd.value != myform.passwdre.value) {
		alert("비밀번호가 일치하지 않습니다!");
		myform.passwdre.focus();
		return false;
	}
	
	if (!myform.name.value) {
		alert("수정할 이름을 입력하세요!");
		myform.name.focus();
		return false;
	}
	
	if (!myform.nicname.value) {
		alert("수정할 닉네임을 입력하세요!");
		myform.nicname.focus();
		return false;
	}
	
	var emailcheck = document.join.email.value;
	var atpos = emailcheck.indexOf("@");
	var dotpos = emailcheck.indexOf(".");
	if (atpos<2 || dotpos < atpos+2 || dotpos+2>=emailcheck.length) {
		alert("올바른 이메일 형식이 아닙니다.");
		return false;
	}
	
	if (confirm("수정한 회원의 정보를 저장 하시겠습니까?")) {
		myform.submit();
	}
}