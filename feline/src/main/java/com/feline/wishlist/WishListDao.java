package com.feline.wishlist;

import java.util.List;

public interface WishListDao {
	
	Object insertWishList(WishListModel WishListModel);
	List<WishListModel> wishList(WishListModel WishListModel);
	Object deleteWishList(int wish_num);
	List<WishListModel> wishCheck(WishListModel WishListModel);
	
}
