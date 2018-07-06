<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
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
</script>
</head>
<body>

	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">

					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>관리자페이지</li>
					</ul>

				</div>

				<div class="col-md-12">
					<!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">관리자 메뉴</h3>
						</div>

						<div class="panel-body">
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">

									<li><a href="adMemberList.cat"><i class="fa fa-user"></i>
											회원관리</a></li>
								</ul>
							</div>
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="adGoodsList.cat"><i class="fa fa-gift"></i>
											상품관리</a></li>
								</ul>
							</div>
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">
									<li class="active"><a href="adOrderList.cat"><i
											class="fa fa-shopping-cart"></i> 주문관리</a></li>
								</ul>
							</div>
							<div class="col-sm-3">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="/feline/notice/noticeList.cat"><i
											class="fa fa-list"></i> 고객센터관리</a></li>
								</ul>
							</div>

						</div>

					</div>

				</div>
				<div class="col-md-12">
					<div class="box">
						<h1>주문 상세</h1>
						<hr>

						<form action="adOrderModify.cat" method="post">
							<input type="hidden" name="currentPage" value="${currentPage}" />
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group">
										<label for="order_num">주문번호</label> <input type="text"
											class="form-control" id="order_num" name="order_num"
											value="${orderModel.order_num}" readonly="readonly">
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label for="order_date">주문날짜</label> <input type="text"
											class="form-control" id="order_date"
											value="${orderModel.order_date}" readonly="readonly">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="order_status">배송상태</label> <br />
										 <select id="order_status" name="order_status">
											<option value="0"
												<c:if test="${orderModel.order_status eq 0 }"> selected  </c:if>>결제완료</option>
											<option value="1"
												<c:if test="${orderModel.order_status eq 1 }"> selected </c:if>>배송준비</option>
											<option value="2"
												<c:if test="${orderModel.order_status eq 2 }"> selected </c:if>>배송중</option>
											<option value="3"
												<c:if test="${orderModel.order_status eq 3 }"> selected </c:if>>배송완료</option>
										</select>
									</div>
								</div>

							</div>

							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_num">상품번호</label> <input type="text"
											class="form-control" id="goods_num"
											value="${goodsModel.goods_num}" readonly="readonly">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_name">상품명</label> <input type="text"
											class="form-control" id="goods_name"
											value="${goodsModel.goods_name}" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="row">

								<div class="col-sm-4">
									<div class="form-group">
										<label for="order_goods_amount">주문수량</label> <input
											type="text" class="form-control" id="order_goods_amount"
											value="${orderModel.order_goods_amount}" readonly="readonly">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<c:set var="sum"
											value="${goodsModel.goods_price * orderModel.order_goods_amount}" />
										<label for="order_goods_price">주문총가격</label> <input
											type="text" class="form-control" id="order_goods_price"
											value="${sum}" readonly="readonly">
									</div>
								</div>

							</div>
							<!-- /.row -->
							<hr />

							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="order_member_id">주문자ID</label> <input type="text"
											class="form-control" id="order_member_id"
											value="${orderModel.order_member_id}" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="order_receive_name">수령인</label> <input type="text"
											class="form-control" id="order_receive_name"
											name="order_receive_name"
											value="${orderModel.order_receive_name}">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="order_receive_phone">수령인 전화번호</label> <input
											type="text" class="form-control" id="order_receive_phone"
											name="order_receive_phone"
											value="${orderModel.order_receive_phone}">
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">

								<div class="col-sm-4">
									<div class="form-group">
										<label for="sample6_postcode">우편번호</label> <input type="text"
											class="form-control" id="sample6_postcode"
											name="order_receive_zipcode"
											value="${orderModel.order_receive_zipcode}">
									</div>

								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label for="findZipcode"><h2>
												<br />
											</h2></label>
										<button type="button" class="btn btn-default" id="findZipcode"
											onclick="sample6_execDaumPostcode()">우편번호찾기</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="sample6_address">배송지 기본주소</label> <input
											type="text" class="form-control" id="sample6_address"
											name="order_receive_addr1"
											value="${orderModel.order_receive_addr1}">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="sample6_address2">배송지 상세주소</label> <input
											type="text" class="form-control" id="sample6_address2"
											name="order_receive_addr2"
											value="${orderModel.order_receive_addr2}">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label for="order_memo">배송 요청사항</label> <input type="text"
											class="form-control" id="order_memo" name="order_memo"
											value="${orderModel.order_memo}">
									</div>
								</div>
								<div class="col-sm-12 text-center">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-floppy-o"></i> 수정
									</button>
									<button type="button" class="btn btn-default"
										onclick="javascript:location.href='adOrderList.cat?currentPage=${currentPage}'">
										<i class="fa fa-list"></i> 목록
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->

	</div>
	<!-- /#all -->
</body>
</html>