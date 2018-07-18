package com.feline.member;

import java.util.List;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.order.OrderModel;

public interface MemberDao 
{
	//�α���
	 String memberLogin(MemberModel memberModel);

	 //ȸ�� ���� ��������
	 MemberModel getMember(String id);

	// ���̵� üũ
	 String idCheck(String member_id);
	
	//�̸��� üũ
	 String emailCheck(String email);
	
	//ȸ�� ����
	 Object insertMember(MemberModel memberModel);

	// ���̵� ã��
	 String idFindByName(MemberModel memberModel);
	
	//��й�ȣ ã��
	 String pwFindById(MemberModel memberModel);

	// ȸ�� ���� ����
	 Object memberModify(MemberModel memberModel);

	// ȸ�� Ż��
	 Object memberDelete(String id);
	
	//�ֱ��ֹ����10���̾ƿ��� 
	 List<OrderModel> selectNewOrderList(String member_id);
	
	//�ֹ� ��� ��������
	 List<OrderModel> OrderList(String member_id);

	//�ֹ� �󼼺��� ��������
	 OrderModel OrdergetOne(int order_num);
	 
	 //�ֹ� ��ǰ ���� ��������
	 GoodsModel goodsView(int goods_num);	

	 //�ֹ����
	 void orderCancle(CancleModel cancleModel,OrderModel orderModel);

	 //�ֹ���Ҹ�� ��������
	 List<OrderModel> orderCancleList(String member_id);
	 
	 //�ֹ���һ󼼺���
	 CancleModel orderCancleOne(CancleModel cancleModel);
	 
	 //�ֹ�ȯ��(������)
	 void clientOrderRefund(RefundModel refundModel,OrderModel orderModel);
	 
	 //�ֹ�ȯ�Ҹ�� ��������
	 List<OrderModel> orderRefundList(String member_id);
	 
	 //�ֹ�ȯ�һ󼼺���
	 RefundModel orderRefundOne(RefundModel refundModel);
	 
	 //�ֹ���ȯ(������)
	 void clientOrderChange(ChangeModel changeModel,OrderModel orderModel);
	
	 //�ֹ���ȯ��� ��������
	 List<OrderModel> orderChangeList(String member_id);
	 
	 //�ֹ���ȯ�󼼺���
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
