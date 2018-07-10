<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	function memberDeleteChk(){
		if(document.memberDeleteform.passwd.value == ""){
			alert("비밀번호를 입력하세요.");
			document.memberDeleteform.passwd.focus();
			return false;
		}
		return true;;
	}
</script>
<div class="all">
		<div class="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>회원탈퇴</li>
					</ul>
				</div>
				<!-- 홈버튼으로가는 div -->

				<div class="col-md-3">

					<div class="panel panel-default sidebar-menu">
						<div class="panel-heading">
							<h3 class="panel-title">마이 페이지</h3>
						</div>

						<div class="panel-body">
						
							<ul class="nav nav-pills nav-stacked">
								<li><a href="mypage.cat">마이 페이지</a></li>
								<li><a href="orderList.cat">
								<i class="fa fa-list"></i>나의 주문 내역</a></li>
								<li><a href="orderCancleList.cat">
								<i class="fa fa-times"></i>주문 취소 내역</a></li>	
								<li><a href="orderRefundList.cat">
								<i class="fa fa-toggle-on"></i>주문 환불 내역</a></li>	
								<li><a href="orderChangeList.cat">
								<i class="fa fa-reply-all"></i>주문 교환 내역</a></li>															
								<li><a href="/feline/basket/basketList.cat"><i
										class="fa fa-heart"></i>장바구니</a></li>
								<li><a href="memberModify.cat"><i
										class="fa fa-address-card"></i>회원정보수정</a></li>
								<li class="active"><a href="memberDelete.cat"><i
										class="fa fa-sign-out"></i>회원탈퇴</a></li>
								
							</ul>
							
						</div>

					</div>
					<!-- /.col-md-3 -->
					
				</div>
				<!-- *** CUSTOMER MENU END *** -->

				<center>
						<div class="row">
							<form name="memberDeleteform" method="post" action="memberDelete.cat" onSubmit="return checkIt()">
								<label>비밀번호</label>
								<input type="password" name="member_pw" size="15">
								&nbsp; <br /> <br />
								<button type="submit" class="btn btn-primary">회원탈퇴</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-primary"
									onclick="javascript:location.href='mypage.cat'">돌아가기</button>
								<br />
							</form>
						</div>
				</center>
			</div>
		</div>
	</div>
</html>
	