<html>
<head>
<title>Code</title>
<meta charset = "UTF-8">
<link rel="stylesheet" href="lib/css/other.css">
<script src="lib/js/other.js"></script>
</head>
<body>
<form method="post" name='f'>
	<div class='wrap'>
		<div class='wrapbox'>
			<div class='boxtop'>
				<a href='index.jsp'>Code</a>
			</div>
			<div class='login'>
				<div class='loginbox'>
					<input type='text' name='id' class='logininput' placeholder='ID' />
				</div>
				<div class='loginbox'>
					<input type='text' name='pwd' class='logininput' placeholder='PASSWORD' />
				</div>
				<div class='loginbox'>
					<input type='button' class='loginbutton' value='로그인' onclick='gologincheck();' />
				</div>
				<div class='loginbox'>
					<div class='joinbox'>
					<input type='button' class='joininput' value='회원가입' onclick="javascript:location.href='join.jsp'" />
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
