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
			
			
			if((String)session.getAttribute("goods_num_s") != null) {
				
				//세션에 해당 물품이 있는지 검사
				String goods_num = (String) session.getAttribute("goods_num_s");
				String[] goods_num_array = goods_num.split(",");
				
				String goods_numst = request.getParameter("goods_num");
				
				List<String> list = new ArrayList<String>();
				
				for(int i = 0; i < goods_num_array.length; i++) {
					list.add(i, goods_num_array[i]);
				}
				
				if (list.contains(goods_numst) == true) {
					
					//세션에 상품이 있으면 바스켓으로 이동
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>var moveToBasket = confirm('동일 상품이 장바구니에 존재합니다. \\n장바구니로 이동하시겠습니까?');\r\n" + 
							"	if(moveToBasket == true) {\r\n" + 
							"		location.href='/feline/basket/basketList.cat';\r\n" + 
							"	} else {\r\n" + 
							"		location.href='javascript:history.back()';\r\n" + 
							"	}</script>");
					out.flush();
					
				} else {

					//아니라면 세션 세팅
					goods_num_s = request.getParameter("goods_num") + "," + (String)session.getAttribute("goods_num_s");
					goods_size_s = request.getParameter("basket_goods_size") + "," + (String)session.getAttribute("goods_size_s");
					goods_amount_s =  request.getParameter("basket_goods_amount") + "," + (String)session.getAttribute("goods_amount_s");
					
					session.setAttribute("goods_num_s", goods_num_s);
					session.setAttribute("goods_size_s", goods_size_s);
					session.setAttribute("goods_amount_s", goods_amount_s);
					
					mav.setViewName("redirect:basketList.cat");
					
				}
				
				
			} else if((String)session.getAttribute("goods_num") == null) {
				
				goods_num_s = request.getParameter("goods_num");
				goods_size_s = request.getParameter("basket_goods_size");
				goods_amount_s = request.getParameter("basket_goods_amount");
				
				session.setAttribute("goods_num_s", goods_num_s);
				session.setAttribute("goods_size_s", goods_size_s);
				session.setAttribute("goods_amount_s", goods_amount_s);
				
				mav.setViewName("redirect:basketList.cat");
				
			}
			
		}

		return mav;
	}
	
	/*장바구니 리스트*/
	@RequestMapping(value="basketList.cat")
	public ModelAndView basketList(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String member_id = (String)session.getAttribute("id");
		String n_id = (String) session.getAttribute("n_id");

		if(member_id == null && n_id == null) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요합니다.');</script>");
			out.flush();
			
			mav.setViewName("login");
			
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
			
			if(goods_num_s != null && goods_num_s != "") {
				
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
				
				//쌓임 방지
				basketList.clear();
				
				//basketList에 basketModel 삽입
				for(int j = 0; j < size; j++) {
					GoodsModel goodsModel = new GoodsModel();
					goodsModel = basketService.selectGoods(goods_num_i[j]);
					
					BasketModel basketModel = new BasketModel();
					
					basketModel.setBasket_num(j);
					basketModel.setGoods_num(goodsModel.getGoods_num());
					basketModel.setGoods_name(goodsModel.getGoods_name());
					basketModel.setGoods_price(goodsModel.getGoods_price());
					basketModel.setBasket_goods_amount(goods_amount_i[j]);
					basketModel.setBasket_goods_size(goods_size_array[j]);
					
					basketList.add(j, basketModel);
				}
				
				mav.addObject("basketList", basketList);
				
			} else{
				
				basketList.clear();
				
				mav.addObject("basketList", basketList);
				
			}
			
			mav.setViewName("basketList");

		}
		
		return mav;
		
		
	}
	
	/*장바구니 수량변경*/ 
	@RequestMapping(value="updateAmount.cat")
	public ModelAndView updateAmount(@ModelAttribute("basketModel") BasketModel basketModel, HttpServletRequest request, HttpSession session) {
		
		String member_id = (String)session.getAttribute("id");
		String n_id = (String) session.getAttribute("n_id");
		
		if(request.getParameter("goods_amount") != null && request.getParameter("basket_num") != null) {
			
			if(member_id != null && member_id != "") {
				
				int basket_num = Integer.parseInt(request.getParameter("basket_num"));
				int basket_goods_amount = Integer.parseInt(request.getParameter("goods_amount"));
				
				basketModel.setBasket_num(basket_num);
				basketModel.setBasket_goods_amount(basket_goods_amount);
				
				basketService.updateAmount(basketModel);
				
			} else if (n_id != null && n_id != "") {
				
				int basket_num = Integer.parseInt(request.getParameter("basket_num"));
				String basket_goods_amount = request.getParameter("goods_amount");
				
				String goods_amount_s = (String) session.getAttribute("goods_amount_s");
				String goods_amount_s2 = "";
				
				String[] goods_amount_array = goods_amount_s.split(",");
				
				int size = goods_amount_array.length;
				
				List<String> list = new ArrayList<String>();
				
				for(int i = 0 ; i < size ; i++) {
					list.add(i, goods_amount_array[i]);
				}
				
				list.set(basket_num, basket_goods_amount);
				
				for(int i = 0; i < list.size(); i++) {
					goods_amount_s2 += list.get(i) + ",";
				}
				
				goods_amount_s2.substring(0, goods_amount_s2.length()-1);
				
				session.setAttribute("goods_amount_s", goods_amount_s2);
				
			}

		}
		
		mav.setViewName("redirect:basketList.cat");
		
		return mav;
	}
	
	/*장바구니 삭제*/
	@RequestMapping(value="basketDelete.cat")
	public ModelAndView basketDelete(@ModelAttribute("basketModel") BasketModel basketModel, HttpServletRequest request, HttpSession session) {
		
		String member_id = (String)session.getAttribute("id");
		String n_id = (String) session.getAttribute("n_id");
		
		if(member_id != null && member_id != "") {
		
			basketService.basketDelete(basketModel.getBasket_num());
			mav.setViewName("redirect:basketList.cat");
			
		} else if(n_id != null && n_id != "") {
			
			String goods_num_s = (String) session.getAttribute("goods_num_s");
			String goods_size_s = (String) session.getAttribute("goods_size_s");
			String goods_amount_s = (String) session.getAttribute("goods_amount_s");
			
			String goods_num_s2 = "";
			String goods_size_s2 = "";
			String goods_amount_s2 = "";
			
			String[] goods_num_array = goods_num_s.split(",");
			String[] goods_size_array = goods_size_s.split(",");
			String[] goods_amount_array = goods_amount_s.split(",");
			
			int basket_num = Integer.parseInt(request.getParameter("basket_num"));
			
			
			if(goods_num_array.length == 1) {
				
				session.removeAttribute("goods_num_s");
				session.removeAttribute("goods_size_s");
				session.removeAttribute("goods_amount_s");
				
			} else if(goods_num_array.length == 2) {
				
				List<String> list_goods_num = new ArrayList<String>();
				List<String> list_goods_size = new ArrayList<String>();
				List<String> list_goods_amount = new ArrayList<String>();
				
				for(int i = 0 ; i < goods_num_array.length ; i++) {
					list_goods_num.add(i, goods_num_array[i]);
					list_goods_size.add(i, goods_size_array[i]);
					list_goods_amount.add(i, goods_amount_array[i]);
				}
				
				list_goods_num.remove(basket_num);
				list_goods_size.remove(basket_num);
				list_goods_amount.remove(basket_num);
				
				goods_num_s2 = list_goods_num.get(0);
				goods_size_s2 = list_goods_size.get(0);
				goods_amount_s2 = list_goods_amount.get(0);
				
				session.setAttribute("goods_num_s", goods_num_s2);
				session.setAttribute("goods_size_s", goods_size_s2);
				session.setAttribute("goods_amount_s", goods_amount_s2);
				
			} else if(goods_num_array.length > 2) {
				
				List<String> list_goods_num = new ArrayList<String>();
				List<String> list_goods_size = new ArrayList<String>();
				List<String> list_goods_amount = new ArrayList<String>();
				
				for(int i = 0 ; i < goods_num_array.length ; i++) {
					list_goods_num.add(i, goods_num_array[i]);
					list_goods_size.add(i, goods_size_array[i]);
					list_goods_amount.add(i, goods_amount_array[i]);
				}
				
				list_goods_num.remove(basket_num);
				list_goods_size.remove(basket_num);
				list_goods_amount.remove(basket_num);

				for(int i = 0; i < list_goods_num.size(); i++) {
					goods_num_s2 += list_goods_num.get(i) + ",";
					goods_size_s2 += list_goods_size.get(i) + ",";
					goods_amount_s2 += list_goods_amount.get(i) + ",";
				}
				
				goods_num_s2.substring(0, goods_num_s2.length()-1);
				goods_size_s2.substring(0, goods_size_s2.length()-1);
				goods_amount_s2.substring(0, goods_amount_s2.length()-1);
				
				
				session.setAttribute("goods_num_s", goods_num_s2);
				session.setAttribute("goods_size_s", goods_size_s2);
				session.setAttribute("goods_amount_s", goods_amount_s2);
				
			}
			
			mav.setViewName("redirect:basketList.cat");
			
		}
		
		return mav;
	}

}
