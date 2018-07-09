<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
</head>
<body>

	

	<div id="all">
		<div id="content">
			<div class="container">
				<!-- 과정 표시 -->

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<c:choose>
							<c:when test="${goodsModel eq null }">
								<li>상품 등록</li>
							</c:when>
							<c:otherwise>
								<li>상품 수정</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<div class="col-md-12" id="checkout">
					<div class="box">
					<c:choose>
						<c:when test="${goodsModel eq null }">
							<form action="adGoodsWrite.cat" method="post"
								enctype="multipart/form-data">
						<h1>상품 등록 페이지</h1>
						</c:when>
						<c:otherwise>
							<form action="adGoodsModify.cat" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="goods_num" value="${goodsModel.goods_num }" />
								<input type="hidden" name="currentPage" value="${currentPage }" />
								<input type="hidden" name="old_file" value="${goodsModel.goods_image_savname }" />
						<h1>상품 수정 페이지</h1>
						</c:otherwise>
						</c:choose>
						<!-- /.content -->
						<div class="content">
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_name">상품명</label> <input type="text"
											id="goods_name" name="goods_name" class="form-control"
											value="${goodsModel.goods_name }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_category">대분류</label> 
										<select id="category1" name="category1" onchange="al();">
											<option value="null">choose one</option>
											<option value="0">사료</option>
											<option value="1">간식</option>
											<option value="2">모래/화장실</option>
											<option value="3">장난감</option>
											<option value="4">위생용품</option>
										</select>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_category">카테고리</label> 
										<select id="goods_category1" name="goods_category">
											<option>대분류를 선택해주세요</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_price">가격</label> <input type="text"
											id="goods_price" name="goods_price" class="form-control"
											value="${goodsModel.goods_price }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_amount">갯수</label> <input type="text"
											id="goods_amount" name="goods_amount" class="form-control"
											value="${goodsModel.goods_amount }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="goods_size">사이즈</label> <input type="text"
											id="goods_size" name="goods_size" class="form-control"
											value="${goodsModel.goods_size }" />
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="upload">이미지</label>
										<input type="file" name="file" />
										<c:if test="${goodsModel.goods_image_savname ne null}">
										&nbsp; * ${goodsModel.goods_image_orgname }파일이 등록되어 있습니다. 
										다시 업로드하면 기존의 파일은 삭제 됩니다.
										</c:if>
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="goods_content">설명</label>
										<textarea class="form-control" id="goods_content"
											name="goods_content" rows="10">${goodsModel.goods_content }</textarea>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<div class="box-footer">
							<div class="pull-left">
								<a href="adGoodsList.cat?currentPage=${currentPage }"
								 class="btn btn-default">목록으로<i class="fa fa-chevron-left"></i></a>
							</div>
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									작성완료<i class="fa fa-chevron-right"></i>
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
</body>
<script>
	var big = document.getElementById('category1');
	var small = document.getElementById('goods_category1');
	
	function al(){
		keyValue = big.value;
		switch(keyValue){
		
		case '0': small.innerHTML = '<option value="0" <c:if test="${goodsModel.goods_category eq 0 }"> selected  </c:if>>유기농/홀리스틱</option><option value="1" <c:if test="${goodsModel.goods_category eq 1 }"> selected </c:if>>피부/피모건강</option><option value="2" <c:if test="${goodsModel.goods_category eq 2 }"> selected </c:if>>헤어볼케어</option><option value="3" <c:if test="${goodsModel.goods_category eq 3 }"> selected </c:if>>다이어트/비뇨건강</option>'; break;
		case '1': small.innerHTML = '<option value="4" <c:if test="${goodsModel.goods_category eq 4 }"> selected </c:if>>캔/파우치</option><option value="5" <c:if test="${goodsModel.goods_category eq 5 }"> selected </c:if>>저키/소시지</option><option value="6" <c:if test="${goodsModel.goods_category eq 6 }"> selected </c:if>>비스켓/트릿</option><option value="7" <c:if test="${goodsModel.goods_category eq 7 }"> selected </c:if>>캣닢/캣그라스</option>'; break;
		case '2': small.innerHTML = '<option value="8" <c:if test="${goodsModel.goods_category eq 8 }"> selected </c:if>>응고형 모래</option><option value="9" <c:if test="${goodsModel.goods_category eq 9 }"> selected </c:if>>흡수형 모래</option><option value="10" <c:if test="${goodsModel.goods_category eq 10 }"> selected </c:if>>화장실/패드</option><option value="11" <c:if test="${goodsModel.goods_category eq 11 }"> selected </c:if>>기타</option>'; break;
		case '3': small.innerHTML = '<option value="12" <c:if test="${goodsModel.goods_category eq 12 }"> selected </c:if>>공/봉제인형</option><option value="13" <c:if test="${goodsModel.goods_category eq 13 }"> selected </c:if>>레이저/낚시</option><option value="14" <c:if test="${goodsModel.goods_category eq 14 }"> selected </c:if>>막대</option><option value="15" <c:if test="${goodsModel.goods_category eq 15 }"> selected </c:if>>캣닢</option>'; break;
		case '4': small.innerHTML = '<option value="16" <c:if test="${goodsModel.goods_category eq 16 }"> selected </c:if>>샴푸/린스</option> <option value="17" <c:if test="${goodsModel.goods_category eq 17 }"> selected </c:if>>구강관리</option><option value="18" <c:if test="${goodsModel.goods_category eq 18 }"> selected </c:if>>눈/귀/피부&피모건강</option><option value="19" <c:if test="${goodsModel.goods_category eq 19 }"> selected </c:if>>브러쉬/털관리</option>'; break;
		default : small.innerHTML = '<option value=20>대분류값을 입력하세요</option>'; break;
		
		}
		
	}
</script>
</html>