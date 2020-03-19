<%@ include file="DBConnection.jsp" %>
<html>
<head>
<title>Code</title>
<meta charset = "UTF-8">
<link rel="stylesheet" href="lib/css/index.css">
<script src="lib/js/local.js"></script>
<script src="lib/js/other.js"></script>
</head>
<body>
<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
%>
<div class=''>
	<div class='divheader'>
		<div class='headerLeft'>
			<div class='sort1'>
				<table class='headerLeftTable'>
					<tr>
						<th class='leftTh'>
							<input class='btncategory' type='button' name='jsp' value='JSP' /> 
						</th>
						<th class='leftTh'> 
							<input class='btncategory' type='button' name='java' value='JAVA' /> 
						</th>
						<th class='leftTh'> 
							<input class='btncategory' type='button' name='github' value='GITHUB' /> 
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
					if (userID == null ) {
				%>	
					<input type='button' name='login' value='로그인' class='btnlogin' onclick="javascript:location.href='login.jsp'"/>
				<% }else{ %>
					<a><%=userID%> 님</a>
					<input type='button' name='login' value='로그아웃' class='btnlogin' onclick="javascript:location.href='logout.jsp'"/>
				<% } %>
			</div>
		</div>
	</div>
