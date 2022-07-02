function postUpdate() {
	myform = document.join;
	
	if (!myform.postname.value) {
		alert("제목을 입력하세요!");
		myform.postname.focus();
		return false;
	}
	
	var regExptitle = /^.{0,20}$/;
	var titlecheck = myform.postname.value;
	if (!regExptitle.test(titlecheck)) {
		alert("20자 이내로 작성하세요");
		myform.postname.focus();
		return false;
	}
	
	
	str = myform.postcontent.value;
	str.replace(/<br\/>/ig, "\n");
	str = str.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
    str = str.replace(/&nbsp;/gi,"");

	if (str.length == 0) {
		alert("내용을 입력하세요!");
		myform.postcontent.focus();
		return false;
	}
	
	if (confirm("게시글을 수정 하시겠습니까?")) {
		myform.submit();
	}
}