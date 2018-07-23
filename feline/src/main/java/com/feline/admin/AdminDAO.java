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
	

	/**********************취소/교환/환불*****************************/
	//관리자쪽 고객들 주문취소 리스트
	List<CancleModel> adOrderCancleList();
	
	//주문취소 상세보기(주문내역)
	OrderModel adOrderCancleView(int order_num);
	
	//주문취소 상세보기(취소 이유)
	CancleModel adOrderCancleView2(int cancle_num);

	//주문취소 상세보기(주문내역2)
	GoodsModel adOrderCancleView3(int goods_num);
	
	//관리자쪽 고객들 주문환불 리스트
	List<RefundModel> adOrderRefundList();
	
	//주문환불 상세보기(주문내역)
	OrderModel adOrderRefundView(int order_num);
	
	//주문환불 상세보기(환불 이유)
	RefundModel adOrderRefundView2(int trade_num);

	//주문환불 상세보기(주문내역2)
	GoodsModel adOrderRefundView3(int goods_num);
	
	//환불수락(관리자)
	void adOrderRefundAgree(OrderModel orderModel, RefundModel refundModel);
	
	//환불거절(관리자)
	void adOrderRefundRefuse(OrderModel orderModel,RefundModel refundModel);
	
	
	//관리자쪽 고객들 주문교환 리스트
	List<ChangeModel> adOrderChangeList();
	
	//주문교환 상세보기(주문내역)
	OrderModel adOrderChangeView(int order_num);
	
	//주문교환 상세보기(교환이유)
	ChangeModel adOrderChangeView2(int change_num);

	//주문교환 상세보기(주문내역2)
	GoodsModel adOrderChangeView3(int goods_num);
	
	//교환수락(관리자)
	void adOrderChangeAgree(OrderModel orderModel,ChangeModel changeModel);
	
	void adOrderChangeRefuse(OrderModel orderModel,ChangeModel changeModel);
}
