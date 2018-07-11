package com.feline.goods;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class GoodsService implements GoodsDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<GoodsModel> goodsList(){
		return sqlSessionTemplate.selectList("goods.selectAll");
	}
	
	@Override
	public GoodsModel goodsView(int goods_num) {
		return sqlSessionTemplate.selectOne("goods.selectGoods",goods_num);
	}
	
	@Override
	public List<GoodsModel> goodsCategoryList(String goods_category){
		return sqlSessionTemplate.selectList("goods.selectCategory",goods_category);
	}

	
	@Override
	public List<GoodsModel> goodsSearchList(String search){
		return sqlSessionTemplate.selectList("goods.selectSearchN", "%"+search+"%");
	}
	
	@Override
	public List<GoodsModel> goodsDetailSearchList(String search){
		return sqlSessionTemplate.selectList("goods.selectSearchC", "%"+search+"%");
	}

}
