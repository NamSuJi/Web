<%@ page import="java.sql.*" %>
<%@ include file="lib/DBConnection.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");
String category = request.getParameter("inData");
String listURL = "";
String strSQL = "Delete from test_nsz.tb_Board where num = "+num+";";

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		listURL = "list.jsp?inData="+category;
		response.sendRedirect(listURL);
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
