package com.feline.basket;

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

import com.feline.basket.BasketModel;
import com.feline.basket.BasketService;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	@Resource
	private BasketService basketService;
	
	ModelAndView mav = new ModelAndView();
	
	private List<BasketModel> basketGoodsCheck = new ArrayList<BasketModel>();
	private List<BasketModel> basketList = new ArrayList<BasketModel>();
	
	/*장바구니에 추가*/
	@RequestMapping(value="basketAdd.cat")
	public ModelAndView basketAdd(HttpSession session, HttpServletRequest request, @ModelAttribute("basketModel") BasketModel basketModel,
			HttpServletResponse response) throws IOException {
		
		String member_id = (String) session.getAttribute("id");
		
		if(member_id == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요합니다.');</script>");
			out.flush();
			mav.setViewName("login");
		} else if(member_id != null && member_id != "") {
			
			basketModel.setMember_id(member_id);
			basketGoodsCheck = basketService.basketGoodsCheck(basketModel);
				
			if(basketGoodsCheck.size() > 0) {
				mav.setViewName("/basket/moveToBasket");
			} else if(basketGoodsCheck.size() == 0) {
				basketService.insertBasket(basketModel);
				mav.setViewName("redirect:basketList.cat");
			}
		}
		mav.addObject("basketModel",basketModel);
		return mav;
	}
	
	/*장바구니 리스트*/
	@RequestMapping(value="basketList.cat")
	public ModelAndView basketList(HttpSession session, HttpServletRequest request,@ModelAttribute("basketModel")  BasketModel basketModel) {
		
		String member_id = (String)session.getAttribute("id");
		
		basketModel.setMember_id(member_id);
		
		if(member_id == null) {
			mav.setViewName("redirect:/member/login.cat");
		} else if(member_id != null || member_id != "") {
			
			basketList = basketService.basketList(basketModel);

			mav.addObject("basketList", basketList);
			mav.setViewName("basketList");
		}
		
		return mav;
		
	}
	
	/*장바구니 수량변경*/ 
	@RequestMapping(value="updateAmount.cat")
	public ModelAndView updateAmount(@ModelAttribute("basketModel") BasketModel basketModel, HttpServletRequest request) {
		
		if(request.getParameter("goods_amount") != null && request.getParameter("basket_num") != null) {
			int basket_num = Integer.parseInt(request.getParameter("basket_num"));
			int basket_goods_amount = Integer.parseInt(request.getParameter("goods_amount"));
			
			basketModel.setBasket_num(basket_num);
			basketModel.setBasket_goods_amount(basket_goods_amount);
			
			basketService.updateAmount(basketModel);
		}
		
		mav.setViewName("redirect:basketList.cat");
		
		return mav;
	}
	
	/*장바구니 삭제*/
	@RequestMapping(value="basketDelete.cat")
	public ModelAndView basketDelete(@ModelAttribute("basketModel") BasketModel basketModel) {
		
		basketService.basketDelete(basketModel.getBasket_num());
		mav.setViewName("redirect:basketList.cat");
		
		return mav;
	}

}
