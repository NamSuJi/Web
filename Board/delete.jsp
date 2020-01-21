<%@ page import="java.sql.*" %>
<%@ include file="DBConnection.jsp" %>
<%
String num = request.getParameter("inData");
String strSQL = "Delete from test_nsz.tb_Board where num = "+num+";";

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		response.sendRedirect("list.jsp");
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
