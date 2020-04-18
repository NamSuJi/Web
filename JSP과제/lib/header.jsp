<%@ include file="DBConnection.jsp" %>
<%@ include file="Board.jsp" %>
<html>
<head>
<title>Code</title>
<meta charset = "UTF-8">
<link rel="stylesheet" href="lib/css/index.css">
<link rel="stylesheet" href="lib/css/board.css">
<script src="lib/js/local.js"></script>
<script src="lib/js/user.js"></script>
</head>
<body>
<%
		String userID = "guest";
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
%>
<form method="post" name="f">
<input type="hidden" name="num" />
<input type="hidden" name="userID" />
<input type="hidden" name="inData" />
<div class='divheader'>
	<div class='headerLeft'>
		<div class='sort1'>
			<table class='headerLeftTable'>
				<tr>
					<th class='leftTh'>
						<a href ='../one/list.jsp?inData=JSP' class='btncategory'>JSP</a>
					</th>
					<th class='leftTh'>
						<a href ='../one/list.jsp?inData=JAVA' class='btncategory'>JAVA</a>
					</th>
					<th class='leftTh'>
						<a href ='../one/list.jsp?inData=GITHUB' class='btncategory'>GITHUB</a> 
					</th>
				</tr>
			</table>
		</div>
	</div>
	<div class='headerCenter'>
		<div class='sort2'>
			<a href='index.jsp'>Code</a>
		</div>
	</div>
	<div class='headerRight'>
		<div class='sort3'>
			<% 
				if (userID == "guest" ) {
			%>	
				<input type='button' name='login' value='로그인' class='btnlogin' onclick="javascript:location.href='login.jsp'"/>
			<% }else{ %>
				<a class='loginID'><%=userID%> 님</a>
				<input type='button' name='login' value='로그아웃' class='btnlogin' onclick="javascript:location.href='logout.jsp'"/>
			<% } %>
		</div>
	</div>
</div>
