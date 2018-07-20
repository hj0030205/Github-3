package com.feline.admin;

import java.util.List;
import java.util.Map;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.order.OrderModel;

public interface AdminDAO {
	
	/*********************** �뽬���� ��� ��Ʈ *********************/
	
	public int countTrade();
	public int countTrans();
	public int countTrans2();
	public int todayMember();
	public int todayOrder();
	public int todaySalesM();
	
	/*********************** �뽬���� �ϴ� ��Ʈ *********************/
	
	public List<GoodsModel> todaySalesGoods();
	public List<ChartModel> todayMemberAge();
	public List<ChartModel> todayMemberRegion();
	public List<ChartModel> todayOrderAge();
	public List<ChartModel> todayOrderRegion();
	
	
	/***********************  ��� ��Ʈ *********************/
	
	public List<ChartModel> chartAllM();
	public List<ChartModel> chartNewM();
	public List<ChartModel> memberAge();
	public List<ChartModel> newMemberAge();
	public List<ChartModel> memberRegion();
	public List<ChartModel> newMemberRegion();
	
	public List<GoodsModel> GoodsSelling();
	public List<GoodsModel> monthGoodsSelling();
	public List<GoodsModel> weekGoodsSelling();
	
	public List<ChartModel> monthOrderNum();
	public List<ChartModel> monthSales();
	public List<ChartModel> weekOrderNum();
	public List<ChartModel> weekSales();
	public List<ChartModel> monthOrderAge();
	public List<ChartModel> weekOrderAge();
	public List<ChartModel> monthOrderRegion();
	public List<ChartModel> weekOrderRegion();
	
	

	/*********************** 회원관리 *************************/

	// ȸ�� ���
	List<MemberModel> memberList();

	MemberModel memberSelect(String member_id);

	Object updateMember(MemberModel memberModel);

	List<MemberModel> memberSearchN(String searchKeyword);

	List<MemberModel> memberSearchI(String searchKeyword);

	List<MemberModel> memberSearchA(String searchKeyword);

	List<MemberModel> memberSearchP(String searchKeyword);

	List<MemberModel> memberSearchE(String searchKeyword);

	Object deleteMember(String member_id);

	/*********************** ��ǰ ���� *************************/

	// ��ǰ���
	List<GoodsModel> goodsList();

	// ��ǰ �� ��
	GoodsModel goodsView(int goods_num);

	// �˻�
	List<GoodsModel> goodsSearch(Map<String,Object> map);
	
	// ��ǰ���
	Object insertGoods(GoodsModel goodsModel);

	// �ۼ���
	int goodsModify(GoodsModel goodsModel);

	// ������ �Խù� ��ȣ ��ȯ
	int goodsLastNum();

	// ÷������ �߰� �� ����
	int updateFile(GoodsModel goodsModel);

	// �ۻ���
	int goodsDelete(int goods_num);

	/*********************** �ֹ� ���� *************************/

	List<OrderModel> orderAllList();

	// �ֹ��󼼺��� �̾ƿ���
	OrderModel OrderView(int order_num);

	List<OrderModel> orderSearchNum(String search);

	List<OrderModel> orderSearchId(String search);

	List<OrderModel> orderSearchP(String search);

	Object orderModify(OrderModel OrderModel);
	
	/**********************���/ȯ��/��ȯ����*****************************/
	//��Ҹ�� �̾ƿ���
	List<CancleModel> adOrderCancleList();
	
	//��ҵ� �ֹ� �� ���� �ҷ�����.
	OrderModel adOrderCancleView(int order_num);
	
	//�ֹ� ��� ���� ��������.
	CancleModel adOrderCancleView2(int cancle_num);

	//�ֹ� ��� ���� ��������2.
	GoodsModel adOrderCancleView3(int goods_num);
	
	//ȯ�� ��� �̾ƿ���
	List<RefundModel> adOrderRefundList();
	
	//ȯ�ҵ� �ֹ� �� ���� �ҷ�����.
	OrderModel adOrderRefundView(int order_num);
	
	//�ֹ� ȯ�� ���� ��������.
	RefundModel adOrderRefundView2(int trade_num);

	//�ֹ� ȯ�� ���� ��������2.
	GoodsModel adOrderRefundView3(int goods_num);
	
	//ȯ�� ����
	void adOrderRefundAgree(OrderModel orderModel, RefundModel refundModel);
	
	//ȯ�� ����
	void adOrderRefundRefuse(OrderModel orderModel,RefundModel refundModel);
	
	
	//��ȯ ��� �̾ƿ���
	List<ChangeModel> adOrderChangeList();
	
	//��ȯ�� �ֹ� �� ���� �ҷ�����.
	OrderModel adOrderChangeView(int order_num);
	
	//�ֹ� ��ȯ ���� ��������.
	ChangeModel adOrderChangeView2(int change_num);

	//�ֹ� ��ȯ ���� ��������2.
	GoodsModel adOrderChangeView3(int goods_num);
	
	//��ȯ ����
	void adOrderChangeAgree(OrderModel orderModel,ChangeModel changeModel);
	
	//��ȯ ����
	void adOrderChangeRefuse(OrderModel orderModel,ChangeModel changeModel);
}
