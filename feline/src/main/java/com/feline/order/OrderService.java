package com.feline.order;

import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.basket.BasketModel;
import com.feline.goods.GoodsModel;
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

	//상품 상세에서 구매 시 장바구니 테이블에 담아줌
	@Override
	public Object insertBasket(BasketModel basketModel) {
		return sqlSessionTemplate.insert("basket.insertBasket", basketModel);
	}
	
	
	// 장바구니 리스트를 뽑아와 주문하기에서 보여줌.
	@Override
	public List<BasketModel> basketList(BasketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("basket.basketList", basketModel);
	}
	
	// 상품상세에서 주문하기화면에 리스트 가져가기
	public List<BasketModel> orderBasketModel(BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basket.orderBasketList", basketModel);
	}

	// 구매하기 화면에서 주문자 정보 뿌려주기
	@Override
	public MemberModel getMember(String id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.memberSelect", id);
	}

	//장바구니에 동일한 상품이 있는지 체크
	@Override
	public List<BasketModel> basketGoodsCheck(BasketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("basket.basketGoodsCheck", basketModel);
	}

	//주문하면서 장바구니 삭제
	@Override
	public Object basketDelete(int basket_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("basket.basketDelete", basket_num);
	}
	
	//비회원용-goodsSettle 페이지에서 상품 정보 보여주기
	@Override
	public GoodsModel selectGoods(int goods_num) {
		return sqlSessionTemplate.selectOne("goods.selectGoods", goods_num);
	}
	
	
	//주문 완료 화면에서 주문번호 띄워주기용
	public OrderModel selectNewestOrder(String member_id) {
		return sqlSessionTemplate.selectOne("order.selectNewestOrder", member_id);
	}
}
