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
	 
	 // ��ٱ��� ��ǰ ���
	 Object insertBasket(BasketModel basketModel);
	
	// ��ٱ��� ��� ��������.
	 List<BasketModel> basketList(BasketModel basketModel);
	 
	// ��ǰ �󼼿��� �ֹ��ϱ�� ��� ��������
	 List<BasketModel> orderBasketModel(BasketModel basketModel);
	
	// ��ٱ��� ȸ�� ���� ��������.
	 MemberModel getMember(String id);
	
	// ��ٱ��� ��ǰ üũ.
	 List<BasketModel> basketGoodsCheck(BasketModel basketModel);
	
	// ��ٱ��� ��ǰ ����.
	 Object basketDelete (int basket_num);
	 
	 //��ȸ�� �ֹ��ϱ�(��ٱ��� > �ֹ��ϱ�)
	 GoodsModel selectGoods(int goods_num);
	 
	 //�ֹ� �Ϸ� ȭ�鿡�� �ֹ���ȣ �����ֱ�
	 OrderModel selectNewestOrder(String member_id);

}
