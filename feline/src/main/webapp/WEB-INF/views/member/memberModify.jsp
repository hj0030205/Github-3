<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원정보수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">


	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
					}
				}).open();
	}

 	function onlyNumber(obj) {
 	    $(obj).keyup(function(){
 	         $(this).val($(this).val().replace(/[^0-9]/g,""));
 	    }); 
 	}

 	
 	function check(){
 		if(!document.memberModify.member_name.value)
 		{
 			alert("이름을 입력해주세요.");
 			document.memberModify.member_name.focus();
 			return false;
 		}
 		if(!document.memberModify.member_pw.value)
 		{
 			alert("비밀번호를 입력해주세요.");
 			document.memberModify.member_pw.focus();
 			return false;
 		}
 		if(!document.memberModify.member_jumin1.value)
 		{
 			alert("생년월일을 입력해주세요.");
 			document.memberModify.member_jumin1.focus();
 			return false;
 		}
 		
 		if(!document.memberModify.member_phone.value)
 		{
 			alert("핸드폰번호를 입력해주세요.");
 			document.memberModify.member_phone.focus();
 			return false;
 		}
 		
 		if(!document.memberModify.member_addr2.value)
 		{
 			alert("상세주소를 입력해주세요.");
 			document.memberModify.member_addr2.focus();
 			return false;
 		}
 		
 		if(!document.memberModify.member_email.value)
 		{
 			alert("이메일주소를 입력해주세요.");
 			document.memberModify.member_email.focus();
 			return false;
 		}
 	}
 	</script>
 	<script type='text/javaScript'>
	$(document).ready(function(){
    var u_phone = $('#phone');
    
    $('#btn_pass').click(function(){
        // 정규식 -전화번호 유효성 검사
        var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;

        if(!regPhone.test(u_phone.val())){
        	alert('전화번호에 " - "을 빼고 입력해주셔야합니다.');
        	u_phone.focus();
        	return false;
        }
    });
    
});
	</script>
	<script>
	$(document).ready(function(){
				
				  var emailVal = $("#email");
			  
				  $('#emailchk').click(function(){
				  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				  // 검증에 사용할 정규식 변수 regExp에 저장
				  if(!regExp.test(emailVal.val())) {
				    alert("이메일형식에 맞지 않습니다.");
				    emailVal.focus();
				    return false;
				 }else {
					 	if(document.memberModify.member_email.value == document.memberModify.member_email_own.value){
					 	alert("기존의 이메일과 같습니다.");
				 		return false;
				 	}else{
						window.name = "EmailChkForm"
						window.open("member_emailCheck.cat?member_email="+ document.memberModify.member_email.value, "emailchkForm",									"width=500,height=300,resizable=no,scrollbars=no");
			 		}
				 }
			});
		});
	</script>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원수정 폼</title>
</head>
<body>
<div class="all">
	<div class="content">
		<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>회원정보수정</li>
					</ul>
				</div>
				
								<!-- *** CUSTOMER MENU ***
 ________________________________________________________ -->
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
										class="fa fa-shopping-cart"></i>장바구니</a></li>
								<li><a href="/feline/wishlist/wishList.cat"><i class="fa fa-heart"></i>WISHLIST</a></li>		
								<li class="active"><a href="memberModify.cat"><i
										class="fa fa-address-card"></i>회원정보수정</a></li>
								<li><a href="memberDelete.cat"><i
										class="fa fa-sign-out"></i>회원탈퇴</a></li>
								
							</ul>
						</div>

					</div>
					<!-- /.col-md-3 -->

				</div>
				<!-- *** CUSTOMER MENU END *** -->
				<!--  사이드바  -->
				<br>
				<div class="col-md-9" id="customer-orders">
					<div class="box">
						<legend>
							<h2>회원정보 입력</h2>
						</legend>
						<form name="memberModify" action="memberModify.cat" id="memberModify" method="post" onsubmit="return check()" >
						<div class="row">
						<!-- 이름 hidden -->
						<div class="col-sm-3">
									<div class="form-group">
										<label for="member_name">이름</label> 
										<input type="text" id="member_name" class="form-control" name="member_name" value="${memberModel.member_name}"/> 
									</div>
								</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>아이디</label>
								<input type="text" disabled="disabled" class="form-control" name="member_id" value="${memberModel.member_id }"/>
							</div>
						</div>		
						<div class="col-sm-4">
							<div class="form-group">
								<label for="member_pw">비밀번호</label>
								<input type="password" class="form-control" name="member_pw" value="${memberModel.member_pw }"/>
							</div>
						</div>
						</div>		
						<!-- =================================================================== -->
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label for="member_jumin1">생년월일</label>
									<input type="text" class="form-control" 
									onkeydown="onlyNumber(this)"
									name="member_jumin1" value="${memberModel.member_jumin1 }"/>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="member_phone">전화번호( - 을 빼고 입력하세요)</label>
									<input type="text" class="form-control" id="phone"
									name="member_phone" value="${memberModel.member_phone }"/>
								</div>
							</div>
						</div>
						<!-- =================================================================== -->
							<div class="row">
								<div class="col-sm-5">
									<div class="form-group">
										<label for="member_email">이메일</label> 
										<input type="text" id="email" class="form-control" name="member_email"  value="${memberModel.member_email }"/>
										<input type="hidden" name="member_email_own" value="${memberModel.member_email }"/>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label for="emailchk"><h2>
												<br />
											</h2></label>
										<button type="button" class="btn btn-default" id="emailchk"
											>중복확인</button>
									</div>
								</div>
							</div>
						<!-- =================================================================== -->							
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label>우편번호</label> 
										<input type="text" class="form-control" readonly="readonly"
											id="sample4_postcode" name="member_zipcode"
											value="${memberModel.member_zipcode }"/>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label for="zipcode"><h2>
												<br />
											</h2></label>
										<button type="button" class="btn btn-default" id=zipcode"
											onclick="sample4_execDaumPostcode()">우편번호찾기</button>
									</div>
								</div>
							</div>						
							<!-- =========================================================================== -->
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>상세주소</label> 
										<input type="text" readonly="readonly" class="form-control" name="member_addr1" id="sample4_roadAddress" value="${memberModel.member_addr1 }"/>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<label for="member_addr2">상세주소</label> 
										<input type="text" class="form-control"name="member_addr2" id="detailaddr2" value="${memberModel.member_addr2 }"/>
									</div>
								</div>
							</div>	
 				<!-- =========================================================================== -->
							<br /> <br />
							<center>
								<button type="submit" id="btn_pass" class="btn btn-primary">수정완료</button>
								&nbsp;
								<button class="btn btn-primary" type="button"
									onclick="javascript:location.href='mypage.cat'">취소하기</button>
							</center>								
						</form>
					<br>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>