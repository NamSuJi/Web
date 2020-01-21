<%@ include file="header.jsp" %>
<%@ include file="DBConnection.jsp" %>
<%@ page import="java.sql.*" %>

<%
String num = request.getParameter("inData");
String subject;
String content;
String strSQL = "Select subject, content from test_nsz.tb_Board where num = "+num+";";

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
ResultSet rs = null;
if(conn!=null){	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(strSQL);
	
	if(rs.next()){
		subject = rs.getString("subject");
		content = rs.getString("content");
		content = content.replace("<br />","\r\n");
%>
<form method="post" name="f">
<input type="hidden" name="inData2" />
<table class="writeTable">
	<tr class="viewTr">
		<td class="writeSubject1">제목</td>
		<td class="writeSubject2"><input class="textArea" type="textarea" name="txtSubject" value="<%=subject%>"/></td>
	</tr>
	<tr>
		<td class="writeContent1">내용</td>
		<td class="writeContent2"><textarea class="textArea" name="txtContent"><%=content%></textarea></td>
	</tr>
	<tr class="viewTr1">
		<td colspan="2">
			<br />
			<input type="button" value="목록" class="goButton" onClick="goList()"/>
			<!-- 후에 session을 통해 얻은 ID가 글쓴이(name)와 일치할 시에 보여주도록 코드 수정 필요 -->
			<input type="button" value="업데이트" class="goButton" onClick="goEditSave(<%=Integer.parseInt(num)%>)"/>
		</td>
	</tr>
</table>
<%
	}
}
if(rs!=null) rs.close();
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
</form>
<%@ include file="footer.jsp" %>
