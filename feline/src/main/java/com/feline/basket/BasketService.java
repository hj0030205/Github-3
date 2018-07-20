package com.feline.basket;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.basket.BasketDao;
import com.feline.basket.BasketModel;
import com.feline.goods.GoodsModel;

@Service
public class BasketService implements BasketDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//장바구니 담기
	@Override
	public Object insertBasket(BasketModel basketModel) {
		return sqlSessionTemplate.insert("basket.insertBasket", basketModel);
	}
	
	//장바구니에 담긴 goods_정보 받아오기
	@Override
	public GoodsModel selectGoods(int goods_num) {
		return sqlSessionTemplate.selectOne("goods.selectGoods", goods_num);
	}
	
	//장바구니 리스트
	@Override
	public List<BasketModel> basketList(BasketModel basketModel){
		return sqlSessionTemplate.selectList("basket.basketList", basketModel);
	}
	
	//장바구니에 동일한 상품이 있는지 체크
	@Override
	public List<BasketModel> basketGoodsCheck (BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basket.basketGoodsCheck", basketModel);
	}
	
	//장바구니 삭제
	@Override
	public Object basketDelete (int basket_num) {
		return sqlSessionTemplate.delete("basket.basketDelete", basket_num);
	}
	
	//장바구니 수량변경
	@Override
	public int updateAmount (BasketModel basketModel) {
		return sqlSessionTemplate.update("basket.updateAmount", basketModel);
	}
	
	//삭제상품 제외하고 가져오기
	@Override
	public List<BasketModel> basketListCheckStatus(BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basket.basketListCheckStatus", basketModel);
	}

}
