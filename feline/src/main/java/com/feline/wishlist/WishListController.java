package com.feline.wishlist;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.feline.wishlist.WishListModel;
import com.feline.wishlist.WishListService;

@Controller
@RequestMapping("/wishlist")
public class WishListController {
	
	@Resource
	private WishListService wishlistService;
	
	ModelAndView mav= new ModelAndView();
	
	private List<WishListModel> wishCheck=new ArrayList<WishListModel>();
	private List<WishListModel> wishList=new ArrayList<WishListModel>();
	
	@RequestMapping(value="wishAdd.cat")
	public ModelAndView wishAdd(HttpSession session, HttpServletRequest request, @ModelAttribute("WishListModel") WishListModel WishListModel, HttpServletResponse response) throws IOException{
		
		String member_id = (String) session.getAttribute("id");
		
		if(member_id == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요합니다..');</script>");
			out.flush();
			mav.setViewName("login");
		}else if(member_id != null && member_id != "") {
			
			WishListModel.setMember_id(member_id);
			wishCheck = wishlistService.wishCheck(WishListModel);
			
			if(wishCheck.size()>0) {
				mav.setViewName("/wishlist/moveToWishList");
			}else if(wishCheck.size() ==0) {
				wishlistService.insertWishList(WishListModel);
				mav.setViewName("redirect:wishList.cat");
			}
		}
		mav.addObject("WishListModel", WishListModel);
		return mav;
	}
	
	
	@RequestMapping(value="wishList.cat")
	public ModelAndView wishList(HttpSession session, HttpServletRequest request, @ModelAttribute("WishListModel") WishListModel WishListModel){
		
		String member_id = (String)session.getAttribute("id");
		
		WishListModel.setMember_id(member_id);
		
		if(member_id == null) {
			mav.setViewName("redirect:/member/login.cat");
		}else if(member_id !=null || member_id !="") {
			
			wishList=wishlistService.wishList(WishListModel);
			
			System.out.println(wishList.size());
			
			mav.addObject("wishList", wishList);
			mav.setViewName("wishList");
		}
		
		return mav;
		
		
	}
	
	@RequestMapping(value="deleteWishList.cat")
	public ModelAndView deleteWishList(@ModelAttribute("WishListModel") WishListModel WishListModel) {
		
		wishlistService.deleteWishList(WishListModel.getWish_num());
		mav.setViewName("redirect:wishList.cat");
		
		return mav;
	}

}
