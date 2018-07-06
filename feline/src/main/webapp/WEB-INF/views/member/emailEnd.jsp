<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function windowclose(){
	
	opener.document.memberModify.member_email.value="${member_email}";
	self.close();
}
</script>
<c:choose>
<c:when test="${checkNumber eq 1}">
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr align="center">
	<td height="30">
		<font size="2">"${member_email}"는 이미 사용중인 이메일입니다.</font>
	</td>
	</tr>
</table>
<form action = "member_emailCheck.cat" method="post" name="checkForm">
<table width="360" border="0" cellspacing="0" cellpadding="5">
<tr>
	<td align="center">
		<font size="2">다른 이메일을 선택하세요</font>
		<input type="text" size="10" maxlength="12" name="member_email"/>
		<input type="submit" value="중복확인"/>
	</td>
</tr>
</table>
</form>
</c:when>
<%-- 만약 0이라면 중복이되지 않는 것이기 때문에 사용가능하다 --%>
<c:otherwise>
<table width="360" border="0" cellspacing="0" cellpadding="5">
<tr>
	<td align="center">
	<font size="2">입력하신"${member_email}" 는 사용할 수 있는 이메일입니다.</font>
	<br/><br/>
	<input type="button" value="닫기" onclick="windowclose()"/>
	</td>
</tr>
</table>
</c:otherwise>
</c:choose>
</body>
</html>