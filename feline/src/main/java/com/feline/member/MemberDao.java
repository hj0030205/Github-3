package com.feline.member;

import java.util.List;

import com.feline.goods.GoodsModel;
import com.feline.order.OrderModel;

public interface MemberDao 
{
	//로그인
	 String memberLogin(MemberModel memberModel);

	 //회원 정보 가져오기
	 MemberModel getMember(String id);

	// 아이디 체크
	 String idCheck(String member_id);
	
	//이메일 체크
	 String emailCheck(String email);
	
	//회원 가입
	 Object insertMember(MemberModel memberModel);

	// 아이디 찾기
	 String idFindByName(MemberModel memberModel);
	
	//비밀번호 찾기
	 String pwFindById(MemberModel memberModel);

	// 회원 정보 수정
	 Object memberModify(MemberModel memberModel);

	// 회원 탈퇴
	 Object memberDelete(String id);
	
	//최근주문목록10개뽑아오기 
	 List<OrderModel> selectNewOrderList(String member_id);
	
	//주문 목록 가져오기
	 List<OrderModel> OrderList(String member_id);

	//주문 상세보기 가져오기
	 OrderModel OrdergetOne(int order_num);
	 
	 //주문 물품 정보 가져오기
	 GoodsModel goodsView(int goods_num);	

}
