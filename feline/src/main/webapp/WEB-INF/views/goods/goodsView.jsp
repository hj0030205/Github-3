<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:set var="now" value="<%=new java.util.Date()%>" />
<script>
	function isBuy(goodsform) {
		var isbuy = confirm("구매하시겠습니까?");

		if (isbuy == true) {
			goodsform.action = "/feline/order/goodsSettle.cat";
			goodsform.submit();
		} else {
			return false;
		}

	}
	function isBasket(goodsform) {

		var isbuy = confirm("장바구니에 저장하시겠습니까?");

		if (isbuy == true) {
			goodsform.action = "/feline/basket/basketAdd.cat";
			goodsform.submit();
		} else {
			return false;
		}
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
						<li><a href="goodsList.cat">상품목록</a></li>
						<li>${goodsModel.goods_name}</li>
					</ul>

				</div>

				<div class="col-md-3">
					<!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">카테고리</h3>
						</div>

						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked category-menu">
								<li><a>사료 </a>
									<ul>
										<li><a href="/feline/goods/goodsList.cat">유기농/홀리스틱</a></li>
										<li><a href="#">피부/피모건강</a></li>
										<li><a href="#">헤어볼케어</a></li>
										<li><a href="#">다이어트/비뇨건강</a></li>
									</ul></li>

							</ul>

						</div>
					</div>

					<!-- *** MENUS AND FILTERS END *** -->

				</div>

				<div class="col-md-9">

					<div class="row" id="productMain">
						<div class="col-sm-6">
							<div id="mainImage">
								<img
									src="/feline/resources/upload/images/${goodsModel.goods_image_savname}"
									width="100%" height="50%" />
							</div>


						</div>
						<div class="col-sm-6">
							<div class="box">
								<form name="goodsform" method="post">
									<input type="hidden" name="goods_num"
										value="${goodsModel.goods_num }">
									<table id="buy" width="350" border="0" cellpadding="0"
										style="margin: 10px; border-spacing: 10px; border-collapse: separate;">
										<tr>
											<td align="center" colspan="2">
												<h1>${goodsModel.goods_name}</h1>
											</td>
										</tr>
										<tr>
											<td align="left" colspan="1">배송비</td>
											<td align="left" colspan="1">무료</td>
										</tr>
										<tr>
											<td align="left" colspan="1">배송정보</td>
											<td align="left" colspan="1"><fmt:formatDate
													value="${now }" type="date" dateStyle="short" /> 주문/결제시 당일
												발송</td>
										</tr>
										<tr>
											<td align="left" colspan="1">제조사/판매원</td>
											<td align="left" colspan="1">feline</td>
										</tr>
										<tr>
											<td align="left" colspan="1">원산지</td>
											<td align="left" colspan="1">한국</td>
										</tr>
										<tr>
											<td align="left" colspan="1">유통기한</td>
											<td align="left" colspan="1"><fmt:formatDate
													value="${now }" type="date" dateStyle="short" /> +10일까지</td>
										</tr>
										<tr>
											<td align="left" colspan="1">사이즈</td>
											<td align="left" colspan="1">
											<select name="basket_goods_size">
													<option value="s" selected>S</option>
													<option value="m">M</option>
													<option value="l">L</option>
											</select></td>
										</tr>
										<tr>
											<td align="left" colspan="1">구매수량</td>
											<td align="left" colspan="1">
											<select name="basket_goods_amount" >
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
											</select></td>
										</tr>
										<tr>
											<td align="left" colspan="1">판매가</td>
											<td align="left" colspan="1">${goodsModel.goods_price}원</td>
										</tr>
									</table>
									<p class="text-center buttons">
										<a href="javascript:isBuy(goodsform)" class="btn btn-primary"><i
											class="fa fa-shopping-cart"></i>구매하기</a> 
										<a href="javascript:isBasket(goodsform)" class="btn btn-default"><i
											class="fa fa-heart"></i>장바구니</a>
									</p>
								</form>
							</div>
						</div>

					</div>

					<div class="box" id="details">
						<p>
						<h4>상품 상세설명</h4>
						<p>
						<pre>${goodsModel.goods_content}</pre>
						</p>
					</div>
					<div class="box" id="details">
						<p>
						<h4>배송정보</h4>
						<ul>
							<li>구매하신 상품의 상품 출고일로부터 10일 이내에 교환/반품 접수에 한합니다.(교환/환불 문의 및 접수
								: Tel.1544-2884)</li>
							<li>1. 배송기간</li> &nbsp;가. 당사 출고제품의 경우 : 4시 30분 이전 주문 및 결제완료된 건에
							한해 당일출고처리 됩니다.
							<br> &nbsp;&nbsp;(단, 지역에 따라 3~5일 정도 소요될 수 있습니다. (토요일, 공휴일
							제외, 배송일 지정 불가))
							<br> &nbsp;나. 업체 직배송 상품의 경우 : 업체에서 직접 발송되는 상품의 경우 주문결제
							완료시점에서 평균 2일 정도 소요됩니다.
							<br> &nbsp;&nbsp;(단, 지역에 따라 최고 7일정도 소요될 수 있으며, 업체사정에 따라 달라질
							수 있습니다.)
							<br>
							<li>2. 배송비</li> &nbsp;할인 및 적립금 사용을 제외한 순수결제금액이 30,000원 이상인 경우,
							무료배송입니다.(30,000원 미만일 경우, 배송비 2,500원 고객 부담)
							<br> &nbsp;&nbsp;(단, 업체배송 상품의 경우, 제주도 및 기타 산간지역 배송은 추가비용이 발생
							할 수 있습니다.)
							<br>
							<li>3. 배송상태확인</li> &nbsp;당사 쇼핑몰 화면 상단의 '주문/배송 조회' 메뉴를 이용하시면,
							배송과정을 확인하실 수 있습니다.
						</ul>

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
						<h4>주문취소</h4>
						<ul>
							<li>1. 주문 취소는 주문하신 상품에 대한 진행단계가 '입금확인 중'일 때만 가능</li> &nbsp;▶입금확인
							중이란? 고객님이 주문을 완료하였으나 모나미펫에서 아직 입금승인을 하지 않은 상태로 배송 출발 직전까지의 단계입니다.
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
						</p>

					</div>
				</div>
				<!-- /.col-md-9 -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
	<!-- /#all -->

</body>
</html>