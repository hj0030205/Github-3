<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">주문취소 목록</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.cat">Home</a></li>
					<li class="breadcrumb-item active">상품 취소 목록</li>
				</ol>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
		                   <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>취소번호</th>
                                        <th>주문번호</th>
                                        <th>취소이유</th>
                                        <th>취소한 사람의 아이디</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="adOrderCancleList" items="${adOrderCancleList}">
								<tr>
									<c:url var="viewURL" value="adOrderCancleView.cat">
										<c:param name="order_num" value="${adOrderCancleList.order_num}" />
										<c:param name="cancle_num" value="${adOrderCancleList.cancle_num}" />
									</c:url>							
									<td>
										<a href="${viewURL}"><Strong>${adOrderCancleList.cancle_num }</Strong></a>
									</td>
									<td>${adOrderCancleList.order_num }</td>
									<td>${adOrderCancleList.cancle_reason}</td>
									<td>${adOrderCancleList.member_id }</td>
								</tr>
								</c:forEach>
								<c:if test="${fn:length(adOrderCancleList) le 0}">
									<tr bgcolor="#FFFFFF" align="center">
										<td colspan="6">취소한 내역이 없습니다.</td>
									</tr>
								</c:if>
		
                                </tbody>
                            </table>
                            	<div class="paging">
									<center>${pagingHtml}</center>
								</div>
                        </div>
                     </div>
                    </div>
                  </div>
                 </div>    
		</div>
</body>
</html>