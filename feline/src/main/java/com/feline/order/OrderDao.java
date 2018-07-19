package com.feline.order;

import java.util.List;

import com.feline.basket.BasketModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;

public interface OrderDao {
	
	// 주문하기.
	 Object goodsOrder(OrderModel orderModel);
	
	//주문목록뽑아오기
	 List<OrderModel> OrderList(OrderModel orderModel);

	//주문상세보기 뽑아오기
	 OrderModel OrdergetOne(int order_num);
	 
	 // 장바구니 물품 등록
	 Object insertBasket(BasketModel basketModel);
	
	// 장바구니 목록 가져오기.
	 List<BasketModel> basketList(BasketModel basketModel);
	 
	// 상품 상세에서 주문하기로 목록 가져가기
	 List<BasketModel> orderBasketModel(BasketModel basketModel);
	
	// 장바구니 회원 정보 가져오기.
	 MemberModel getMember(String id);
	
	// 장바구니 상품 체크.
	 List<BasketModel> basketGoodsCheck(BasketModel basketModel);
	
	// 장바구니 물품 삭제.
	 Object basketDelete (int basket_num);
	 
	 //비회원 주문하기(장바구니 > 주문하기)
	 GoodsModel selectGoods(int goods_num);
	 
	 //주문 완료 화면에서 주문번호 보여주기
	 OrderModel selectNewestOrder(String member_id);


}
