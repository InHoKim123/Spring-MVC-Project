function insertPost() {
	myform = document.join;	
	if (!myform.postname.value) {
		alert("제목을 입력하세요!");
		myform.postname.focus();
		return false;
	}
	//console.log(myform.postcontent.value.length);
	var regExptitle = /^.{0,20}$/;
	var titlecheck = myform.postname.value;
	if (!regExptitle.test(titlecheck)) {
		alert("20자 이내로 작성하세요");
		myform.postname.focus();
		return false;
	}
		
	
	//작성한 글 태그 자르기
	str = myform.postcontent.value;
	str.replace(/<br\/>/ig, "\n");
	str = str.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
    str = str.replace(/&nbsp;/gi,"");

	if (str.length == 0) {
		alert("내용을 입력하세요!");
		myform.postcontent.focus();
		return false;
	}
	
	var regExpcon = /^.{0,2000}$/;
	var contentcheck = myform.postcontent.value;
	if (!regExpcon.test(contentcheck)) {
		alert("2000자 이내로 작성하세요");
		myform.postcontent.focus();
		return false;
	}
	
	if (confirm("게시글을 작성 하시겠습니까?")) {
		myform.submit();
	}
}