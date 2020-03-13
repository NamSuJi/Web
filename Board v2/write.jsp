<%@ include file="/header.jsp" %>


<form method="post" name="f">
<input type="hidden" name="inData2" />
<%
String num = request.getParameter("inData");

if(!num.equals("")){
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
				<input type="button" value="목록" class="goButton" onclick="goList()"/>
				<!-- 후에 session을 통해 얻은 ID가 글쓴이(name)와 일치할 시에 보여주도록 코드 수정 필요 -->
				<input type="button" value="업데이트" class="goButton" onclick="javascript:goSave(<%=Integer.parseInt(num)%>)"/>
			</td>
		</tr>
	</table>
	<%
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
else{
%>
	<table class="writeTable">
		<tr>
			<td class="writeSubject1">제목</td>
			<td class="writeSubject2">
				<input type="text" class="textArea" name="txtSubject" />
			</td>
		</tr>
		<tr>
			<td class="writeContent1">내용</td>
			<td class="writeContent2">
				<textarea class="textArea" name="txtContent"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="writeButton">				
				<div align="right">
					<br />
					<input type="button" class="goButton" onclick="goList()" value="목록" />
					<input type="button" class="goButton" value="올리기" onclick="javascript:goSave()" />
				</div>
			</td>
		</tr>
	</table>
<%
}
%>
</form>
<%@ include file="/footer.jsp" %>
