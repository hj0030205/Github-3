<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
  ;window.channelPluginSettings = {
    "pluginKey": "6dbccd73-347f-47d9-a6f1-865a5e0300b6"
  };
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
</script>
<!-- End Channel Plugin -->
</head>
<div id="all">
	<div id="content">
		<div class="container">
			<div class="col-md-12">
				<div id="main-slider">
					<div class="item">
						<img src="/feline/resources/common/img/mainboard.jpg" alt="noImage" width="100%"
							class="img-responsive">
					</div>
					<div class="item">
						<img class="img-responsive"
							src="/feline/resources/common/img/mainboard2.jpg" alt="noImage" width="100%">
					</div>
					<div class="item">
						<img class="img-responsive"
							src="/feline/resources/common/img/mainboard3.jpg" alt="noImage" width="100%">
					</div>
					<div class="item">
						<img class="img-responsive"
							src="/feline/resources/common/img/mainboard4.jpg" alt="noImage" width="100%">
					</div>
				</div>
				<!-- /#main-slider -->
			</div>
		</div>

		<!-- *** ADVANTAGES HOMEPAGE ***
 _________________________________________________________ -->
		<div id="advantages">

			<div class="container">
				<div class="same-height-row">
					<div class="col-sm-4">
						<div class="box same-height clickable">
							<div class="icon">
								<i class="fa fa-heart"></i>
							</div>

							<h3>
								<a href="#">빠 른 배 송</a>
							</h3>
							<p>저희는 언제나 당일 배송을 지향하고 있습니다.</p>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="box same-height clickable">
							<div class="icon">
								<i class="fa fa-tags"></i>
							</div>

							<h3>
								<a href="#">친 환 경 제 품</a>
							</h3>
							<p>저희는 고객의 소중한 반려 동물의 건강을 위해서 최대한 친환경 제품을 판매합니다.</p>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="box same-height clickable">
							<div class="icon">
								<i class="fa fa-thumbs-up"></i>
							</div>

							<h3>
								<a href="#">좋 은 가 성 비</a>
							</h3>
							<p>저희는 최대한 이윤을 적게 잡아서 판매합니다.</p>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /#advantages -->
		<!-- *** ADVANTAGES END *** -->
		<!-- *** HOT PRODUCT SLIDESHOW ***
 _________________________________________________________ -->
		<div id="hot">

			<div class="box">
				<div class="container">
					<div class="col-md-12">
						<h2>신 &nbsp; 제 &nbsp; 품</h2>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="product-slider">
					<!-- 상품 -->
					<c:if test="${newGoodsList!=null }">
						<c:forEach var="newGoodsList" items="${newGoodsList}" varStatus="stat">
							<div class="item">
								<div class="product">
									<div class="flip-container">
										<div class="flipper" style="height: 200px">
											<div class="front">

												<c:url var="viewURL" value="/goods/goodsView.cat">
													<c:param name="goods_num">
													${newGoodsList.goods_num}
												</c:param>
												</c:url>

												<a href="${viewURL}"> <img
													src="/feline/resources/upload/images/${newGoodsList.goods_image_savname}"
													width="100%" height="100%" />
												</a>
											</div>
											<div class="back">
												<a href="${viewURL}"> <img
													src="/feline/resources/upload/images/${newGoodsList.goods_image_savname}"
													width="100%" height="100%" />
												</a>
											</div>
										</div>
									</div>
									<div class="text">
										<h3>
											<a href="${viewURL}">${newGoodsList.goods_name}</a>
										</h3>
										<p class="price">
											<fmt:formatNumber value="${newGoodsList.goods_price}"
												type="number" pattern="#,###" />
											&nbsp;원
										</p>
									</div>
									<!-- /.text -->
								</div>
								<!-- /.product -->
							</div>
							<!-- 상품끝 -->
						</c:forEach>
					</c:if>
				</div>
				<!-- /.product-slider -->
			</div>
			<!-- /.container -->

		</div>
		<!-- /#hot -->
	</div>
	<!-- /#content -->
</div>
</body>
</html>