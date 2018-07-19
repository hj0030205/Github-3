<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무통장 입금</title>
</head>
<body>
 <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-sm-12">

                    <ul class="breadcrumb">

                        <li><a href="/feline/main.cat">메인</a>
                        </li>
                        <li>주문하기
                        </li>
                    </ul>
                </div>
                
                
                <div class="col-sm-12" id="blog-post">


                    <div class="box">
						<center>
                        <h3>주문이 접수완료 되었습니다.</h3>
                        <br/>
                        <p>주문번호: ${orderModel.order_trade_num}</p>
                        <div class="box">
                        	<center>
                        	<h4><strong><font color="red">입금계좌번호 : 110-354-417689 (신한은행)</font></strong></h4>
                        	<br/>
                        	<h4>예금주 : 홍성필</h4>
                        	<br/>
                        	<h5>주문접수후 3일 내로 입금을 해주셔야 합니다.</h5> 
                        	</center>
                        </div>
						<hr/>
                        <button type="button" onclick="javascript:location.href='/feline/main.cat'" class="btn btn-primary"><i class="fa fa-home">&nbsp;메인으로</i></button>
						</center>

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