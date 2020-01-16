<%@ include file="header.jsp" %>
<%@ include file="DBConnection.jsp" %>
<%@ include file="Paging.jsp" %>
<%
	Paging paging = new Paging();
	int currentPage = 1; //현재 페이지 번호
	String currentPage_temp = request.getParameter("currentPage");
	int totalCount = paging.getTotal();;//전체 게시물 수
	int countList = 10;//한 페이지에 보여줄 게시물 수
	int countPage = 5; // 한 페이지에 보이는 페이징 블럭 범위
	int totalPage = totalCount/countList;//나타나는 총 페이지 수
	int startPage = 0;
	int endPage = 0;
	int startRow = 0;
	
	//현재 페이지 번호가 바뀌면 currentPage에 적용시켜줌
	if(currentPage_temp!= null){
		currentPage = Integer.parseInt(currentPage_temp);
	}
	
	if((totalCount%countList) > 0){
		totalPage++;
	}
	
	if(totalPage<currentPage){
		currentPage = totalPage;
	}
	
	startPage = (countPage*((currentPage-1)/countPage))+1;
	endPage = startPage + countPage - 1;
	startRow = (currentPage -1)*countList;
	
	if(endPage>totalPage){
		endPage = totalPage;
	}
%>
<!-- 쓰기는 로그인 되어 있을 시에 보여주도록 수정 필요 -->
<form name='f'>
<input type="button" value="쓰기" class="button1" onClick="goWrite()"/>
<table class="ListTable">
	<tr>
		<th class="ListTh1">제목</th>
		<th class="ListTh2">이름</th>
		<th class="ListTh2">날짜</th>
		<th class="ListTh2">조회</th>
	</tr>
<%
	
	String strSQL = "Select num,name,subject,regdate,views FROM test_nsz.tb_Board LIMIT "+startRow+","+countList+";";
	
	//DB 접속하는 클래스를 따로 만들어줌
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){
		stmt = conn.createStatement();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		while(rs.next()){
			int num = rs.getInt("num");
			String name = rs.getString("name");
			String subject = rs.getString("subject");
			String regdate = rs.getString("regdate");
			int views = rs.getInt("views");
%>
		<tr>
			<td class="ListTd1">
				<a href="view.jsp?num=<%=num%>" class="ListA"><%=subject%></a>
			</td>
			<td class="ListTd2"><%=name%></td>
			<td class="ListTd2"><%=regdate%></td>
			<td class="ListTd2"><%=views%></td>
		</tr>
<%		
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
%>
	
<%
	
%>
</table>

<table class="ListTable">
	<tr>
		<td class="ListPagingTd">
		<%
			if(currentPage>countPage){
		%>
		<a href="list.jsp?currentPage=1">◁◁</a>
		<a href="list.jsp?currentPage=<%=startPage-1%>">◀</a>
		<%
			}
		%>
		<%
			for(int i=startPage;i<=endPage;i++){
				if(currentPage==i){
		%>
				<a class="PagingButton"><%=i%></a>
		<%
				}
				else{
		%>
				<a class="ListPagingButton" href="list.jsp?currentPage=<%=i%>"><%=i%></a>
		<%
				}
			}
		%>
		
		<%
			if(endPage<totalPage){
		%>
			<a href="list.jsp?currentPage=<%=endPage+1%>"> ▶ </a>
			<a href="list.jsp?currentPage=<%=totalPage%>"> ▷▷ </a>
		<%
			}
		%>
		</td>
	</tr>
</table>
</form>
<%@ include file="footer.jsp" %>
