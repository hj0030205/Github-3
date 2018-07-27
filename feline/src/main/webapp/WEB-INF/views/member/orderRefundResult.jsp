<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
alert("주문환불이 정상적으로 접수 되었습니다. 빠른시일내에 관리자가 확인하겠습니다. 감사합니다!");
if(${sessionScope.id != null}) {
	location.href='/feline/member/mypage.cat';
} else {
	location.href='b_orderList.cat?order_trade_num=${order_trade_num}';
}
</script> 

</body>
</html>