package com.feline.basket;

import java.util.List;

public interface BasketDao {
	
	 Object insertBasket(BasketModel basketModel);
	 List<BasketModel> basketList(BasketModel basketModel);
	 List<BasketModel> basketGoodsCheck(BasketModel basketModel);
	 Object basketDelete (int basket_num);
	 int updateAmount (BasketModel basketModel);
	 List<BasketModel> basketListCheckStatus(BasketModel basketModel);

}
