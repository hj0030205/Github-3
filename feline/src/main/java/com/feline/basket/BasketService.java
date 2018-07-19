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
	
	//��ٱ��� �ֱ�
	@Override
	public Object insertBasket(BasketModel basketModel) {
		return sqlSessionTemplate.insert("basket.insertBasket", basketModel);
	}
	
	//��ȸ�� ��ٱ��Ͽ� �ֱ� - ��ǰ ���� ��ȸ
	@Override
	public GoodsModel selectGoods(int goods_num) {
		return sqlSessionTemplate.selectOne("goods.selectGoods", goods_num);
	}
	
	//��ٱ��� ����Ʈ
	@Override
	public List<BasketModel> basketList(BasketModel basketModel){
		return sqlSessionTemplate.selectList("basket.basketList", basketModel);
	}
	
	//��ٱ��� �ߺ� üũ
	@Override
	public List<BasketModel> basketGoodsCheck (BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basket.basketGoodsCheck", basketModel);
	}
	
	//��ٱ��� ����
	@Override
	public Object basketDelete (int basket_num) {
		return sqlSessionTemplate.delete("basket.basketDelete", basket_num);
	}
	
	//��ٱ��� ���� ����
	@Override
	public int updateAmount (BasketModel basketModel) {
		return sqlSessionTemplate.update("basket.updateAmount", basketModel);
	}
	
	//������ ��ǰ �����ϰ� ��ǰ ��������
	@Override
	public List<BasketModel> basketListCheckStatus(BasketModel basketModel) {
		return sqlSessionTemplate.selectList("basket.basketListCheckStatus", basketModel);
	}

}
