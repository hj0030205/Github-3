package com.feline.order;

import java.util.List;

import com.feline.basket.BasketModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;

public interface OrderDao {
	
	 Object goodsOrder(OrderModel orderModel);

	 List<OrderModel> OrderList(OrderModel orderModel);

	 OrderModel OrdergetOne(int order_num);

	 Object insertBasket(BasketModel basketModel);

	 List<BasketModel> basketList(BasketModel basketModel);

	 List<BasketModel> orderBasketModel(BasketModel basketModel);

	 MemberModel getMember(String id);

	 List<BasketModel> basketGoodsCheck(BasketModel basketModel);

	 Object basketDelete (int basket_num);

	 GoodsModel selectGoods(int goods_num);
	 
	 OrderModel selectNewestOrder(String member_id);

}
