function MemberIdLength(){
	myform = document.join;
	var regExpid = /^[a-z]+[a-z0-9]{5,19}$/g;
	var idcheck = myform.id.value;
	if (!regExpid.test(idcheck)) {
		alert("아이디는 영문으로 시작하는 6~20자 이내의 영문, 숫자를 입력하세요.");
		myform.id.focus();
		return false;
	}
}


function insertMember() {
	myform = document.join;
			
	if (!myform.id.value) {
		alert("아이디를 입력하세요");
		myform.id.focus();
		return false;
	}
		
	
	
	if (!myform.idCheck.value) {
		alert("아이디 중복검사를 해주세요!");
		myform.id.focus();
		return false;
	}
	
	if (!myform.passwd.value) {
		alert("비밀번호를 입력하세요");
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
		alert("비밀번호가 다릅니다. 다시 입력하세요!");
		myform.passwdre.focus();
		return false;
	}
	
	if (!myform.name.value) {
		alert("이름을 입력하세요");
		myform.name.focus();
		return false;
	}
	
	var regExpname = /^[ㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/g;
	var namecheck = myform.name.value;
	if (!regExpname.test(namecheck)) {
		alert("이름은 한글 2~20자를 입력하세요.");
		myform.name.focus();
		return false;
	}
	
	if (!myform.email.value) {
		alert("이메일을 입력하세요");
		myform.email.focus();
		return false;
	}
	
	var emailcheck = document.join.email.value;
	var atpos = emailcheck.indexOf("@");
	var dotpos = emailcheck.indexOf(".");
	if (atpos<2 || dotpos < atpos+2 || dotpos+2>=emailcheck.length) {
		alert("올바른 이메일 형식이 아닙니다.");
		return false;
	}
	
	if (!myform.nicname.value) {
		alert("닉네임을 입력하세요");
		myform.nicname.focus();
		return false;
	}
	
	var regExpnicname = /^[ㄱ-ㅎㅏ-ㅣ가-힣A-za-z0-9]{2,20}$/g;
	var nicnamecheck = myform.nicname.value;
	if (!regExpnicname.test(nicnamecheck)) {
		alert("닉네임은 2~20자를 입력하세요(특수문자 사용 x).");
		myform.nicname.focus();
		return false;
	}
	
	if (myform.managernum.value == 1) {
		alert("일반회원으로만 가입할 수 있습니다!");
		myform.managernum.focus();
		return false;
	}
	
	
	
	if (confirm("회원가입 하시겠습니까?")) {
		myform.submit();
	}
}