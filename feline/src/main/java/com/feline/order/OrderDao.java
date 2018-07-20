package com.feline.order;

import java.util.List;

import com.feline.basket.BasketModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;

public interface OrderDao {
	
	// �ֹ��ϱ�.
	 Object goodsOrder(OrderModel orderModel);
	
	//�ֹ���ϻ̾ƿ���
	 List<OrderModel> OrderList(OrderModel orderModel);

	//�ֹ��󼼺��� �̾ƿ���
	 OrderModel OrdergetOne(int order_num);
	 
	 //상품 상세에서 구매 시 장바구니 테이블에 담아줌
	 Object insertBasket(BasketModel basketModel);
	
	// 장바구니 리스트를 뽑아와 주문하기에서 보여줌.
	 List<BasketModel> basketList(BasketModel basketModel);
	 
	// 상품상세에서 주문하기화면에 리스트 가져가기
	 List<BasketModel> orderBasketModel(BasketModel basketModel);
	
	// 구매하기 화면에서 주문자 정보 뿌려주기
	 MemberModel getMember(String id);
	
	//장바구니에 동일한 상품이 있는지 체크
	 List<BasketModel> basketGoodsCheck(BasketModel basketModel);
	
	//주문하면서 장바구니 삭제
	 Object basketDelete (int basket_num);
	 
	 //비회원용-goodsSettle 페이지에서 상품 정보 보여주기
	 GoodsModel selectGoods(int goods_num);
	 
	 //주문 완료 화면에서 주문번호 띄워주기용
	 OrderModel selectNewestOrder(String member_id);

}
