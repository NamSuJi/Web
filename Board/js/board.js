function goView(num){
	f.num.value = num;
	f.target = '_self';
	f.action = 'view.jsp';
	f.submit();
}
function goWrite(){
	f.target = '_self';
	f.action = 'write.jsp';
	f.submit();
}
function goWriteSave(/*userID*/){
	//f.userID.value = name;
	if(f.txtSubject.value == ''&&f.txtContent.value == ''){
		alert('제목, 내용 입력 안함');
		return;
	}
	f.target = "_self";
	f.action = "writeSave.jsp";
	f.submit();
}
function goList(){
	f.target = '_self';
	f.action = 'list.jsp';
	f.submit();
}
function goEdit(num){
	//f.userID.value = name;
	f.inData.value = num;
	f.target = "_self";
	f.action = "edit.jsp";
	f.submit();
}
function goEditSave(num){
	//f.userID.value = name;
	f.inData2.value = num;
	f.target = "_self";
	f.action = "editSave.jsp";
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
