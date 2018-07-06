<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
</head>
<body>

	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-sm-12">

					<ul class="breadcrumb">

						<li><a href="/feline/main.cat">메인</a></li>
						<li><a href="qnaList.cat">Q&A 게시판</a></li>
						<li>Q&A 상세 페이지</li>
					</ul>
				</div>
				<%-- <s:if test="resultClass2!=null">
					<div class="col-sm-12">
						<div class="box">
							<div class="content">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label for="goods_image">상품이미지</label> <img id="goods_image"
												src="/feline/upload/<s:property value="resultClass2.goods_image_savname"/>" />
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="goods_name">상품명</label> <input type="text"
												id="goods_name" name="goods_name" class="form-control"
												value="<s:property value='%{resultClass2.goods_name}'/>"
												readonly="readonly" /> <label for="goods_price">상품가격</label>
											<input type="text" id="goods_price" name="goods_price"
												class="form-control"
												value="<s:property value='%{resultClass2.goods_price}'/>"
												readonly="readonly" /> <input type="hidden"
												name="goods_num"
												value="<s:property value="resultClass2.goods_num"/>" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</s:if> --%>
				<div class="col-sm-12" id="blog-post">
					<div class="box">
						<h1>제목 : ${qnaModel.subject }</h1>
						<p class="author-date">작성자 : ${qnaModel.id }</p>

						<div id="post-content">
							<c:if test="${qnaModel.image_savname ne null }">
								<p>
									이미지 <img
										src="/feline/resources/upload/images/${qnaModel.image_savname }"
										width="100%" /> <br />
								</p>
							</c:if>
							<p>
								내용<br /> ${qnaModel.content }
							</p>
						</div>

					</div>
					<!-- /.box -->
				</div>
				<!-- /#blog-post -->
				<center>
					<c:if test="${sessionScope.id ne null }">
						<c:choose>
							<c:when test="${sessionScope.id eq qnaModel.id }">
								<input id="qnaWriteBtn" type="button" value="게시물 등록"
									class="btn btn-default"
									onclick="javascript:location.href='qnaWrite.cat?currentPage=${currentPage}'">
					&nbsp;
							<input id="qnaModifyBtn" type="button" value="게시물 수정"
									class="btn btn-default"
									onclick="javascript:location.href='qnaModify.cat?no=${qnaModel.no}&currentPage=${currentPage}'"> &nbsp;
							<input id="qnaDeleteBtn" type="button" value="게시물 삭제"
									class="btn btn-default"
									onclick="javascript:location.href='qnaDelete.cat?no=${qnaModel.no}&currentPage=${currentPage}'"> &nbsp;
						</c:when>
							<c:when test="${sessionScope.id eq 'admin'}">
								<input id="qnaReplyBtn" type="button" value="게시물 답변"
									class="btn btn-default"
									onclick="javascript:location.href='qnaReplyWrite.cat?no=${qnaModel.no }&currentPage=${currentPage}'"> &nbsp;
							<input id="qnaDeleteBtn" type="button" value="게시물 삭제"
									class="btn btn-default"
									onclick="javascript:location.href='qnaDelete.cat?no=${qnaModel.no }&currentPage=${currentPage}'"> &nbsp;
						</c:when>
						</c:choose>
					</c:if>
					<input id="list" type="button" value="목록으로" class="btn btn-primary"
						onclick="javascript:location.href='qnaList.cat?currentPage=${currentPage}'">
					<br /> <br />
				</center>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
</body>
</html>