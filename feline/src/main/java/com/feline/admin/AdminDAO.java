package com.feline.admin;

import java.util.List;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.notice.NoticeModel;
import com.feline.order.OrderModel;

public interface AdminDAO {

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
	
	//환불 목록 뽑아오기
	List<RefundModel> adOrderRefundList();
	
	//교환 목록 뽑아오기
	List<ChangeModel> adOrderChangeList();
	

}
