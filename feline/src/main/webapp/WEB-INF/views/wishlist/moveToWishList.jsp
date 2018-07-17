<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	var moveToBasket = confirm('동일 상품이 위시리스트에 존재합니다. \n위시리스트로 이동하시겠습니까?');
	if(moveToBasket == true) {
		location.href="/feline/wishlist/wishtList.cat";
	} else {
		location.href="javascript:history.back()";
	}
</script>