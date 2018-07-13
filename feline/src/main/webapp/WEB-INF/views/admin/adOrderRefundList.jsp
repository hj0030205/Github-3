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
				<h3 class="text-themecolor">주문환불 목록</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.cat">Home</a></li>
					<li class="breadcrumb-item active">상품 환불 목록</li>
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
                                        <th>환불번호</th>
                                        <th>주문번호</th>
                                        <th>환불이유</th>
                                        <th>환불한 사람의 아이디</th>
                                        <th>대기/수락/거절 상태</th>
                                        <th/>환불 승인/거절</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="adOrderRefundList" items="${adOrderRefundList}">
								<tr>
									<c:url var="viewURL" value="adOrderRefundView.cat">
										<c:param name="order_num" value="${adOrderRefundList.order_num}" />
										<c:param name="trade_num" value="${adOrderRefundList.trade_num}" />
									</c:url>							
									<td>
										<a href="${viewURL}"><Strong>${adOrderRefundList.trade_num}</Strong></a>
									</td>
									<td>${adOrderRefundList.order_num }</td>
									<td>${adOrderRefundList.trade_reason}</td>
									<td>${adOrderRefundList.member_id }</td>
									<td>
									<c:choose>
									<c:when test="${adOrderRefundList.trade_state == 0 }">
									대기상태
									</c:when>
									<c:when test="${adOrderRefundList.trade_state == 1 }">
									환불수락
									</c:when>
									<c:otherwise>
									환불거절
									</c:otherwise>
									</c:choose>
									</td>
									<td>
								<center>
									<form action="adOrderRefundAgree.cat" method="post">
										<input type="hidden" name="order_num" value="${adOrderRefundList.order_num}" />
										<input type="hidden" name="trade_num" value="${adOrderRefundList.trade_num}" />
										<input type="hidden" name="redirect_type" value="list"/>
										<input type="submit" value="승인" class="btn btn-success" >
									</form>
									<form action="adOrderRefundRefuse.cat" method="post">
										<input type="hidden" name="order_num" value="${adOrderRefundList.order_num}" />
										<input type="hidden" name="trade_num" value="${adOrderRefundList.trade_num}" />
										<input type="hidden" name="redirect_type" value="list"/>
										<input type="submit" value="거절" class="btn btn-danger">
									</form>
								</center>
									</td>
									
								</tr>
								</c:forEach>
								<c:if test="${fn:length(adOrderRefundList) le 0}">
									<tr bgcolor="#FFFFFF" align="center">
										<td colspan="6">환불한 내역이 없습니다.</td>
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