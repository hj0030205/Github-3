<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var page=${currentPage};

	function deleteCheck(goods_num) {
		if(confirm("정말 삭제하시겠습니까?")){
			document.location.href="adGoodsDelete.cat?goods_num=" + goods_num + "&currentPage=" + page;
		}else{
			return false;
		}
	}
	function update(goods_num){
		document.location.href="adGoodsModify.cat?goods_num=" + goods_num+ "&currentPage=" + page;
	}

	 $(function() {
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
	}); 
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">상품 통합 리스트</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.cat">관리자 메인</a></li>
					<li class="breadcrumb-item active">상품 통합 리스트</li>
				</ol>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<!-- 검색창 영역 -->
						<form class="form-inline" action="adGoodsList.cat">
							<table class="table">
								<tr>
								 	<th>기간별 검색 :</th>
									<td style="text-align: left;" colspan=2>
										<input type="text" class="form-control" id="datepicker" name="date_min" placeholder="부터">
										~ <input type="text" class="form-control" id="datepicker2" name="date_max"
											placeholder="까지">
									</td>
									<th>가격별 검색 :</th>
									<td style="text-align: left;" colspan=2>
										<input type="text" class="form-control" name="price_min" placeholder="부터">
										~ <input type="text" class="form-control" name="price_max" placeholder="까지">
									</td>
								</tr>
								<tr>
									<th>항목별 검색 :</th>
									<td colspan=3>
										<div class="input-group">
											<select name="searchNum" class="form-control col-md-3">
												<option value="0">상품명</option>
												<option value="1">카테고리</option>
											</select>
											<input class="form-control col-md-9" type="text" name="searchKeyword">
											<button class="fa fa-search" style="padding-left: 10px;"></button>
										</div>
									</td>
								</tr>
							</table>
						</form>
						<div class="form-group"></div>
						<table class="list-items table table-hover table-striped">
							<thead class="list-header">
								<tr>
									<th>상품번호</th>
									<th>상품이미지</th>
									<th>상품명</th>
									<th>가격</th>
									<th>카테고리</th>
									<th>수량</th>
									<th>등록일</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(goodsList) <= 0}">
										<tr align=center>
											<td colspan=8>등록된 도서가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${goodsList}">
											<c:url var="viewURL" value="adGoodsView.cat">
												<c:param name="goods_num" value="${list.goods_num}" />
												<c:param name="currentPage" value="${currentPage}" />
											</c:url>
											<tr>
												<td class="num">${list.goods_num}</td>
												<td>
													<img src="/feline/resources/upload/images/${list.goods_image_savname}" width="100" height="130" border="0" />
												</td>
												<td>
													<a href="${viewURL}">${list.goods_name}</a>
												</td>
												<td>${list.goods_price}</td>
												<td>${list.goods_category}</td>
												<td>${list.goods_amount}</td>
												<td><fmt:formatDate value="${list.goods_date}" pattern="yyyy.MM.dd"/></td>
												<td>
													<a class="mdi mdi-grease-pencil" title="Modify"
														href="javascript:update('${list.goods_num}')"></a> 
														<a class="mdi mdi-delete" title="Delete" 
														href="javascript:deleteCheck('${list.goods_num}')"></a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<center>
						<table class="paging">
							<tr align=center>
								<td colspan=8>${pagingHtml}</td>
							</tr>
						</table>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>