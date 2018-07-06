package com.feline.main;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.goods.GoodsModel;

@Service
public class MainService implements MainDao{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//최신등록상품 출력
	@Override
	public List<GoodsModel> selectNewGoodsList() {
		return sqlSessionTemplate.selectList("goods.selectNewGoodsList");
	}
}
