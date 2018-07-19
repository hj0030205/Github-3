package com.feline.basket;

import java.util.List;

import com.feline.goods.GoodsModel;

public interface BasketDao {
	
	 Object insertBasket(BasketModel basketModel);
	 List<BasketModel> basketList(BasketModel basketModel);
	 List<BasketModel> basketGoodsCheck(BasketModel basketModel);
	 Object basketDelete (int basket_num);
	 int updateAmount (BasketModel basketModel);
	 List<BasketModel> basketListCheckStatus(BasketModel basketModel);
	 GoodsModel selectGoods(int goods_num);

}
