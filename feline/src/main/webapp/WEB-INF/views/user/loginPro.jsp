<%-- 이부분의 설정이 필요합니다. --%>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
</head>
<script>
function windowclose(){
	opener.document.join.member_id.value="${member_id}";
	self.close();
}
</script>
<body bgcolor="#f5f5f5">
<!-- 만약 checkNumber가 0이면 중복된것이기 때문에 액션을 다시실행한다. -->
<c:choose>
<c:when test="checkNum==1">
	<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr align="center">
		<td height="30">
			<font size="2">${member_id}는 이미 사용중인 아이디입니다.</font>
		</td>
		</tr>
	</table>
	<form action="IdCheck.cat" method="post" name="checkForm">
		<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center">
				<font size="2">다른 아이디를 선택하세요</font>
				<input type="text" size="10" maxlength="12" name="member_id"/>
				<input type="submit" value="중복확인"/>
			</td>
		</tr>
		</table>
	</form>
</c:when>
<%-- 만약 1이라면 중복이되지 않는 것이기 때문에 사용가능하다 --%>
<c:otherwise>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		<font size="2">입력하신${member_id} 는 사용할 수 있는 아이디입니다.</font>
		<br/><br/>
		<input type="button" value="닫기" onclick="windowclose()"/>
		</td>
	</tr>
	</table>
</c:otherwise>
</c:choose>
</body>
</html>