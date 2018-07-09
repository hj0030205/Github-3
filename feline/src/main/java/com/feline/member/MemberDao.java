package com.feline.member;

import java.util.List;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
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

	 //주문취소
	 void orderCancle(CancleModel cancleModel,OrderModel orderModel);

	 //주문취소목록 가져오기
	 List<OrderModel> orderCancleList(String member_id);
	 
	 //주문환불(고객시점)
	 void clientOrderRefund(RefundModel refundModel,OrderModel orderModel);
	 
	 //주문환불목록 가져오기
	 List<OrderModel> orderRefundList(String member_id);
	 
	 //주문교환(고객시점)
	 void clientOrderChange(ChangeModel changeModel);
	
	 //주문교환목록 가져오기
	 List<OrderModel> orderChangeList(String member_id);
}
