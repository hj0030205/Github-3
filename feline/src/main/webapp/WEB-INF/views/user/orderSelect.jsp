<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

</head>
<body>
 <div id="all">
        <div id="content">
            <div class="container">
            	

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="/feline/main.cat">메인</a>
                        </li>
                        <li>주문 조회</li>
                    </ul>

                </div>
                
				<div class="row">
				<div class="form-group">
				<div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="box">
                        <h1>주문조회</h1>
						<form name="loginForm" id="loginForm" action="/feline/member/b_orderList.cat" method="POST">
                            <div class="form-group">
                                <label for="order_trade_num">주문번호</label>
                                <input type="text" class="form-control" id="order_trade_num"name="order_trade_num"/>
                            </div>
                            <hr/>
                            <div class="text-center">
                            	<button type="submit" class="btn btn-primary"><i class="fa fa-check-circle-o" aria-hidden="true"></i>주문내역조회</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

</div>
</body>
</html>