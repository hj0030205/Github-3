package com.feline.order;

import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.basket.BasketModel;
import com.feline.member.MemberModel;
import com.feline.order.OrderDao;
import com.feline.order.OrderModel;

@Service
public class OrderService implements OrderDao {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// �ֹ� �Ϸ�
	@Override
	public Object goodsOrder(OrderModel orderModel) {
		return sqlSessionTemplate.insert("order.goodsOrder", orderModel);
	}

	// �ֹ������̾ƿ���
	@Override
	public List<OrderModel> OrderList(OrderModel orderModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.orderList", orderModel);
	}

	// �ֹ��󼼺���̾ƿ���
	@Override
	public OrderModel OrdergetOne(int order_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.ordergetOne", order_num);
	}

	//��ٱ��� �ֱ�
	@Override
	public Object insertBasket(BasketModel basketModel) {
		return sqlSessionTemplate.insert("basket.insertBasket", basketModel);
	}
	
	
	// ��ٱ��� ��ǰ�� ��������.
	@Override
	public List<BasketModel> basketList(BasketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("basket.basketList", basketModel);
	}
	
	//��ǰ�󼼿��� �ֹ��ϱ�� ����Ʈ ��������
	public List<BasketModel> orderBasketModel(BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basketModel.orderBasketList", basketModel);
	}

	// ȸ�� ���� ��������.
	@Override
	public MemberModel getMember(String id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.memberSelect", id);
	}

	// ��ٱ��� ��ǰ üũ
	@Override
	public List<BasketModel> basketGoodsCheck(BasketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("basket.basketGoodsCheck", basketModel);
	}

	// ��ٱ��� ��ǰ ����.
	@Override
	public Object basketDelete(int basket_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("basket.basketDelete", basket_num);
	}

}
