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
								<li><a href="mypage.cat">마이 페이지</a></li>
								<li><a href="orderList.cat">
								<i class="fa fa-list"></i>나의 주문 내역</a></li>
								<li class="active"><a href="orderCancleList.cat">
								<i class="fa fa-times"></i>주문 취소 내역</a></li>	
								<li><a href="orderRefundList.cat">
								<i class="fa fa-toggle-on"></i>주문 환불 내역</a></li>	
								<li><a href="orderChangeList.cat">
								<i class="fa fa-reply-all"></i>주문 교환 내역</a></li>															
								<li><a href="/feline/basket/basketList.cat"><i
										class="fa fa-shopping-cart"></i>장바구니</a></li>
								<li><a href="/feline/wishlist/wishList.cat"><i class="fa fa-heart"></i>WISHLIST</a></li>
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
						
						<p>
						
						<h4>주문취소</h4>
						<ul>
							<li>1. 주문 취소는 주문하신 상품에 대한 진행단계가 '입금확인 중'일 때만 가능</li> &nbsp;▶입금확인
							중이란? 고객님이 주문을 완료하였으나 Feline에서 아직 입금승인을 하지 않은 상태로 배송 출발 직전까지의 단계입니다.
							<li>2. 주문 취소 방법</li> &nbsp;가. 당사 쇼핑몰 화면 상단의 '주문/배송 조회'를 누르시면
							주문상품의 진행단계를 확인하실 수 있습니다.
							<br> &nbsp;나. 진행단계가 '입금확인 중'으로 되어있는 상품을 누르시면 밑에 '주문취소' 버튼이
							나타납니다.
							<br> &nbsp;&nbsp;(버튼 확인이 안될 경우 고객센터 Tel.1544-2884로 연락주시면
							안내해드리겠습니다.)
							<br>
							<li>3. 즉시 주문취소를 할 수 없는 경우</li> &nbsp;가. 주문이 승인되고 배송 단계로 넘어간
							후(배송준비 중, 배송진행 중, 배송완료일 경우)에는 즉시 주문취소를 하실 수 없습니다.
							<br> &nbsp;이 경우에는 고객센터 Tel.1544-2884로 문의주시고 안내받으시기 바랍니다.
							<br>
						</ul>
						<br></br><br></br>
						
						<form name="orderCancle" action="orderCancle.cat" method="post">
						
						<input type="hidden" name="order_num" value="${order_num }"/>
						
			
							<center>
								<select name="cancle_reason" >
									<optgroup label="취소사유선택">
									<option value="단순변심">단순변심</option>
									<option value="다른이유">다른 이유</option>
									</optgroup>
								</select>
							</center>
							<p></p>
						<input type="hidden" name="member_id" value="${member_id }"/>

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
	</div>
</body>
</html>