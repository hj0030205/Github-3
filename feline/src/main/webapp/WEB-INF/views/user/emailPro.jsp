<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
  td:nth-child(1){
  	text-align:center;
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복체크</title>
<script type="text/javascript">
	function nonexistent()
	{
		window.opener.location="joinForm.cat?member_email=${member_email}";
		self.close();
	}
	
	function existent()
	{
		window.close();
	}
</script>

</head>
<body>
<spring:hasBindErrors name="memberModel" />
<table width="300px" height="300px" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td>
		<c:choose>
			<c:when test="${checkNum=='1'}">
				${member_email}는 사용할 수 있는 이메일입니다.
				<br>
				<input type="button" value="확인" onclick="nonexistent()">
			</c:when>
			<c:when test="${checkNum=='0'}">
				${member_email}는 기존에 존재하는 이메일입니다.
				다시 입력해주세요.
				<br>
				<input type="button" value="확인" onclick="existent()">			
			</c:when>
			<c:otherwise>
				<font color="red"><form:errors path="memberModel.member_email" /></font>
				<br>
				<input type="button" value="확인" onclick="existent()">			
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
</body>
</html>