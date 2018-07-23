<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
</head>

<body>
	<aside class="left-sidebar">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
				<ul id="sidebarnav">
					<li><a class="waves-effect waves-dark"
						href="/feline/admin/main.cat" aria-expanded="false"> <i
							class="mdi mdi-gauge"></i> <span class="hide-menu">관리자
								메인페이지</span></a></li>
					<!-- <li class="nav-devider"></li> -->
					<li><a class="waves-effect waves-dark" href="#"
						aria-expanded="false"> <i class="mdi mdi-human-greeting"></i>
							<span class="hide-menu">회원 관리</span></a>
						<ul class="nav-dropdown-items">
							<li><a href="/feline/admin/adMemberList.cat"
								aria-expanded="false"> <i class="mdi mdi-account-check"></i>
									<span class="nav-dropdown-item">회원 리스트</span></a></li>
						</ul></li>
					<li><a class="waves-effect waves-dark" href="#"
						aria-expanded="false"> <i
							class="mdi mdi-book-open-page-variant"></i> <span
							class="hide-menu">상품 관리</span></a>
						<ul class="nav-dropdown-items">
							<!-- <li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-bookmark-check"></i> <span class="nav-dropdown-item">카테고리 관리</span></a>
							</li> -->
							<li><a href="/feline/admin/adGoodsWrite.cat"
								aria-expanded="false"> <i class="mdi mdi-book-plus"></i> <span
									class="nav-dropdown-item">상품 등록</span></a></li>
							<li><a href="/feline/admin/adGoodsList.cat"
								aria-expanded="false"> <i class="mdi mdi-book-multiple"></i>
									<span class="nav-dropdown-item">상품 통합 리스트</span></a></li>
							<!-- 미구현 -->
							<!-- <li>
								<a href="/feline/admin/bookList/bck.cat" aria-expanded="false">
								 <i class="mdi mdi-book-minus"></i> <span class="nav-dropdown-item">매진된 상품 관리</span></a>
							</li> -->
						</ul></li>

					<!-- <li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-table"></i> <span class="hide-menu">재고 관리</span></a>
						<ul class="nav-dropdown-items">
							<li>
								<a href="/feline/admin/bookList/stockMgt.cat" aria-expanded="false">
								 <i class="mdi mdi-table-column-plus-after"></i> <span class="nav-dropdown-item">현재 재고 조회</span></a>
							</li>
							<li>
								<a href="/feline/admin/bookList/soldOut.cat" aria-expanded="false">
								 <i class="mdi mdi-table-column-remove"></i> <span class="nav-dropdown-item">품절 상품 관리</span></a>
							</li>
						</ul>
					</li> -->

					<li><a class="waves-effect waves-dark" href="#"
						aria-expanded="false"> <i class="mdi mdi-cart"></i> <span
							class="hide-menu">주문 관리</span></a>
						<ul class="nav-dropdown-items">

							<li><a href="/feline/admin/adOrderList.cat"
								aria-expanded="false"> <i
									class="mdi mdi-credit-card-multiple"></i> <span
									class="nav-dropdown-item">주문 통합 리스트</span></a></li>
							<li><a href="/feline/admin/adOrderCancleList.cat" aria-expanded="false">
									<i class="mdi mdi-credit-card-multiple"></i> <span
									class="nav-dropdown-item">주문 취소 리스트</span>
							</a></li>
							<li><a href="/feline/admin/adOrderRefundList.cat" aria-expanded="false">
									<i class="mdi mdi-credit-card"></i> <span
									class="nav-dropdown-item">환불 요청 리스트</span>
							</a></li>
							<li><a href="/feline/admin/adOrderChangeList.cat" aria-expanded="false">
									<i class="mdi mdi-truck-delivery"></i> <span
									class="nav-dropdown-item">교환 요청 리스트</span>
							</a></li>
						</ul></li>
					<li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-emoticon"></i> <span class="hide-menu">고객센터</span></a>
						<ul class="nav-dropdown-items">
							<li>
								<a href="/feline/notice/noticeList.cat" aria-expanded="false">
								 <i class="mdi mdi-information-outline"></i> <span class="nav-dropdown-item">공지사항</span></a>
							</li>
							<li>
								<a href="/feline/qna/qnaList.cat" aria-expanded="false">
								 <i class="mdi mdi-help-circle-outline"></i> <span class="nav-dropdown-item">Q&A</span></a>
							</li>
							<li>
								<a href="/feline/faq/faqList.cat" aria-expanded="false">
								 <i class="mdi mdi-help-circle-outline"></i> <span class="nav-dropdown-item">FAQ</span></a>
							</li>
						</ul>
					</li>

					<li><a class="waves-effect waves-dark" href="#"
						aria-expanded="false"> <i class="mdi mdi-chart-bar"></i> <span
							class="hide-menu">통계</span></a>
						<ul class="nav-dropdown-items">
							 <li>
								<a href="/feline/admin/adGoodsChart.cat" aria-expanded="false">
								 <i class="mdi mdi-library-books"></i> <span class="nav-dropdown-item">상품 통계</span></a>
							</li>
							<li>
								<a href="/feline/admin/adChartOrder.cat" aria-expanded="false">
								 <i class="mdi mdi-credit-card-plus"></i> <span class="nav-dropdown-item">주문 통계</span></a>
							</li>
							<li>
								<a href="/feline/admin/adChartMember.cat" aria-expanded="false">
								 <i class="mdi mdi-human-male-female"></i> <span class="nav-dropdown-item">회원 통계</span></a>
							</li>
						</ul></li>
						
						
						<li><a class="waves-effect waves-dark" href="#"
						aria-expanded="false"> <i class="mdi mdi-sale"></i> <span
							class="hide-menu">이벤트 관리</span></a>
							<ul class="nav-dropdown-items">

							<li><a href="/feline/admin/adEventList.cat"
								aria-expanded="false"> <i
									class="mdi mdi-format-list-bulleted"></i> <span
									class="nav-dropdown-item">이벤트 리스트</span></a>
							</li>
							<li><a href="/feline/admin/adEventWrite.cat"
								aria-expanded="false"> <i
									class="mdi mdi-plus-circle"></i> <span
									class="nav-dropdown-item">이벤트 등록</span></a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
		<!-- Bottom points-->
		<div class="sidebar-footer">
			<!-- item-->
			<!-- <a href="" class="link" data-toggle="tooltip" title="Settings"><i
				class="ti-settings"></i></a> -->
			<!-- item-->
			<!-- <a href="" class="link" data-toggle="tooltip" title="Email"><i
				class="mdi mdi-gmail"></i></a> -->
			<!-- item-->
			<a href="/feline/member/logout.cat" class="link" data-toggle="tooltip" title="Logout"><i
				class="mdi mdi-power"></i></a>
		</div>
		<!-- End Bottom points-->
	</aside>
	<!-- ============================================================== -->
	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
</body>

</html>
