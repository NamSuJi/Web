function gologincheck(){
	if(f.id.value == ''){ alert("아이디를 입력해 주세요.");  return;}
	if(f.pwd.value == ''){ alert("비밀번호를 입력해 주세요.");  return;}
	
	f.target = '_self';
	f.action = 'logincheck.jsp';
	f.submit();
}
