package com.feline.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.feline.basket.BasketModel;
import com.feline.basket.BasketService;
import com.feline.member.MemberModel;
import com.feline.member.MemberService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;

	ModelAndView mav = new ModelAndView();

	private List<BasketModel> basketGoodsCheck = new ArrayList<BasketModel>();
	private List<BasketModel> basketList = new ArrayList<BasketModel>();

	/********************* 주문 부분 **********************/

	/* 주문페이지 */
	@RequestMapping(value = "goodsSettle.cat")
	public ModelAndView goodsSettle(HttpSession session, HttpServletRequest request, BasketModel basketModel,
			@ModelAttribute("memberModel") MemberModel memberModel) {

		// 세션이 없을 경우 새로 생성하지 않음
		String member_id = (String) session.getAttribute("id");

		// 상품번호가 파라미터로 없는 경우(장바구니에서 이동)
		if (request.getParameter("goods_num") == null) {

			basketModel.setMember_id(member_id);

			basketList = orderService.basketList(basketModel);
			memberModel = orderService.getMember(member_id);

			mav.addObject("memberModel", memberModel);
			mav.addObject("basketList", basketList);

			mav.setViewName("goodsSettle");

		}
		// 상품번호가 파라미터로 있는 경우(상품 상세 페이지에서 이동)
		else if (request.getParameter("goods_num") != null) {

			basketModel.setBasket_goods_amount(Integer.parseInt(request.getParameter("basket_goods_amount")));
			basketModel.setBasket_goods_size(request.getParameter("basket_goods_size"));
			basketModel.setMember_id(member_id);
			basketModel.setGoods_num(Integer.parseInt(request.getParameter("goods_num")));
			
			// 장바구니에 해당 상품이 있는지 확인
			basketGoodsCheck = orderService.basketGoodsCheck(basketModel);

			// 장바구니에 해당 상품이 있는 경우
			if (basketGoodsCheck.size() > 0) {

				// 장바구니로 이동할지 여부를 확인시키는 페이지로 이동
				mav.setViewName("/basket/moveToBasket");

			}
			// 장바구니에 해당 상품이 없는 경우
			else if (basketGoodsCheck.size() == 0) {
				
				orderService.insertBasket(basketModel);
				// 장바구니 정보, 회원 정보를 가지고 goodsSettle 페이지로 이동
				basketList = orderService.basketList(basketModel);
				memberModel = orderService.getMember(member_id);

				mav.addObject("memberModel", memberModel);
				mav.addObject("basketList", basketList);

				mav.setViewName("goodsSettle");

			}
		}

		return mav;
	}

	/* 주문처리 */
	@RequestMapping(value = "goodsOrder.cat")
	public ModelAndView goodsOrder(HttpSession session, HttpServletRequest request, @ModelAttribute("basketModel") BasketModel basketModel,
			@ModelAttribute("orderModel") OrderModel orderModel) {

		String member_id = (String) session.getAttribute("id");
		int goods_num = Integer.parseInt(request.getParameter("goods_num"));
		Calendar today = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm");
		String todayS = sdf.format(today.getTime());

		basketModel.setMember_id(member_id);
		basketModel.setGoods_num(goods_num);
		basketList = orderService.basketList(basketModel);

		int count = basketList.size();

		for (int i = 0; i < count; i++) {
			basketModel.setBasket_num(basketList.get(i).getBasket_num());
			orderModel.setOrder_trade_num(todayS + member_id);
			orderModel.setOrder_trans_num("");
			orderModel.setGoods_num(basketList.get(i).getGoods_num());
			orderModel.setOrder_goods_amount(basketList.get(i).getBasket_goods_amount());
			orderModel.setOrder_goods_size(basketList.get(i).getBasket_goods_size());
			orderModel.setOrder_member_id(member_id);
			orderModel.setOrder_receive_name(orderModel.getOrder_receive_name());
			orderModel.setOrder_receive_addr1(orderModel.getOrder_receive_addr1());
			orderModel.setOrder_receive_addr2(orderModel.getOrder_receive_addr2());
			orderModel.setOrder_memo(orderModel.getOrder_memo());
			orderModel.setOrder_date(today.getTime());
			orderModel.setOrder_receive_zipcode(orderModel.getOrder_receive_zipcode());
			orderModel.setOrder_trade_type("무통장입금");
			orderModel.setOrder_trade_date(today.getTime());
			orderModel.setOrder_trade_payer(orderModel.getOrder_trade_payer());

			orderService.goodsOrder(orderModel);
			orderService.basketDelete(basketList.get(i).getBasket_num());
		}

		mav.setViewName("goodsOrderResult");
		return mav;

	}

}
