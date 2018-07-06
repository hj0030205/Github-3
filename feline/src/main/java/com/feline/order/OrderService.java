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

	// 주문 완료
	@Override
	public Object goodsOrder(OrderModel orderModel) {
		return sqlSessionTemplate.insert("order.goodsOrder", orderModel);
	}

	// 주문내역뽑아오기
	@Override
	public List<OrderModel> OrderList(OrderModel orderModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.orderList", orderModel);
	}

	// 주문상세보기뽑아오기
	@Override
	public OrderModel OrdergetOne(int order_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.ordergetOne", order_num);
	}

	//장바구니 넣기
	@Override
	public Object insertBasket(BasketModel basketModel) {
		return sqlSessionTemplate.insert("basket.insertBasket", basketModel);
	}
	
	
	// 장바구니 상품들 가져오기.
	@Override
	public List<BasketModel> basketList(BasketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("basket.basketList", basketModel);
	}
	
	//상품상세에서 주문하기로 리스트 가져가기
	public List<BasketModel> orderBasketModel(BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basketModel.orderBasketList", basketModel);
	}

	// 회원 정보 가져오기.
	@Override
	public MemberModel getMember(String id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.memberSelect", id);
	}

	// 장바구니 상품 체크
	@Override
	public List<BasketModel> basketGoodsCheck(BasketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("basket.basketGoodsCheck", basketModel);
	}

	// 장바구니 물품 삭제.
	@Override
	public Object basketDelete(int basket_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("basket.basketDelete", basket_num);
	}

}
