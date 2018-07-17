<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
 	$(document).ready(function(){
		$("#sameUser").change(function(){
			if($("#sameUser").is(":checked")){
				$("input[name=order_receive_name]").val('${memberModel.member_name}');
				$("input[name=order_receive_phone]").val('${memberModel.member_phone}');
				$("input[name=order_receive_zipcode]").val('${memberModel.member_zipcode}');
				$("input[name=order_receive_addr1]").val('${memberModel.member_addr1}');
				$("input[name=order_receive_addr2]").val('${memberModel.member_addr2}');
			} else {
				$("input[name=order_receive_name]").val('');
				$("input[name=order_receive_phone]").val('');
				$("input[name=order_receive_zipcode]").val('');
				$("input[name=order_receive_addr1]").val('');
				$("input[name=order_receive_addr2]").val('');
			}
		})
	}) 
</script>
</head>
<body>

<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>주문하기</li>
					</ul>
				</div>

				<div class="col-md-12" id="checkout">

					<div class="box">
						<form method="post" name="orderform" id="orderform" action="/feline/order/goodsOrder.cat">
							<h1>주문하기</h1>
							<div class="content">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>상품</th>
												<th>상품명</th>
												<th>사이즈</th>
												<th>수 량</th>
												<th>개당 가격</th>
												<th>총 가격</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="basketList" items="${basketList}" varStatus="stat">
												<tr>
													<td>
														<img src="/feline/resources/upload/images/${basketList.goods_image_savname}">
													</td>
													<td>
														<a href="/feline/goods/goodsView.cat?goods_num=${basketList.goods_num}">
															${basketList.goods_name}
														</a>
														<input type="hidden" name="goods_num" value="${basketList.goods_num}" />
														<input type="hidden" name="basket_num" value="${basketList.basket_num}" />
													</td>
													<td>
														<c:if test="${basketList.basket_goods_size} != null">
															${basketList.basket_goods_size}
														</c:if>
														<c:if test="${basketList.basket_goods_size} == null">
														</c:if>
														<input type="hidden" name="basket_goods_size" value="${basketList.basket_goods_size}" />
													</td>
													<td>
														${basketList.basket_goods_amount}
														<input type="hidden" name="basket_goods_amount" value="${basketList.basket_goods_amount}" />
													</td>
													<td>
														<fmt:formatNumber value="${basketList.goods_price}" type="number" pattern="#,###"/>&nbsp;원
													</td>
													<td>
														<fmt:formatNumber value="${basketList.basket_goods_amount * basketList.goods_price}" type="number" pattern="#,###"/>&nbsp;원
													</td>
													<c:set var= "sum" value="${sum + (basketList.goods_price * basketList.basket_goods_amount)}"/>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th colspan="5">결제 금액</th>
												<th><fmt:formatNumber value="${sum}" type="number" pattern="#,###"/>&nbsp;원</th>
											</tr>
										</tfoot>
									</table>

								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.content -->

							<div class="content">
								<div class="row">
									<div class="col-sm-3">
										<h4>주문자 정보</h4>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="member_name">이 름</label>
											<input type="text" 
												class="form-control" id="member_name" name="member_name"
												value="${memberModel.member_name}"
												readonly="readonly"> 
												<input type="hidden" name="order_trade_payer" value="${memberModel.member_name}" />
										</div>
									</div>
									<div class="col-sm-4">
											<div class="form-group">
											<label for="member_phone">전화번호</label> <input type="text"
												class="form-control" id="member_phone" name="member_phone"
												value="${memberModel.member_phone}"
												readonly="readonly">
										</div>
									</div>
									<div class="col-sm-4">							
									</div>
								</div>
								<!-- /.row -->
								<div class="row">
									<div class="col-sm-2">
										<h4>배송지 정보</h4>
									</div>
									<div class="col-sm-6">
										<h5><input type="checkbox" id="sameUser" name="sameUser"/>주문자 정보와 동일</h5>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="order_receive_name">수령인</label> <input
												type="text" class="form-control" id="order_receive_name"
												name="order_receive_name"
												value="">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="order_receive_phone">전화번호</label> <input
												type="text" class="form-control" id="order_receive_phone"
												name="order_receive_phone"
												value="">
										</div>
									</div>
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label for="sample6_postcode">우편번호</label> <input type="text"
												class="form-control" id="sample6_postcode"
												name="order_receive_zipcode"
												value="">
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label for="findZipcode"><h2>
													<br />
												</h2></label>
											<button type="button" class="btn btn-default"
												id="findZipcode" onclick="sample6_execDaumPostcode()">
												우편번호찾기
											</button>
										</div>
									</div>
								</div>
								<!-- /.row -->

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="sample6_address">기본주소</label> <input type="text"
												class="form-control" id="sample6_address"
												name="order_receive_addr1"
												value="">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="sample6_address2">상세주소</label> <input type="text"
												class="form-control" id="sample6_address2"
												name="order_receive_addr2"
												value="">
										</div>
									</div>
								</div>
								<!-- /.row -->

								<div class="row">

									<div class="col-sm-12">
										<div class="form-group">
											<label for="order_memo">배송 요청사항</label> <input type="text"
												class="form-control" id="order_memo" name="order_memo"
												value="">
										</div>
									</div>

								</div>
								<center><div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="order_trade_type">결제방식</label> 
												<select name="order_trade_type" id="order_trade_type">
													<optgroup label="결제방식">
													<option value="카카오페이">카카오페이</option>
													<option value="무통장입금">무통장입금</option>
													</optgroup>
												</select>
										</div>
									</div>
								</div>
								</center>
								<!-- /.row -->
							</div>
						
							<div class="box-footer">
								<div class="pull-left">
									<a href="/feline/basket/basketList.cat"
										class="btn btn-default"><i class="fa fa-chevron-left"></i>장바구니로
										이동</a>
								</div>
								<div class="pull-right" id="btnwapper">
									<button type="button" class="btn btn-primary" onclick="checkIt()">
										결제하기<i class="fa fa-chevron-right"></i>
									</button>
								</div>
							</div>
					
						</form>
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->

	</div>
	<!-- /#all -->
<script type="text/javascript">


 	$('#order_trade_type').on('change',function(){
		if($(this).val() == '무통장입금'){
			$('#btnwapper').html("<button type='button' class='btn btn-primary' onclick='noBank()'> 결제하기<i class='fa fa-chevron-right'></i> </button>");
		}else if($(this).val() == '카카오페이'){
			$('#btnwapper').html("<button type='button' class='btn btn-primary' onclick='checkIt()'> 결제하기<i class='fa fa-chevron-right'></i> </button>")
		}
	});
	
 	function noBank(){
 		var orderform = document.getElementById("orderform");
 		orderform.action="/feline/order/noBank.cat";
 		orderform.submit();
 		
 	}
	

	function checkIt() {	  	
		  proc();
		}
	

	 function proc() {
	   var orderform = document.getElementById("orderform");
	   
	   var IMP = window.IMP; // 생략가능
	 	IMP.init('imp62195503');  // 가맹점 식별 코드
	 	IMP.request_pay({
	 	  pg : 'kakao', // 결제방식
	 	  merchant_uid : 'merchant_' + new Date().getTime(),
	 	  name : '결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	 	  amount : '${sum}',	// 결제 금액
	 	  buyer_email : '${memberModel.member_email}',	// 구매자 email
	 	  buyer_name :  '${memberModel.member_name}',	// 구매자 이름
	 	  buyer_tel :  '${memberModel.member_phone}',	// 구매자 전화번호
	 	  buyer_addr :  '${memberModel.member_addr1}'+'${memberModel.member_addr2}', // 구매자 주소
	 	  buyer_postcode :  '${memberModel.member_zipcode}', // 구매자 우편번호
      }, function(rsp) {	
        if (rsp.success) { // 성공시
          var msg = '결제가 완료되었습니다.';
          msg += '고유ID : ' + rsp.imp_uid;
          msg += '상점 거래ID : ' + rsp.merchant_uid;
          msg += '결제 금액 : ' + rsp.amount;
          msg += '카드 승인번호 : ' + rsp.apply_num;
          orderform.action = "/feline/order/goodsOrder.cat";
		  orderform.submit();
			
        } else { // 실패시
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
          alert(msg);
         /*  orderform.action = "/feline/order/goodsOrder.cat";
			orderform.submit(); */
				}
			});
		}
	</script>
</body>
</html>