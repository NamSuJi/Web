<%@ include file="header.jsp" %>

<form method="post" name="f">
<input type="hidden" name="userID" />
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
				<textarea class="textArea" wrap="virtual" name="txtContent"></textarea>
			</td>
		</tr>
		<!--
		<tr>
			<td class="writeAttachment1">첨부파일</td>
			<td class="writeAttachment2">
				<input type="text" name="txtAttachment" />
			</td>
		</tr>
		-->
		<tr>
			<td colspan="2" class="writeButton">				
				<div align="right">
					<br />
					<input type="button" class="goButton" onclick="goList()" value="목록" />
					<input type="button" class="goButton" value="올리기" onclick="goWriteSave()" />
				</div>
			</td>
		</tr>
	</table>
</form>
<%@ include file="footer.jsp" %>
