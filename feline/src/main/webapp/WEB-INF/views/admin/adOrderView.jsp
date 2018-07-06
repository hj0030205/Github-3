<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                <li class="active">
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


                <div class="col-md-12">
                    <div class="box">
                        <h1>주문 상세</h1>
                
                        <hr>

                        <form>
							<div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="order_num">주문번호</label>
                                        <input type="text" class="form-control" id="order_num" name="order_num" value="${orderModel.order_num}" readonly="readonly">
									</div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="order_date">주문날짜</label>
                                        <input type="text" class="form-control" id="order_date" name="order_date" value="${orderModel.order_date}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="order_status">배송상태</label>
                                     	<br/>
                                      <select id="order_status" disabled="disabled">
										<option value="0" <c:if test="${orderModel.order_status eq 0 }"> selected  </c:if>>결제완료</option>
										<option value="1" <c:if test="${orderModel.order_status eq 1 }"> selected </c:if>>배송준비</option>
										<option value="2" <c:if test="${orderModel.order_status eq 2 }"> selected </c:if>>배송중</option>
										<option value="3" <c:if test="${orderModel.order_status eq 3 }"> selected </c:if>>배송완료</option>
									</select>
                                    </div>
                                </div>
								
                            </div>
							
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="order_goods_num">상품번호</label>
                                        <input type="text" class="form-control" id="goods_num" name="goods_num" value="${orderModel.goods_num}" readonly="readonly">
									</div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="order_goods_name">상품명</label>
                                        <input type="text" class="form-control" id="goods_name" name="goods_name" value="${goodsModel.goods_name}" readonly="readonly">
                                    </div>
                                </div>
                             </div>
                             <div class="row">
								
								<div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="order_goods_amount">주문수량</label>
                                        <input type="text" class="form-control" id="order_goods_amount" name="order_goods_amount" value="${orderModel.order_goods_amount}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                       <label for="order_goods_price">주문가격</label>
                                        <input type="text" class="form-control" id="goods_price" name="goods_price" value="${goodsModel.goods_price}" readonly="readonly">
                                    </div>
                                </div>
								
                            </div>
                            <!-- /.row -->
                            <hr/>

                            <div class="row">
								<div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="order_member_id">주문자ID</label>
                                        <input type="text" class="form-control" id="order_member_id" name="order_member_id" value="${orderModel.order_member_id}" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="order_receive_name">수령인</label>
                                        <input type="text" class="form-control" id="order_receive_name" name="order_receive_name" value="${orderModel.order_receive_name}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                       <label for="order_receive_phone">수령인 전화번호</label>
                                        <input type="text" class="form-control" id="order_receive_phone" name="order_receive_phone" value="${orderModel.order_receive_phone}" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                								
								<div class="col-sm-4">
                                    <div class="form-group">
                                       <label for="order_receive_zipcode">우편번호</label>
                                       <input type="text" class="form-control" id="order_receive_zipcode" name="order_receive_zipcode" value="${orderModel.order_receive_zipcode}" readonly="readonly">
                                    </div>
                                </div>
							</div>
							<div class="row">
								<div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="order_receive_addr1">배송지 기본주소</label>
                                       <input type="text" class="form-control" id="order_receive_addr1" name="order_receive_addr1" value="value='${orderModel.order_receive_addr1}" readonly="readonly">
                                    </div>
                                </div>
								<div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="order_receive_addr2">배송지 상세주소</label>
                                       <input type="text" class="form-control" id="order_receive_addr2" name="order_receive_addr2" value="${orderModel.order_receive_addr2}" readonly="readonly">
                                    </div>
                                </div>
								<div class="col-sm-12">
                                    <div class="form-group">
                                       <label for="order_memo">배송 요청사항</label>
                                       <input type="text" class="form-control" id="order_memo" name="order_memo" value="${orderModel.order_memo}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="button" class="btn btn-default" onclick="javascript:location.href='adOrderModify.cat?order_num=${orderModel.order_num}&currentPage=${currentPage}'"><i class="fa fa-pencil-square-o"></i> 수정</button>
									<button type="button" class="btn btn-default" onclick="javascript:location.href='adOrderList.cat?currentPage=${currentPage}'"><i class="fa fa-list"></i> 목록</button>
                                </div>
                            </div>
                        </form>
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