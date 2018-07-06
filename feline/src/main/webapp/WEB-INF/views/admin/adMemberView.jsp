<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function deleteConfirm(){
		if(confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href='adMemberDelete.cat?member_id=${memberModel.member_id}';
		} else { //취소
			return;
		}
	}
</script>
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
								
                                <li class="active">
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
                                <li>
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
                        <h1>회원 상세</h1>
                        <hr>

                        <form>
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
                                       <input type="text" class="form-control" id="member_zipcode" name="member_zipcode" value="${memberModel.member_zipcode}" readonly="readonly">
                                    </div>
                                </div>
							</div>
							<div class="row">
								<div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="member_addr1">기본주소</label>
                                       <input type="text" class="form-control" id="member_addr1" name="member_addr1" value="${memberModel.member_addr1}" readonly="readonly">
                                    </div>
                                </div>
								<div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="member_addr2">상세주소</label>
                                       <input type="text" class="form-control" id="member_addr2" name="member_addr2" value="${memberModel.member_addr2}" readonly="readonly">
                                    </div>
                                </div>
                              
                             
                                <div class="col-sm-12 text-center">
                                    <button type="button" class="btn btn-default" onclick="javascript:location.href='adMemberList.cat?${currentPage}'"><i class="fa fa-list"></i> 목록</button>
									<button type="button" class="btn btn-default" onclick="javascript:location.href='adMemberModify.cat?member_id=${memberModel.member_id}&currentPage=${currentPage }'"><i class="fa fa-pencil-square-o"></i> 수정</button>
									<button type="button" class="btn btn-default" onclick="deleteConfirm();"><i class="fa fa-trash-o"></i> 삭제</button>

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