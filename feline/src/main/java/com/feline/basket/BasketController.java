package com.feline.basket;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.feline.basket.BasketModel;
import com.feline.basket.BasketService;
import com.feline.goods.GoodsModel;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	@Resource
	private BasketService basketService;
	
	ModelAndView mav = new ModelAndView();
	
	private Logger logger = Logger.getLogger(getClass());
	
	private List<BasketModel> basketGoodsCheck = new ArrayList<BasketModel>();
	private List<BasketModel> basketList = new ArrayList<BasketModel>();
	
	/*장바구니에 추가*/
	@RequestMapping(value="basketAdd.cat")
	public ModelAndView basketAdd(HttpSession session, @ModelAttribute("basketModel") BasketModel basketModel, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		String member_id = (String) session.getAttribute("id");		
		String n_id = (String) session.getAttribute("n_id");
		
		//비회원을 위한 goods_num, goods_size, goods_amount session 세팅
		String goods_num_s = "";
		String goods_size_s = "";
		String goods_amount_s = "";
		
		if(member_id == null && n_id == null) {
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
		} else if(n_id != null && n_id != "") {
			
			if((String)session.getAttribute("goods_num") != null) {
				goods_num_s = session.getAttribute("goods_num") + "," + request.getParameter("goods_num");
				goods_size_s = session.getAttribute("basket_goods_size") + "," + request.getParameter("goods_size");
				goods_amount_s = session.getAttribute("basket_goods_amount") + "," + request.getParameter("goods_amount");
			} else if((String)session.getAttribute("goods_num") == null) {
				goods_num_s = request.getParameter("goods_num");
				goods_size_s = request.getParameter("basket_goods_size");
				goods_amount_s = request.getParameter("basket_goods_amount");
			}
			
			session.setAttribute("goods_num_s", goods_num_s);
			session.setAttribute("goods_size_s", goods_size_s);
			session.setAttribute("goods_amount_s", goods_amount_s);
			
			mav.setViewName("redirect:basketList.cat");
		}

		return mav;
	}
	
	/*장바구니 리스트*/
	@RequestMapping(value="basketList.cat")
	public ModelAndView basketList(HttpSession session, HttpServletRequest request) {
		
		String member_id = (String)session.getAttribute("id");
		String n_id = (String) session.getAttribute("n_id");

		if(member_id == null && n_id == null) {
			
			mav.setViewName("redirect:/member/login.cat");
			
		} else if(member_id != null && member_id != "") {
			
			BasketModel basketModel = new BasketModel();
			
			basketModel.setMember_id(member_id);
			
			basketList = basketService.basketList(basketModel);

			mav.addObject("basketList", basketList);
			mav.setViewName("basketList");
			
		} else if(n_id != null && n_id != "") {

			String goods_num_s = (String) session.getAttribute("goods_num_s");
			String goods_size_s = (String) session.getAttribute("goods_size_s");
			String goods_amount_s = (String) session.getAttribute("goods_amount_s");
			
			String[] goods_num_array = goods_num_s.split(",");
			String[] goods_size_array = goods_size_s.split(",");
			String[] goods_amount_array = goods_amount_s.split(",");
			
			int size = goods_num_array.length;
			
			int[] goods_num_i = new int[size];
			int[] goods_amount_i = new int[size];
			
			for(int i = 0; i < size; i++) {
				goods_num_i[i] = Integer.parseInt(goods_num_array[i]);
				goods_amount_i[i] = Integer.parseInt(goods_amount_array[i]);
			}
			
			//basketList에 basketModel 삽입
			for(int j = 0; j < size; j++) {
				GoodsModel goodsModel = new GoodsModel();
				goodsModel = basketService.selectGoods(goods_num_i[j]);
				
				BasketModel basketModel = new BasketModel();
				
				basketModel.setGoods_num(goodsModel.getGoods_num());
				basketModel.setGoods_name(goodsModel.getGoods_name());
				basketModel.setGoods_price(goodsModel.getGoods_price());
				basketModel.setBasket_goods_amount(goods_amount_i[j]);
				basketModel.setBasket_goods_size(goods_size_array[j]);
				
				basketList.add(j, basketModel);
			}
			
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
