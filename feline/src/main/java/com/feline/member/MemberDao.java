package com.feline.member;

import java.util.List;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.order.OrderModel;

public interface MemberDao 
{

	 String memberLogin(MemberModel memberModel);
	 

	String adminLogin(MemberModel adminModel);


	 MemberModel getMember(String id);


	 String idCheck(String member_id);
	

	 String emailCheck(String email);
	

	 Object insertMember(MemberModel memberModel);


	 String idFindByName(MemberModel memberModel);
	

	 String pwFindById(MemberModel memberModel);

	 //회원정보수정
	 Object memberModify(MemberModel memberModel);

	 //회원정보삭제
	 Object memberDelete(String id);
	
	 //최근주문상품10개
	 List<OrderModel> selectNewOrderList(String member_id);
	
	 //주문내역
	 List<OrderModel> OrderList(String member_id);

	 //주문한개가져오기
	 OrderModel OrdergetOne(int order_num);
	 
	 
	 GoodsModel goodsView(int goods_num);	

	 //주문취소
	 void orderCancle(CancleModel cancleModel,OrderModel orderModel);

	 //주문취소리스트
	 List<OrderModel> orderCancleList(String member_id);
	 
	 //주문취소한거1개가져오기
	 CancleModel orderCancleOne(CancleModel cancleModel);
	 
	 //고객쪽 주문환불
	 void clientOrderRefund(RefundModel refundModel,OrderModel orderModel);
	 
	 //고객쪽 주문환불리스트
	 List<OrderModel> orderRefundList(String member_id);
	 
	 //주문환불한거 1개가져오기
	 RefundModel orderRefundOne(RefundModel refundModel);
	 
	 //고객쪽 주문교환
	 void clientOrderChange(ChangeModel changeModel,OrderModel orderModel);
	
	 //고객쪽 주문교환한리스트
	 List<OrderModel> orderChangeList(String member_id);
	 
	 //고객쪽 주문교환한거 1개가져오기
	 ChangeModel orderChangeOne(ChangeModel changeModel);
	 
	 
	 //비회원 주문조회
	 List<OrderModel> b_selectOrder(String order_trade_num);
	 
	 //비회원 취소목록 가져오기
	 List<OrderModel> b_orderCancleList(String order_trade_num);
	 
	 //비회원 주문취소 상세보기
	 CancleModel b_orderCancleOne(int order_num);
	 
	 //비회원 환불목록 가져오기
	 List<OrderModel> b_orderRefundList(String order_trade_num);
	 
	 //비회원 환불목록 상세보기
	 RefundModel b_orderRefundOne(int order_num);
	 
	 //비회원 교환목록 가져오기
	 List<OrderModel> b_orderChangeList(String order_trade_num);
	 
	 //비회원 교환목록 상세보기
	 ChangeModel b_orderChangeOne(int order_num);

}
