package com.feline.goods;

import java.util.List;
import com.feline.goods.GoodsModel;

public interface GoodsDao {
	
	 List<GoodsModel> goodsList();
	
	 GoodsModel goodsView(int goods_num);
	
	/* List<GoodsModel> goodsCategoryList(String goods_category);
	*/
	 List<GoodsModel> goodsSearchList(String search);

	List<GoodsModel> goodsDetailSearchList(String search);
	
}
