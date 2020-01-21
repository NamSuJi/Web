<%@ include file="DBConnection.jsp" %>
<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("inData2");
String subject = request.getParameter("txtSubject");
String content = request.getParameter("txtContent");
content = content.replace("\r\n","<br />");
String goView = "view.jsp?num="+num;

String strSQL = "Update test_nsz.tb_Board SET subject='"+subject+"', content='"+content+"' where num = "+num+";";

DBConnection db = new DBConnection();
Connection conn = db.getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		response.sendRedirect(goView);
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
