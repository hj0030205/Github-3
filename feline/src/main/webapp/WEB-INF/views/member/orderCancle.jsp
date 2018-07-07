<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

	function cancleCheck(){
		if(confirm("정말 취소하시겠습니까?") == true){
			document.orderCancle.submit();
		}else{
			return false;
		}
	}
	
</script>
<title>주문취소폼</title>
</head>
<body>
	<div class="all">
		<div class="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>마이 페이지</li>
					</ul>
				</div>
				<!-- 홈으로가는 링크 생성 -->
				<div class="col-md-3">
					<!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">마이 페이지</h3>
						</div>

						<div class="panel-body">

							<ul class="nav nav-pills nav-stacked">
								<li><a href="mypage.cat"> 마이 페이지</a></li>
								<li class="active"><a href="orderList.cat"><i
										class="fa fa-list"></i>나의 주문 내역</a></li>
								<li><a href="/feline/basket/basketList.cat"><i
										class="fa fa-heart"></i>장바구니</a></li>
								<li><a href="memberModify.cat"><i
										class="fa fa-address-card"></i>회원정보수정</a></li>
								<li><a href="memberDelete.cat"><i
										class="fa fa-sign-out"></i>회원탈퇴</a></li>

							</ul>
						</div>

					</div>
					<!-- /.col-md-3 -->

					<!-- *** CUSTOMER MENU END *** -->
				</div>

				<!-- -------------------------------사이드바----------------------------------------- -->
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h3>
							취소신청 <small>회원전용</small>
						</h3>
						<legend>
							<h2>취소사유</h2>
						</legend>
						<form name="orderCancle" action="orderCancle.cat" method="post">
							<center>
							<select name="reason">
								<optgroup label="취소사유선택">
								
								<option value="단순 변심">단순변심</option>
								<option value="제품 불량">제품불량</option>
								<option value="다른 이유">다른 이유</option>
								
								</optgroup>
								
							</select>
							</center>
							<p></p>


							<br />
							<br />
								<center>
								<button class="btn btn-danger" type="button" onclick="cancleCheck();">주문취소하기</button>
								<br />
								<br />
								<button class="btn btn-primary" type="button" 
									onclick="javascript:location.href='mypage.cat'">돌아가기</button>
								</center>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>