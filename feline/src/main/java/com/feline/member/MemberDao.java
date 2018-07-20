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


	 Object memberModify(MemberModel memberModel);

	
	 Object memberDelete(String id);
	
 
	 List<OrderModel> selectNewOrderList(String member_id);
	

	 List<OrderModel> OrderList(String member_id);


	 OrderModel OrdergetOne(int order_num);
	 

	 GoodsModel goodsView(int goods_num);	


	 void orderCancle(CancleModel cancleModel,OrderModel orderModel);


	 List<OrderModel> orderCancleList(String member_id);
	 

	 CancleModel orderCancleOne(CancleModel cancleModel);

	 void clientOrderRefund(RefundModel refundModel,OrderModel orderModel);
	 

	 List<OrderModel> orderRefundList(String member_id);
	 

	 RefundModel orderRefundOne(RefundModel refundModel);
	 

	 void clientOrderChange(ChangeModel changeModel,OrderModel orderModel);
	

	 List<OrderModel> orderChangeList(String member_id);
	 

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
