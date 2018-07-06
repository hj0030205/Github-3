<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import = "java.util.HashMap" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
  <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                     <ul class="breadcrumb">
                        <li><a href="/feline/main.cat">메인</a>
                        </li>
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
								
                                <li>
                                    <a href="adMemberList.cat"><i class="fa fa-user"></i> 회원관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="adGoodsList.cat"><i class="fa fa-gift"></i> 상품관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li  class="active">
                                    <a href="adOrderList.cat"><i class="fa fa-shopping-cart"></i> 주문관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="/feline/notice/noticeList.cat"><i class="fa fa-list"></i> 고객센터관리</a>
                                </li>
							</ul>
							</div>
                            
                        </div>

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                <div class="col-md-12" id="customer-orders">
                    <div class="box">
                        <h1>주문관리</h1>
                        <p class="text-muted">
						<form>
						<select name="searchNum">
							<option value="0">주문번호</option>
							<option value="1">주문자ID</option>
							<option value="2">주문자전화번호</option>
						</select> 
						<input type="text" name="searchKeyword" size="30"/>
						<button type="submit" class="btn btn-default">
		                              <i class="fa fa-search"></i>
                    	</button>
						</form>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>주문자ID</th>
                                        <th>전화번호</th>
                                        <th>주소</th>
                                        <th>주문날짜</th>
										<th>주문상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="orderList" items="${orderlist}">
									<c:url var="viewURL" value="adOrderView.cat">
										<c:param name="order_num" value="${orderList.order_num}"/>
										<c:param name="currentPage" value="${currentPage}"/>
									</c:url>
								<tr>
									<td><a href="${viewURL}">${orderList.order_num }</a></td>
									<td>${orderList.order_member_id }</td>
									<td>${orderList.order_receive_phone }</td>
									<td>${orderList.order_receive_addr1 }</td>
									<td>${orderList.order_date }</td>
									<td>
									<select name="order_status" disabled>
										<option value="0" <c:if test="${orderList.order_status eq 0 }"> selected  </c:if>>결제완료</option>
										<option value="1" <c:if test="${orderList.order_status eq 1 }"> selected </c:if>>배송준비</option>
										<option value="2" <c:if test="${orderList.order_status eq 2 }"> selected </c:if>>배송중</option>
										<option value="3" <c:if test="${orderList.order_status eq 3 }"> selected </c:if>>배송완료</option>
									</select>
									</td>
								</tr>
								</c:forEach>
								<c:if test="${fn:length(orderlist) le 0}">
									<tr bgcolor="#FFFFFF" align="center">
										<td colspan="6">주문 내역이 없습니다.</td>
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
            <!-- /.container -->
        </div>
        <!-- /#content -->
    </div>
    <!-- /#all -->
</body>
</html>