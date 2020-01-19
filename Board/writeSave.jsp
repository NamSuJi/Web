<%@ include file="DBConnection.jsp" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	/* 후에 name은 session으로 로그인 되어있을 시에 ID 받아서 올거임 */
	String name = "테스트1";
	String subject = request.getParameter("txtSubject");
	String content = request.getParameter("txtContent");
	content = content.replace("\r\n","<br />");/*한줄띄우기를 <br />로 바꾸어 DB 저장*/
	String regdate;
	int views = 0;
	
	/* 날짜 형식을 YY-mm-dd로 받기 위해 선언 및 사용 */
	LocalDateTime current = LocalDateTime.now();
	DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE;
	regdate = current.format(formatter);
	
	/* 쿼리문 */
	String strSQL = "insert into test_nsz.tb_Board(name,subject,content,regdate,views) values('";
	strSQL += name+"','"+subject+"','"+content+"','"+regdate+"',"+views+");";
	
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	if(conn!=null){
		stmt = conn.createStatement();
		if(stmt.executeUpdate(strSQL)>0){
			/* 정상적으로 insert되면 list.jsp로 이동 */
			response.sendRedirect("list.jsp");
		}
		else{
			out.print("fail");
		}
	}
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
%>
