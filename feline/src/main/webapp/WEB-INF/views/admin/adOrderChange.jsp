<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 수정하기</title>
</head>
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
    function adorderList(){
    	if(confirm("주문 목록으로 이동하시겠습니까?")){
    		document.location.href="adOrderList.cat?&currentPage=${currentPage}";
    	}else{
    		return false;
    	}
    }
</script>
<body>

	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">주문 수정하기</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.cat">관리자 메인</a></li>
					<li class="breadcrumb-item"><a
						href="adOrderList.cat?currentPage=${currentPage }">주문 목록</a></li>
					<li class="breadcrumb-item active">주문 수정하기</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<h2>주문 정보 수정하기(#${orderModel.order_num })</h2>
					<div class="table-responsive">
					<form id="orderChangeForm" action="adOrderModify.cat" method="POST">
					<input type="hidden" name="currentPage" value="${currentPage }"/>
					<input type="hidden" name="order_num" value="${orderModel.order_num }"/>
						<table class="table order">
							<%-- <c:url var="viewMemberURL" value="adMemberView.cat">
								<c:param name="member_id" value="${orderModel.member_id}" />
							</c:url> --%>
							<tr>
								<th>거래번호</th>
								<td>${orderModel.order_trade_num}</td>
								<th>주문날짜</th>
								<td><fmt:formatDate value="${orderModel.order_date}" pattern="yyyy.MM.dd HH:MM" /></td>
							</tr>
							<tr>
								<th>주문자</th>
								<td>
									${orderModel.order_member_id} <%-- (<a href="${viewMemberURL}">${orderModel.member_id}</a>) --%>
								</td>
								<th>주문 상태</th>
									<td><select name="order_status" id="order_status">
											<option value="0"
												<c:if test="${orderModel.order_status==0}"> selected </c:if>>결제완료</option>
											<option value="1"
												<c:if test="${orderModel.order_status==1}"> selected </c:if>>배송준비</option>
											<option value="2"
												<c:if test="${orderModel.order_status==2}"> selected </c:if>>배송중</option>
											<option value="3"
												<c:if test="${orderModel.order_status==3}"> selected </c:if>>배송완료</option>
									</select></td>
								</tr>
							<tr>
								<th width=15%>결제인</th>
								<td width=35%>${orderModel.order_trade_payer}</td>
								<th width=15%>결제 방법</th>
								<td width=35%>${orderModel.order_trade_type}</td>
							</tr>
						</table>
						<br>
						<h2>주문 상품 목록</h2>
						<table class="table order">
							<tr>
								<th width=15>상품 번호</th>
								<th width=15>상품 카테고리</th>
								<th width=40>상품 이름</th>
								<th width=15>상품 가격</th>
								<th width=15>상품 수량</th>
							</tr>
								<c:url var="viewURL" value="adGoodsView.cat">
									<c:param name="goods_num" value="${orderModel.goods_num}" />
								</c:url>
								<tr>
									<td><a href="${viewURL}">${orderModel.goods_num}</a></td>
									<td>${goodsModel.goods_category }</td>
									<td>${goodsModel.goods_name}</td>
									<td><fmt:formatNumber value="${goodsModel.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
									<td><input type="text" name="order_goods_amount" value="${orderModel.order_goods_amount}"/></td>
								</tr>
							<tr>
								<td colspan=5><b>총 구매 금액 : 
								<font color="red">
								<fmt:formatNumber value="${orderModel.order_goods_amount * goodsModel.goods_price}" type="number" pattern="#,###"/>&nbsp;원</font></b></td>
							</tr>
						</table>
						<h2>배송 정보 상세보기</h2>
						<table class="table order">
							<tr>
								<th>배송번호</th>
								<td>${orderModel.order_trade_num}</td>
							</tr>
							<tr>
								<th>수취인</th>
								<td><input type="text" name="order_receive_name" value="${orderModel.order_receive_name}"/></td>
							</tr>
							<tr>
								<th>수취인 전화번호</th>
								<td><input type="text" name="order_receive_phone" value="${orderModel.order_receive_phone}"/></td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td><input type="text" id="sample6_postcode" name="order_receive_zipcode" value="${orderModel.order_receive_zipcode}"/> 
								&nbsp; <button type="button" class="btn btn-default" id="findZipcode" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
								</td>
								<th>주소</th>
								<td colspan=3>
								<input type="text" id="sample6_address" name="order_receive_addr1" value="${orderModel.order_receive_addr1}"/>
								&nbsp;<input type="text" id="sample6_address2" name="order_receive_addr2" value="${orderModel.order_receive_addr2}"/></td>
							</tr>
							<tr>
								<th>요청 사항</th>
								<td colspan=3><input type="text" name="order_memo" value="${orderModel.order_memo}"/></td>
							</tr>
							<tr>
								<td colspan=5>
								<input type="submit" class="btn btn-success" value="주문 수정">&nbsp;
								<button class="btn btn-warning" onclick="adorderList()">주문 목록으로</button></td>
							</tr>
						</table>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>