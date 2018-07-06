<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
					<!--비밀번호가 맞을 경우  -->
				<c:if test="${deleteCheck == 1 }">		
					<script type="text/javascript">
					alert("회원탈퇴가 정상적으로 처리완료 되었습니다. 감사합니다!");
					location.href='/feline/main.cat';
					</script>
				</c:if>
				<!--비밀번호가 틀렸을 경우  -->
				<c:if test="${deleteCheck == -1 }">
					<script type="text/javascript">
					alert("비밀번호가 틀렸습니다!");
					location.href='/feline/member/mypage.cat';
					</script>
				</c:if>
</body>
</html>					
					