<%@ include file="DBConnection.jsp" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String strSQL = "";

/* 날짜 형식을 YY-mm-dd로 받기 위해 선언 및 사용 */
LocalDateTime current = LocalDateTime.now();
DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE;
String regdate = current.format(formatter);

String name = "테스트1";
String num = request.getParameter("inData2");
String subject = request.getParameter("txtSubject");
String content = request.getParameter("txtContent");
content = content.replace("\r\n","<br />");
int views = 0;
String goView="";

if(num == ""){
	strSQL = "insert into test_nsz.tb_Board(name,subject,content,regdate,views) values('";
	strSQL += name+"','"+subject+"','"+content+"','"+regdate+"',"+views+");";
}
else{
	goView = "view.jsp?num="+num;
	strSQL = "Update test_nsz.tb_Board SET subject='"+subject+"', content='"+content+"' where num = "+num+";";
}

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		if(num == "") response.sendRedirect("list.jsp");
		else response.sendRedirect(goView);
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();

%>
