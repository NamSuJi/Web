function goView(num){
	f.num.value = num;
	f.target = '_self';
	f.action = 'view.jsp';
	f.submit();
}
function goWrite1(num){
	if(num==null) num=="";
	else f.inData.value = num;
	f.target = "_self";
	f.action = "write1.jsp";
	f.submit();
}
function goSave(num){
	if(num==null){
		f.inData2.value = "";
		if(f.txtSubject.value == ''&&f.txtContent.value == ''){
			alert('제목, 내용 입력 안함');
			return;
		}
	}else{
		f.inData2.value = num;
	}
	f.target = "_self";
	f.action = "save.jsp";
	f.submit();
}
function goList(){
	f.target = '_self';
	f.action = 'list.jsp';
	f.submit();
}
function goDelete(num){
	//f.userID.value = name;
	if(!confirm('삭제 하시겠습니까?')){
		return;
	}
	f.inData.value = num;
	f.target = "_self";
	f.action = "delete.jsp";
	f.submit();
}
