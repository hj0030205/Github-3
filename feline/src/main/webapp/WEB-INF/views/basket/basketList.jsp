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
<script type="text/javascript">

function onlyNumber(obj){
	$(obj).keyup(function(){
		$(this).val($(this).val.replace(/[^0-9]/g,""));
	})
	
	if($("#"+id).val() == "" || $("#"+id).val() < 1) 
		$("#"+id).val(1);	
}

function qty_value_set(id,qty,no)
{
	if($("#"+id).val() == "" || $("#"+id).val() < 1) 
		$("#"+id).val(1);
	
	var params="basket_num="+no+"&goods_amount="+$("#"+id).val();  
	    
        $.ajax({
            type : "POST",
            url : "/feline/basket/updateAmount.cat",
            data:params, 
            error : function(){
                //alert('통신실패!!');
            },
            success : function(){
            	history.go(0);
            }  	             
        });
	
}

function qty_value_change(id,qty,no,evt)
{
	var keyCode1 = evt.keyCode ? evt.keyCode : evt.which;
	
	$("#"+id).val($("#"+id).val().replace(/[^0-9]/g,""));
	
	if(keyCode1 == 13)
	{
		if($("#"+id).val() == "" || $("#"+id).val() < 1) 
			$("#"+id).val(1);	
	}
	
    var params="basket_num="+no+"&goods_amount="+$("#"+id).val();  
    
    $.ajax({
        type : "POST",
        url : "/feline/basket/updateAmount.cat",
        data:params, 
        error : function(){
            //alert('통신실패!!');
        },
        success : function(){
        }  	             
    });
        
}



</script>
</head>
<body>
	<br>
	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>장바구니</li>
					</ul>
				</div>

				<div class="col-md-12" id="basket">

					<div class="box">

						<h1>장바구니</h1>
						<!-- <p class="text-muted">You currently have 3 item(s) in your cart.</p> -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th>상품명</th>
										<th>사이즈</th>
										<th>수 량</th>
										<th>가 격</th>
										<th colspan="2">총가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="basketList" items="${basketList}" varStatus="stat">
										<tr>
											<td><img src="/feline/resources/upload/images/${basketList.goods_image_savname}" /></td>
											<td>
												<a href="/feline/goods/goodsView.cat?goods_num=${basketList.goods_num}">
													${basketList.goods_name}
												</a>
											</td>
											<td>
												<c:if test="${basketList.basket_goods_size ne null}">
													${basketList.basket_goods_size}
												</c:if>
												<c:if test="${basketList.basket_goods_size eq null} ">
												</c:if>
											</td>
											<td>
												<form action="/feline/basket/updateAmount.cat"
													method="post">
													<input type="text" id="goods_amount_${basketList.basket_num}" value="${basketList.basket_goods_amount}" name="goods_amount_${basketList.basket_num}"
													 onchange="javascript:qty_value_set('goods_amount_${basketList.basket_num}',this.value,${basketList.basket_num});" 
													 onkeyup="javascript:qty_value_change('goods_amount_${basketList.basket_num}',this.value,${basketList.basket_num},event);"
													 onkeydown="javascript:onlyNumber(this)"/>
												</form>
											</td>
											<td><fmt:formatNumber value="${basketList.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
											<td><fmt:formatNumber value="${basketList.basket_goods_amount * basketList.goods_price}" type="number" pattern="#,###"/>&nbsp;원</td>
											<td><a
												href="basketDelete.cat?basket_num=${basketList.basket_num}"><i
													class="fa fa-trash-o"></i></a></td>
											<c:set var= "sum" value="${sum + (basketList.goods_price * basketList.basket_goods_amount)}"/>
										</tr>
									</c:forEach>

									<c:if test="${fn:length(basketList) <= 0}">
										<tr>
											<td colspan="6">장바구니에 상품이 없습니다.</td>
										</tr>
									</c:if>

								</tbody>
								<tfoot>
									<tr>
										<th colspan="5">결제 예정 금액</th>
										<th colspan="2"><fmt:formatNumber value="${sum}" type="number" pattern="#,###"/>&nbsp;원</th>
									</tr>

								</tfoot>
							</table>

						</div>
						<!-- /.table-responsive -->

						<div class="box-footer">
							<div class="pull-left">
								<a href="/feline/main.cat" class="btn btn-default"><i
									class="fa fa-chevron-left"></i>쇼핑 계속하기</a>
							</div>
							<div class="pull-right">
								<button type="button" class="btn btn-primary"
									onclick="javascript:location.href='/feline/order/goodsSettle.cat'">
									주문하기<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>

					</div>
					<!-- /.box -->

				</div>
				<!-- /.col-md-3 -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->

	</div>
	<!-- /#all -->

</body>
</html>