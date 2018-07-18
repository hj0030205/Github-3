package com.feline.admin;

import java.util.List;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.order.OrderModel;

public interface AdminDAO {
	
	/*********************** 대쉬보드 상단 차트 *********************/
	
	public int countTrade();
	public int countTrans();
	public int countTrans2();
	public int todayMember();
	public int todayOrder();
	public int todaySalesM();
	
	/*********************** 대쉬보드 하단 차트 *********************/
	
	public List<GoodsModel> todaySalesGoods();
	public List<ChartModel> todayMemberAge();
	public List<ChartModel> todayMemberRegion();
	public List<ChartModel> todayOrderAge();
	public List<ChartModel> todayOrderRegion();
	
	
	/***********************  통계 차트 *********************/
	
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
	

	/*********************** 회원 관리 *************************/

	// 회원 목록
	List<MemberModel> memberList();

	MemberModel memberSelect(String member_id);

	Object updateMember(MemberModel memberModel);

	List<MemberModel> memberSearchN(String searchKeyword);

	List<MemberModel> memberSearchI(String searchKeyword);

	List<MemberModel> memberSearchA(String searchKeyword);

	List<MemberModel> memberSearchP(String searchKeyword);

	List<MemberModel> memberSearchE(String searchKeyword);

	Object deleteMember(String member_id);

	/*********************** 상품 관리 *************************/

	// 상품목록
	List<GoodsModel> goodsList();

	// 상품 상세 뷰
	GoodsModel goodsView(int goods_num);

	// 검색
	List<GoodsModel> goodsSearchName(String goods_name);

	List<GoodsModel> goodsSearchCategory(String goods_category);

	// 상품등록
	Object insertGoods(GoodsModel goodsModel);

	// 글수정
	int goodsModify(GoodsModel goodsModel);

	// 마지막 게시물 번호 반환
	int goodsLastNum();

	// 첨부파일 추가 및 수정
	int updateFile(GoodsModel goodsModel);

	// 글삭제
	int goodsDelete(int goods_num);

	/*********************** 주문 관리 *************************/

	List<OrderModel> orderAllList();

	// 주문상세보기 뽑아오기
	OrderModel OrderView(int order_num);

	List<OrderModel> orderSearchNum(String search);

	List<OrderModel> orderSearchId(String search);

	List<OrderModel> orderSearchP(String search);

	Object orderModify(OrderModel OrderModel);
	
	/**********************취소/환불/교환관리*****************************/
	//취소목록 뽑아오기
	List<CancleModel> adOrderCancleList();
	
	//취소된 주문 상세 내용 불러오기.
	OrderModel adOrderCancleView(int order_num);
	
	//주문 취소 내용 가져오기.
	CancleModel adOrderCancleView2(int cancle_num);

	//주문 취소 내용 가져오기2.
	GoodsModel adOrderCancleView3(int goods_num);
	
	//환불 목록 뽑아오기
	List<RefundModel> adOrderRefundList();
	
	//환불된 주문 상세 내용 불러오기.
	OrderModel adOrderRefundView(int order_num);
	
	//주문 환불 내용 가져오기.
	RefundModel adOrderRefundView2(int trade_num);

	//주문 환불 내용 가져오기2.
	GoodsModel adOrderRefundView3(int goods_num);
	
	//환불 승인
	void adOrderRefundAgree(OrderModel orderModel, RefundModel refundModel);
	
	//환불 거절
	void adOrderRefundRefuse(OrderModel orderModel,RefundModel refundModel);
	
	
	//교환 목록 뽑아오기
	List<ChangeModel> adOrderChangeList();
	
	//교환된 주문 상세 내용 불러오기.
	OrderModel adOrderChangeView(int order_num);
	
	//주문 교환 내용 가져오기.
	ChangeModel adOrderChangeView2(int change_num);

	//주문 교환 내용 가져오기2.
	GoodsModel adOrderChangeView3(int goods_num);
	
	//교환 승인
	void adOrderChangeAgree(OrderModel orderModel,ChangeModel changeModel);
	
	//교환 거절
	void adOrderChangeRefuse(OrderModel orderModel,ChangeModel changeModel);
}
