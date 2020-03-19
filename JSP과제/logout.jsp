<%
	//세션에 저장된 userID 제거
	session.removeAttribute("userID");
	
	//현재 세션을 서버에서 제거
	session.invalidate();
	response.sendRedirect("index.jsp");
%>
