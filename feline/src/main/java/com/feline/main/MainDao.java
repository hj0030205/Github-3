package com.feline.main;

import java.util.List;

import com.feline.goods.GoodsModel;

public interface MainDao {
	List<GoodsModel> selectNewGoodsList();
}
