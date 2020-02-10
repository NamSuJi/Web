<%@ include file="header.jsp" %>

<%
	String num = request.getParameter("num");
	int number = Integer.parseInt(num);
	UpViews upviews = new UpViews();
	
	String name;
	String subject;
	String password;
	String content;
	String regdate;
	int views = 0;
	
	String strSQL = "Select name,subject,content,regdate,views FROM test_nsz.tb_Board where num="+number+";";
		
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;	
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		if(rs.next()){
			name = rs.getString("name");
			subject = rs.getString("subject");
			content = rs.getString("content");
			regdate = rs.getString("regdate");
			views = rs.getInt("views");
%>
<form method="post" name="f">
<input type="hidden" name="inData" />
<table class="viewTable">
	<tr class="viewTr">
		<th class="viewTh1"><span><%=subject%></span></th>
		<th class="viewTh2"><%=name%></th>
		<th class="viewTh3"><%=regdate%></th>
		<th class="viewTh4"><%=++views%></th>
	</tr>
	<tr valign="top">
		<td colspan="4" class="viewContentTd"><%=content%></td>
	</tr>
	<tr class="viewTrButton">
		<td colspan="4">
			<input type="button" value="목록" class="goButton" onClick="goList()"/>
			<!-- 후에 session을 통해 얻은 ID가 글쓴이(name)와 일치할 시에 보여주도록 코드 수정 필요 -->
			<input type="button" value="수정" class="goButton" onClick="goEdit(<%=number%>)"/>
			<input type="button" value="삭제" class="goButton" onClick="goDelete(<%=number%>)"/>
		</td>
	</tr>
</table>
<%
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
	upviews.updateView(number,views);
%>
</form>
<%@ include file="footer.jsp" %>
