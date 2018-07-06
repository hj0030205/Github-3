<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>
   <div id="all">
        <div id="content">
            <div class="container">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="/feline/main.action">메인</a>
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
								
                                <li class="active">
                                    <a href="/feline/adMember/adMemberList.cat"><i class="fa fa-user"></i> 회원관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="/feline/adGoods/adGoodsList.cat"><i class="fa fa-gift"></i> 상품관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="/feline/adOrder/adOrderList.cat"><i class="fa fa-shopping-cart"></i> 주문관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="/feline/board/noticeList.cat"><i class="fa fa-list"></i> 고객센터관리</a>
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
                        <h1>회원정보수정</h1>
                        <hr>
                        <form action="adMemberModify.cat" method="post">
                        <input type=hidden name="currentPage" value="${currentPage}" />
                             <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="member_name">이 름</label>
                                        <input type="text" class="form-control" id="member_name" name="member_name" value="${memberModel.member_name}" readonly="readonly">
									</div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="member_id">아이디</label>
                                        <input type="text" class="form-control" id="member_id" name="member_id" value="${memberModel.member_id}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                       <label for="member_pw">비밀번호</label>
                                        <input type="text" class="form-control" id="member_pw" name="member_pw" value="${memberModel.member_pw}" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="member_jumin1">생년월일</label>
                                        <input type="text" class="form-control" id="member_jumin1" name="member_jumin1" value="${memberModel.member_jumin1}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                       <label for="member_email">이메일</label>
                                       <input type="text" class="form-control" id="member_email" name="member_email" value="${memberModel.member_email}" readonly="readonly">
                                    </div>
                                </div>
								<div class="col-sm-4">
                                    <div class="form-group">
                                       <label for="member_phone">전화번호</label>
                                       <input type="text" class="form-control" id="member_phone" name="member_phone" value="${memberModel.member_phone}" readonly="readonly">
                                    </div>
                                </div>
								
								<div class="col-sm-4">
                                    <div class="form-group">
                                       <label for="member_zipcode">우편번호</label>
                                       <input type="text" class="form-control" id="sample4_postcode" name="member_zipcode" value="${memberModel.member_zipcode}">
                                    </div>									
                                </div>
								<div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="findZipcode"><h2><br/></h2></label>
                                            <button type="button" class="btn btn-default" id="findZipcode" onclick="sample4_execDaumPostcode()">우편번호찾기
											</button>
										</div>
                                 </div>
							</div>
							<div class="row">
								<div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="member_addr1">기본주소</label>
                                       <input type="text" class="form-control" id="sample4_roadAddress" name="member_addr1" value="${memberModel.member_addr1}">
                                    </div>
                                </div>
								<div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="member_addr2">상세주소</label>
                                       <input type="text" class="form-control" id="member_addr2" name="member_addr2" value="${memberModel.member_addr2}">
                                    </div>
                                </div>
                              
                             
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> 수정</button>
									<button type="button" class="btn btn-default" onclick="javascript:location.href='adMemberView.cat?member_id=${memberModel.member_id}&currentPage=${currentPage}'"><i class="fa fa-undo"></i> 취소</button>
								
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