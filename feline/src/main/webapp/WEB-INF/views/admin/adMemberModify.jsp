<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정하기</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
						document.getElementById('member_addr2').focus();
					}
				}).open();
	}
</script>
<script>
	function updateCheck() {
		if (confirm("정말 수정하시겠습니까?")) {
			document.memberModel.submit();
		} else {
			return false
		}
	}
	function listCheck() {
		if (confirm("정말 목록으로 돌아가시겠습니까?")) {
			document.location.href = "adMemberList.cat?currentPage=" + ${currentPage};
		} else {
			return false;
		}
	}
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">회원 정보 수정</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/feline/admin/main.cat">관리자 메인</a>
					</li>
					<li class="breadcrumb-item"><a href="adMemberList.cat">회원
							목록</a></li>
					<li class="breadcrumb-item active">회원 정보 수정</li>
				</ol>
			</div>
		</div>
		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->
		<div class="row">
			<!-- Column -->
			<div class="col-lg-12">
				<h3>회원 수정 폼</h3>
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-lg-3" style="text-align: center;">
								<img src="/feline/resources/bootstrap/img/blog/1.jpg"
									width="150">
							</div>
							<div class="col-lg-9">
								<h4 class="card-title m-t-10">${memberModel.member_name}(@${memberModel.member_id})
									#${memberModel.member_no}</h4>
								<h6 class="card-subtitle">
									<b>등록일 :</b> ${memberModel.member_join_date}
								</h6>
								<div class="row text-center justify-content-md-center">
									<div class="col-4">
										<a href="#info" class="link"> <i class="icon-people"></i>
											<font class="font-medium">회원 정보</font>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="info">
			<div class="col-lg-12">
				<h4>
					<b>회원 정보</b>
				</h4>
				<div class="card">
					<div class="card-block">
						<form class="form-horizontal form-material" method="post" action="adMemberModify.cat" id="memberModel">
							<div class="col-md-2">
								<h4>
									<b>회원 기본 정보 ▽</b>
								</h4>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
									<label class="col-md-6">회원 ID</label>
									<div class="col-md-12">
										<input type="text" readonly="readonly" name="member_id"
											value="${memberModel.member_id}"
											class="form-control form-control-line">
									</div>
								</div>
								<div class="form-group"></div>
								<div class="col-md-6">
									<label class="col-md-6">회원 비밀번호</label>
									<div class="col-md-12">
										<input type="password"  readonly="readonly" name="member_pw"
											value="${memberModel.member_pw}"
											class="form-control form-control-line">
									</div>
								</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">회원 이름</label>
										<div class="col-md-12">
											<input type="text" readonly="readonly" name="member_name"
												value="${memberModel.member_name}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="col-md-6">
										<label class="col-md-6">생년월일</label>
										<div class="col-md-12">
											<input type="text" readonly="readonly" name="member_jumin1"
												value="${memberModel.member_jumin1}"
												class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<div class="col-md-6">
										<label for="member_email">이메일</label>
											<input type="text" name="member_email" id="member_email"
												value="${memberModel.member_email}" readonly="readonly"
												class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">전화번호</label>
										<div class="col-md-12">
											<input type="text" name="member_phone"
												value="${memberModel.member_phone}"
												class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-6">
										<label for="sample4_postcode">우편번호</label>
											<input type="text" id="sample4_postcode"
												name="member_zipcode" class="form-control form-control-line"
												value="${memberModel.member_zipcode}">
										</div>
										<div class="col-md-6">
										<label for="findZipcode"> </label>
											<input type="button" id="findZipcode" onclick="sample4_execDaumPostcode()" class="btn btn-warning" value="우편번호 검색">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-6">
										<label for="sample4_roadAddress">주소</label>
											<input type="text" name="member_addr1"
												class="form-control form-control-line"
												id="sample4_roadAddress" value="${memberModel.member_addr1}">
										</div>
										<div class="col-md-6">
										<label for="member_addr2">상세주소</label>
											<input type="text" name="member_addr2" id="member_addr2"
												class="form-control form-control-line"
												value="${memberModel.member_addr2}">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group"></div>
							<div class="form-group">
								<input type="hidden" name="currentPage" value="${currentPage}">
							</div>
							<div class="form-group">
								<div class="row col-md-12">
									<div class="col-sm-12">
									<center>
										<input type="submit" class="btn btn-warning" onclick="updateCheck()" value="회원 정보 수정">
										&nbsp; <input type="button" class="btn btn-danger" onclick="listCheck()" value="목록으로">
										</center>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>