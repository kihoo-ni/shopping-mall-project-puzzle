// 회원가입 화면의 입력값들을 검사한다.      
function checkValue() {
	var form = document.frm;
	
	
	var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		/*	^ [a - zA - Z0 -9._ % +-] +: 이메일 주소는 영문 대소문자, 숫자, 그리고 일부 특수문자(._ % +-)로 시작.
		@: 이어서는 '@' 기호가 와야 합니다.
		[a - zA - Z0 - 9. -] +: '@' 이후에는 다시 영문 대소문자, 숫자, 그리고 일부 특수문자(.-)가 포함될 수 있습니다.
		\.: 최소한 하나의 점('.')이 포함되어야 합니다.
		[a - zA - Z]{ 2,} $: 마지막으로, 이메일 주소는 최소 두 글자의 영문 대소문자로 끝나야 합니다.*/

	
	if (!form.name.value) {
		alert("이름을 입력하세요.");
		return false;
	}

	if (!form.birthday.value) {
		alert("생년월일을 입력하세요.");
		return false;
	}

	if (isNaN(form.birthday.value)) {
		alert("생년월일은 숫자만 입력가능합니다.");
		return false;
	}
	
	if(!form.email.value) {
		alert("이메일 주소를 입력하세요.");
		return false;
	}

	if (!emailRegex.test(form.email.value)) {
		 alert("이메일 주소를 정확히 입력해주세요.");
            return false;
	}

	if (form.emailAuthenticationKey.value === "0") {
		alert("이메일 본인인증을 해주세요.");
		return false;
	}
	


}

// 취소 버튼 클릭시 첫화면으로 이동       
function goFirstForm() {
	location.href = "welcome.jsp";
}

    

// 이메일 본인인증 화면open      
function authEmailChk(form) {
		 openEmailAuthWindow(form.email.value);
}

// 이메일 창 오픈
function openEmailAuthWindow(email){
	
	var url = "sendmailServlet.do?email=" + email;
	window.open(url, "_blank",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

//이메일 본인인증 성공시 나가기용 
function emailauthOk() {
	opener.document.frm.emailAuthenticationKey.value = document.emailauthForm.userAuthenticationKey.value;
	self.close();
}   




