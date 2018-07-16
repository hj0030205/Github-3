package com.feline.wishlist;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.wishlist.WishListDao;
import com.feline.wishlist.WishListModel;

@Service
public class WishListService implements WishListDao{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Object insertWishList(WishListModel WishListModel) {
		return sqlSessionTemplate.insert("wishlist.insertWishList", WishListModel);
	}
	
	@Override
	public List<WishListModel> wishList(WishListModel WishListModel){
		return sqlSessionTemplate.selectList("wishlist.wishList", WishListModel);
	}
	
	@Override
	public Object deleteWishList(int wish_num) {
		return sqlSessionTemplate.delete("wishlist.deleteWishList", wish_num);
	}
	
	@Override
	public List<WishListModel> wishCheck(WishListModel WishListModel){
		return sqlSessionTemplate.selectList("wishlist.wishCheck", WishListModel);
	}

}
	