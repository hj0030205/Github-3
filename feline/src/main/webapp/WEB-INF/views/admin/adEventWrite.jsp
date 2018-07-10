<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<script type="text/javascript">
	function categorySelect(category) {
		$.ajax({
			type : "POST",
			url : "goodsCategory.cat",
			dataType : "json",
			data : {param:category},
			success : 
				function(result) {
				//select box 초기화
				$("#goods_category").find("option").remove().end().append("<option value=''>전체</option>");
				
				//배열 개수만큼 option 추가
				$.each(result, function(i){
					$("#goods_category").append("<option value='" + result[i] + "'>" + result[i] + "</option>");
				
					
				});
				
				console.log(result);
			},
			error : function(){
				alert("오류가 발생하였습니다.");
			}
		})
	};

	$("#goods_category").change(function(){
		var goods_category = $("goods_category").val();
		var params = "goods_category="+goods_category;
		
		$.ajax({
			type : "POST",
			url : "/feline/admin/eventGoodsList.cat",
			data : params,
			success : function(data){
				var result = data.goodsList;
				var str = '<tr>';
				$.each(results, function(i){
					str += '<td>' + "<input type='checkbox' id='selected' name='selected'>" + "</td>";
					str += '<td>' + "<img src='/feline/resources/upload/images/"+ results[i].goods_image_savname + "'/></td><td>" + results[i].goods_name + '</td><td>' + results[i].goods_price + '</td>'
					str += "<input type='hidden' id='goods_num' name='goods_num' value='" + result[i].goods_num + "'/>"
					str += '</tr>'
				});
				$("#goodsList").append(str);
			},
			error : function(){
				alert("error");
			}
		})
	})
</script>

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
							<c:when test="${eventModel eq null }">
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
						<c:when test="${eventModel eq null }">
							<form action="adEventWrite.cat" method="post">
							<h1>상품 등록 페이지</h1>
						</c:when>
						<c:otherwise>
							<form action="adEventModify.cat" method="post">
								<input type="hidden" name="event_num" value="${eventModel.event_num }" />
								<input type="hidden" name="currentPage" value="${currentPage }" />
							<h1>상품 수정 페이지</h1>
						</c:otherwise>
						</c:choose>
						<!-- /.content -->
						<div class="content">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="event_name">이벤트명</label>
										<input type="text"
											id="event_name" name="event_name" class="form-control"
											value="${eventModel.event_name }" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="dc_rate">할인율</label> <input type="text"
											id="dc_rate" name="dc_rate" class="form-control"
											value="${eventModel.dc_rate }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="start_date">시작일</label> <input type="date"
											id="start_date" name="start_date" class="form-control"
											value="${eventModel.start_date }" />
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label for="end_date">종료일</label> <input type="date"
											id="end_date" name="end_date" class="form-control"
											value="${eventModel.end_date }" />
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="category">대분류</label>
										<select id="category" name="category" onchange="categorySelect(this.value);">
											<option value="">전체</option>
											<option value="food">사료</option>
											<option value="snack">간식</option>
											<option value="bathroom">모래와 화장실</option>
											<option value="toy">장난감</option>
											<option value="cleaner">위생용품</option>
										</select>
										<label for="goods_category">세부분류</label>
										<select id="goods_category" name="goods_category">
											<option value="">전체</option>
										</select>
									</div>
								</div>
							</div>
							<!-- /.row -->

							<div class="row">
								<div class="col-sm-12">
									<div class="table-responsive">
										<label for="goodsList">상품목록</label>
										<table class="table" id="goodsList"></table>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</div>
						<div class="box-footer">
							<div class="pull-left">
								<a href="adEventList.cat?currentPage=${currentPage }"
								 class="btn btn-default">목록으로<i class="fa fa-chevron-left"></i></a>
							</div>
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">
									이벤트등록<i class="fa fa-chevron-right"></i>
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

</html>