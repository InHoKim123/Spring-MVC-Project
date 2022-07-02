function Deletepost() {
	myform = document.join;
	
	if (!myform.postnum.value) {
		alert("삭제할 게시글의 번호를 입력하세요!");
		myform.postnum.focus();
		return false;
	}
	
	var regExpnum = /\d/ ;
	var numcheck = myform.postnum.value;
	if (!regExpnum.test(numcheck)) {
		alert("번호를 입력하세요.");
		myform.postnum.focus();
		return false;
	}
	
	if (confirm("게시글을 삭제하시겠습니까?")) {
		myform.submit();
	}
}