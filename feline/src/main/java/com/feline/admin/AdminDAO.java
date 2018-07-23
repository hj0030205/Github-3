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

	List<MemberModel> searchMemberList(Map<String, Object> map);

	Object deleteMember(String member_id);

	/*********************** 상품 관리 *************************/

	List<GoodsModel> goodsList();

	GoodsModel goodsView(int goods_num);

	List<GoodsModel> goodsSearch(Map<String,Object> map);
	
	Object insertGoods(GoodsModel goodsModel);

	int goodsModify(GoodsModel goodsModel);

	int goodsLastNum();

	int updateFile(GoodsModel goodsModel);

	int goodsDelete(int goods_num);

	/*********************** 주문 관리 *************************/

	List<OrderModel> orderAllList();

	OrderModel OrderView(int order_num);

	List<OrderModel> searchOrder(Map<String, Object> map);

	Object orderModify(OrderModel OrderModel);
	
	/********************** 주문취소,환불,교환 관리 *****************************/
	List<CancleModel> adOrderCancleList();
	
	OrderModel adOrderCancleView(int order_num);
	
	CancleModel adOrderCancleView2(int cancle_num);

	GoodsModel adOrderCancleView3(int goods_num);
	
	List<RefundModel> adOrderRefundList();
	
	OrderModel adOrderRefundView(int order_num);
	
	RefundModel adOrderRefundView2(int trade_num);

	GoodsModel adOrderRefundView3(int goods_num);
	
	void adOrderRefundAgree(OrderModel orderModel, RefundModel refundModel);
	
	void adOrderRefundRefuse(OrderModel orderModel,RefundModel refundModel);
	
	
	List<ChangeModel> adOrderChangeList();
	
	OrderModel adOrderChangeView(int order_num);
	
	ChangeModel adOrderChangeView2(int change_num);
	
	GoodsModel adOrderChangeView3(int goods_num);
	
	void adOrderChangeAgree(OrderModel orderModel,ChangeModel changeModel);
	
	void adOrderChangeRefuse(OrderModel orderModel,ChangeModel changeModel);
}
