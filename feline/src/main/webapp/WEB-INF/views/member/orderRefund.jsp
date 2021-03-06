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

	function refundCheck(){
		if(confirm("정말 환불하시겠습니까?") == true){
			document.orderRefund.submit();
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
						<c:choose>
							<c:when test="${sessionScope.id ne null}">
								<li>마이 페이지</li>
							</c:when>
							<c:otherwise>
								<li>주문 내역</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- 홈으로가는 링크 생성 -->
				<div class="col-md-3">
					<!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">
								<c:choose>
									<c:when test="${sessionScope.id ne null}">
										마이 페이지
									</c:when>
									<c:otherwise>
										주문 내역
									</c:otherwise>
								</c:choose>
							</h3>
						</div>

						<div class="panel-body">

						<c:choose>
							<c:when test="${sessionScope.id ne null}">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="mypage.cat">마이 페이지</a></li>
									<li><a href="orderList.cat">
									<i class="fa fa-list"></i>나의 주문 내역</a></li>
									<li><a href="orderCancleList.cat">
									<i class="fa fa-times"></i>주문 취소 내역</a></li>	
									<li class="active"><a href="orderRefundList.cat">
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
							</c:when>
							<c:otherwise>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="b_orderList.cat?order_trade_num=${orderModel.order_trade_num}">
									<i class="fa fa-list"></i>나의 주문 내역</a></li>
									<li><a href="b_orderCancleList.cat?order_trade_num=${orderModel.order_trade_num}">
									<i class="fa fa-times"></i>주문 취소 내역</a></li>	
									<li class="active"><a href="b_orderRefundList.cat?order_trade_num=${orderModel.order_trade_num}">
									<i class="fa fa-toggle-on"></i>주문 환불 내역</a></li>	
									<li><a href="b_orderChangeList.cat?order_trade_num=${orderModel.order_trade_num}">
									<i class="fa fa-reply-all"></i>주문 교환 내역</a></li>															
									
								</ul>
							</c:otherwise>
						</c:choose>
							
						</div>

					</div>
					<!-- /.col-md-3 -->

					<!-- *** CUSTOMER MENU END *** -->
				</div>

				<!-- -------------------------------사이드바----------------------------------------- -->
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<h3>
							<c:choose>
								<c:when test="${sessionScope.id ne null}">
									환불신청 <small>회원전용</small>
								</c:when>
								<c:otherwise>환불신청 <small>비회원전용</small></c:otherwise>
							</c:choose>
						</h3>
						<legend>
							<h2>환불사유</h2>
						</legend>
						
						<p>
				
						<h4>교환 및 반품(환불)정보</h4>
						<ul>
							<li>1. 교환/환불 제외 상품</li> &nbsp;가. 소비자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된
							경우(상품확인을 위한 단순 포장 훼손 제외)
							<br> &nbsp;나. 소비자의 사용 또는 소비에 의해 상품 등의 가치가 현저히 감소한 경우
							<br> &nbsp;다. 주문한지 10일 경과된 상품으로 재판매가 곤란할 정도로 상품 등의 가치가 현저히
							감소한 경우
							<br> &nbsp;라. 복제가 가능한 상품 등의 포장을 훼손한 경우
							<br> &nbsp;마. 소비자의 주문에 따라 개별적으로 생산되는 상품을 주문한 경우
							<br>
							<li>2. 교환/반품 배송비</li> &nbsp;가. 제품의 하자나 오배송으로 인한 교환 및 반품의 경우 배송비는
							당사에서 부담합니다.
							<br> &nbsp;나. 고객변심등으로 인한 고객의 귀책사유로 발생한 교환/반품의 경우 왕복배송비를
							부담하셔야 합니다.
							<br> &nbsp;&nbsp;(모나미배송과 업체배송 상품 모두 구매한 경우, 각각의 왕복배송비가
							발생됩니다.)
							<br> &nbsp;&nbsp;(단, 반품의 경우 무료배송이 아닌 배송비 부담으로 제품을 구매하신 경우에는
							편도배송비만 부담하시게 됩니다.)
							<br> &nbsp;다. 교환은 동일 상품의 경우 1회에 한하여 가능합니다.
							<br> &nbsp;라. 이벤트나 기획전 등을 통해 할인상품을 구매하셨던 경우 교환 시에는 할인가격이 아닌,
							일반 판매가로 적용됩니다.
							<br>
							<li>3. 교환/반품 접수 방법</li> &nbsp;가. 고객센터 Tel.1544-2884로 접수 요청해주시면
							교환/반품 방법을 안내해드립니다.
							<br> &nbsp;나. 안내에 따라 배송비를 해당 계좌로 입금해주시기 바랍니다.
							<br> &nbsp;다. 당사에서 보내드리는 지정택배사(CJ택배) 기사님이 도착하시면 회수할 제품을
							보내주시기 바랍니다.
							<br> &nbsp;&nbsp;(지정택배사 외에 다른택배사를 이용하실 경우 고객님이 배송비를 이중으로
							부담하실 수 있으니 반드시 고객센터를 통해 교환/환불 접수를 해주시기 바랍니다.)
							<br> &nbsp;라. 고객센터 접수 없이 임의로 제품을 보내실 경우 정상적으로 교환/반품 처리가 되지
							않으며 반송처리 됩니다.
							<br>
							<li>4. 제품 보낼 주소</li> &nbsp;가. 당사 물류센터로 보내드리는 택배사를 통하여 제품을 보내주시기
							바랍니다.
							<br> &nbsp;&nbsp;보내실 때에는 주문자 이름/ 모나미펫 아이디 / 전화번호 / 요청내용 등을
							기재하고 제품과 함께 동봉하여 보내주시기 바랍니다.(업체 배송 상품 제외)
							<br> &nbsp;나. 제품회수 주소
							<br> &nbsp;&nbsp;1) 당사출고제품 : 모나미펫 물류센터 ▶경기도 용인시 수지구 동천동 855
							모나미펫 담당자 앞
							<br> &nbsp;&nbsp;2) 업체직배송제품 : 고객센터 안내에 따라 주소지를 확인해주시기 바랍니다.
							<br>
							<li>5. 환불기간 : 상품이 회수된 날로부터 5일 안에 환불 처리해 드립니다.</li>
						</ul>
						<br></br><br></br>

					
						<form name="orderRefund" action="orderRefund.cat" method="post">
						
						<input type="hidden" name="order_num" value="${orderModel.order_num }"/>
						<input type="hidden" name="order_trade_num" value="${orderModel.order_trade_num}">
						
			
							<center>
								<select name="trade_reason" >
									<optgroup label="환불사유선택">
									<option value="단순변심">단순변심</option>
									<option value="제품불량">제품불량</option>
									<option value="다른이유">다른 이유</option>
									</optgroup>
								</select>
							</center>
							<p></p>
						<input type="hidden" name="member_id" value="${member_id }"/>

							<br />
							<br />
								<center>
								<button class="btn btn-danger" type="button" onclick="refundCheck();">환불신청하기</button>
								<br />
								<br />
								<c:choose>
									<c:when test="${sessionScope.id ne null}">
									<button class="btn btn-primary" type="button" 
									onclick="javascript:location.href='mypage.cat'">돌아가기</button>
									</c:when>
									<c:otherwise>
									<button class="btn btn-primary" type="button" 
									onclick="javascript:location.href='/feline/main.cat'">돌아가기</button>
									</c:otherwise>
								</c:choose>
								</center>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>