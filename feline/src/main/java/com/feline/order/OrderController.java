package com.feline.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.feline.basket.BasketModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.member.MemberService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private MemberService memberService;


	ModelAndView mav = new ModelAndView();

	private List<BasketModel> basketGoodsCheck = new ArrayList<BasketModel>();
	private List<BasketModel> basketList = new ArrayList<BasketModel>();
	
	private Logger logger = Logger.getLogger(getClass());

	/********************* 주문 부분 
	 * @throws IOException **********************/

	/* 주문페이지 */
	@RequestMapping(value = "goodsSettle.cat")
	public ModelAndView goodsSettle(HttpSession session, HttpServletRequest request, HttpServletResponse response, BasketModel basketModel,
			@ModelAttribute("memberModel") MemberModel memberModel) throws IOException {

		// 세션이 없을 경우 새로 생성하지 않음
		String member_id = (String) session.getAttribute("id");

		String n_id = (String) session.getAttribute("n_id");
		
		if(member_id == null && n_id == null) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요합니다.');</script>");
			out.flush();
			
			mav.setViewName("login");
			
		} else if(member_id != null || n_id != null){
	
			// 상품번호가 파라미터로 없는 경우(장바구니에서 이동)
			if (request.getParameter("goods_num") == null) {
				
				//회원인 경우
				if(member_id != null && member_id != "") {
					
					basketModel.setMember_id(member_id);
	
					basketList = orderService.basketList(basketModel);
					memberModel = orderService.getMember(member_id);
	
					mav.addObject("memberModel", memberModel);
					mav.addObject("basketList", basketList);
	
					mav.setViewName("goodsSettle");
					
				} else if(n_id != null && n_id != "") { //비회원인 경우
					
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
						
					//쌓임 방지
					basketList.clear();
						
					//basketList에 basketModel 삽입
					for(int j = 0; j < size; j++) {
						GoodsModel goodsModel = new GoodsModel();
						goodsModel = orderService.selectGoods(goods_num_i[j]);
						
						BasketModel basketModel1 = new BasketModel();
						
						basketModel1.setBasket_num(j);
						basketModel1.setGoods_num(goodsModel.getGoods_num());
						basketModel1.setGoods_name(goodsModel.getGoods_name());
						basketModel1.setGoods_price(goodsModel.getGoods_price());
						basketModel1.setBasket_goods_amount(goods_amount_i[j]);
						basketModel1.setBasket_goods_size(goods_size_array[j]);
							
						basketList.add(j, basketModel1);
					}
					
					memberModel.setMember_name(n_id);
					memberModel.setMember_phone((String)session.getAttribute("n_phone"));
					
					mav.addObject("memberModel", memberModel);
					mav.addObject("basketList", basketList);
					
					mav.setViewName("goodsSettle");
					
				}
	
	
			}
			// 상품번호가 파라미터로 있는 경우(상품 상세 페이지에서 이동)
			else if (request.getParameter("goods_num") != null) {
				
				//회원인 경우
				if(member_id != null && member_id != "") {
		
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
						basketList = orderService.orderBasketModel(basketModel);
						memberModel = orderService.getMember(member_id);
		
						mav.addObject("memberModel", memberModel);
						mav.addObject("basketList", basketList);
		
						mav.setViewName("goodsSettle");
		
					}
				} else if(n_id != null && n_id != "") { //비회원인 경우

					//세션에 해당 물품이 있는지 검사
					String goods_num_s = (String) session.getAttribute("goods_num_s");
					
					if(goods_num_s != null && goods_num_s!="") {
						
						String[] goods_num_array = goods_num_s.split(",");
						
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
							
							int goods_num_s1 = Integer.parseInt(request.getParameter("goods_num"));
							String goods_size_s = request.getParameter("basket_goods_size");
							int goods_amount_s = Integer.parseInt(request.getParameter("basket_goods_amount"));
							
							//쌓임 방지
							List<BasketModel> basketList1 = new ArrayList<BasketModel>();
							
							GoodsModel goodsModel = new GoodsModel();
							goodsModel = orderService.selectGoods(goods_num_s1);
							
							BasketModel basketModel1 = new BasketModel();
							
							basketModel1.setBasket_num(0);
							basketModel1.setGoods_num(goodsModel.getGoods_num());
							basketModel1.setGoods_name(goodsModel.getGoods_name());
							basketModel1.setGoods_price(goodsModel.getGoods_price());
							basketModel1.setBasket_goods_amount(goods_amount_s);
							basketModel1.setBasket_goods_size(goods_size_s);
								
							basketList1.add(basketModel1);
							
							memberModel.setMember_name(n_id);
							memberModel.setMember_phone((String)session.getAttribute("n_phone"));
							
							mav.addObject("memberModel", memberModel);
							mav.addObject("basketList", basketList1);
							
							mav.setViewName("goodsSettle");
							
						}
					} else {
						
						int goods_num_s1 = Integer.parseInt(request.getParameter("goods_num"));
						String goods_size_s = request.getParameter("basket_goods_size");
						int goods_amount_s = Integer.parseInt(request.getParameter("basket_goods_amount"));
						
						//쌓임 방지
						List<BasketModel> basketList1 = new ArrayList<BasketModel>();
						
						GoodsModel goodsModel = new GoodsModel();
						goodsModel = orderService.selectGoods(goods_num_s1);
						
						BasketModel basketModel1 = new BasketModel();
						
						basketModel1.setBasket_num(0);
						basketModel1.setGoods_num(goodsModel.getGoods_num());
						basketModel1.setGoods_name(goodsModel.getGoods_name());
						basketModel1.setGoods_price(goodsModel.getGoods_price());
						basketModel1.setBasket_goods_amount(goods_amount_s);
						basketModel1.setBasket_goods_size(goods_size_s);
							
						basketList1.add(basketModel1);
						
						memberModel.setMember_name(n_id);
						memberModel.setMember_phone((String)session.getAttribute("n_phone"));
						
						mav.addObject("memberModel", memberModel);
						mav.addObject("basketList", basketList1);
						
						mav.setViewName("goodsSettle");
						
					}
				}
			}
		}
		
		return mav;
	}

	
	/* 주문처리 */
	@RequestMapping(value = "goodsOrder.cat")
	public ModelAndView goodsOrder(HttpSession session, HttpServletRequest request, @ModelAttribute("basketModel") BasketModel basketModel,
			@ModelAttribute("orderModel") OrderModel orderModel) {

		String member_id = (String) session.getAttribute("id");
		String n_id = (String) session.getAttribute("n_id");
		
		Calendar today = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String todayS = sdf.format(today.getTime());
		
		//회원인 경우
		if(member_id != null && member_id != "") {
			
			if(request.getParameter("goods_num") == null) {
				
				basketModel.setMember_id(member_id);
				basketList = orderService.basketList(basketModel);
				
			} else if(request.getParameter("goods_num") != null) {
				
				int goods_num = Integer.parseInt(request.getParameter("goods_num"));
				basketModel.setMember_id(member_id);
				basketModel.setGoods_num(goods_num);
				basketList = orderService.orderBasketModel(basketModel);
				
			}
			
		} else if(n_id != null && n_id != "") {
			
			if(request.getParameter("goods_num") == null) {
				
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
					
				//쌓임 방지
				basketList.clear();
					
				//basketList에 basketModel 삽입
				for(int j = 0; j < size; j++) {
					GoodsModel goodsModel = new GoodsModel();
					goodsModel = orderService.selectGoods(goods_num_i[j]);
					
					BasketModel basketModel1 = new BasketModel();
					
					basketModel1.setBasket_num(j);
					basketModel1.setGoods_num(goodsModel.getGoods_num());
					basketModel1.setGoods_name(goodsModel.getGoods_name());
					basketModel1.setGoods_price(goodsModel.getGoods_price());
					basketModel1.setBasket_goods_amount(goods_amount_i[j]);
					basketModel1.setBasket_goods_size(goods_size_array[j]);
						
					basketList.add(j, basketModel1);
				}
				
			} else if(request.getParameter("goods_num") != null) {
				
				int goods_num_s = Integer.parseInt(request.getParameter("goods_num"));
				String goods_size_s = request.getParameter("basket_goods_size");
				int goods_amount_s = Integer.parseInt(request.getParameter("basket_goods_amount"));
				
				//쌓임 방지
				basketList.clear();
				
				GoodsModel goodsModel = new GoodsModel();
				goodsModel = orderService.selectGoods(goods_num_s);
				
				BasketModel basketModel1 = new BasketModel();
				
				basketModel1.setBasket_num(0);
				basketModel1.setGoods_num(goodsModel.getGoods_num());
				basketModel1.setGoods_name(goodsModel.getGoods_name());
				basketModel1.setGoods_price(goodsModel.getGoods_price());
				basketModel1.setBasket_goods_amount(goods_amount_s);
				basketModel1.setBasket_goods_size(goods_size_s);
					
				basketList.add(basketModel1);
				
			}
			
		}

		int count = basketList.size();

		for (int i = 0; i < count; i++) {
			basketModel.setBasket_num(basketList.get(i).getBasket_num());
			if(member_id != null && member_id != "") {
				orderModel.setOrder_trade_num(todayS + member_id);
			} else if(n_id != null && n_id != "") {
				orderModel.setOrder_trade_num(todayS + n_id);
			}
			orderModel.setOrder_trans_num("");
			orderModel.setGoods_num(basketList.get(i).getGoods_num());
			orderModel.setOrder_goods_amount(basketList.get(i).getBasket_goods_amount());
			orderModel.setOrder_goods_size(basketList.get(i).getBasket_goods_size());
			
			if(member_id != null && member_id != "") {
				orderModel.setOrder_member_id(member_id);
			} else if(n_id != null && n_id != "") {
				orderModel.setOrder_member_id(n_id);
			}
			orderModel.setOrder_receive_name(orderModel.getOrder_receive_name());
			orderModel.setOrder_receive_addr1(orderModel.getOrder_receive_addr1());
			orderModel.setOrder_receive_addr2(orderModel.getOrder_receive_addr2());
			orderModel.setOrder_memo(orderModel.getOrder_memo());
			orderModel.setOrder_date(today.getTime());
			orderModel.setOrder_receive_zipcode(orderModel.getOrder_receive_zipcode());
			orderModel.setOrder_trade_type(orderModel.getOrder_trade_type());
			orderModel.setOrder_trade_date(today.getTime());
			orderModel.setOrder_trade_payer(orderModel.getOrder_trade_payer());

			orderService.goodsOrder(orderModel);
			
			if(member_id != null && member_id != "") {
				orderService.basketDelete(basketList.get(i).getBasket_num());
			} else if(n_id != null && n_id != "") {
				
				if(request.getParameter("goods_num") == null) {
					
					session.removeAttribute("goods_num_s");
					session.removeAttribute("goods_size_s");
					session.removeAttribute("goods_amount_s");
					
				} else if(request.getParameter("goods_num") != null) {
					
					basketList.clear();
					
				}
			}
		}
		
		
		OrderModel orderModel2 = new OrderModel();
		
		if(member_id != null && member_id != "") {
			
		orderModel2 = orderService.selectNewestOrder(member_id);
		
		} else if(n_id != null && n_id != "") {
		orderModel2 = orderService.selectNewestOrder(n_id);
		}
		
		mav.addObject("orderModel", orderModel2);
		mav.setViewName("goodsOrderResult");
		
		return mav;

	}
	
	
	//무통장일때 처리해주는 페이지
	@RequestMapping(value="/noBank.cat",method=RequestMethod.POST)
	public ModelAndView noBack(OrderModel orderModel,BasketModel basketModel,HttpSession session,
			HttpServletRequest request) {
		
		String member_id = (String) session.getAttribute("id");
		String n_id = (String) session.getAttribute("n_id");
		
		Calendar today = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		String todayS = sdf.format(today.getTime());
		
		//ȸ���� ���
		if(member_id != null && member_id != "") {
			
			if(request.getParameter("goods_num") == null) {
				
				basketModel.setMember_id(member_id);
				basketList = orderService.basketList(basketModel);
				
			} else if(request.getParameter("goods_num") != null) {
				
				int goods_num = Integer.parseInt(request.getParameter("goods_num"));
				basketModel.setMember_id(member_id);
				basketModel.setGoods_num(goods_num);
				basketList = orderService.orderBasketModel(basketModel);
				
			}
			
		} else if(n_id != null && n_id != "") {
			
			if(request.getParameter("goods_num") == null) {
				
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
					
				//���� ����
				basketList.clear();
					
				//basketList�� basketModel ����
				for(int j = 0; j < size; j++) {
					GoodsModel goodsModel = new GoodsModel();
					goodsModel = orderService.selectGoods(goods_num_i[j]);
					
					BasketModel basketModel1 = new BasketModel();
					
					basketModel1.setBasket_num(j);
					basketModel1.setGoods_num(goodsModel.getGoods_num());
					basketModel1.setGoods_name(goodsModel.getGoods_name());
					basketModel1.setGoods_price(goodsModel.getGoods_price());
					basketModel1.setBasket_goods_amount(goods_amount_i[j]);
					basketModel1.setBasket_goods_size(goods_size_array[j]);
						
					basketList.add(j, basketModel1);
				}
				
			} else if(request.getParameter("goods_num") != null) {
				
				int goods_num_s = Integer.parseInt(request.getParameter("goods_num"));
				String goods_size_s = request.getParameter("basket_goods_size");
				int goods_amount_s = Integer.parseInt(request.getParameter("basket_goods_amount"));
				
				//���� ����
				basketList.clear();
				
				GoodsModel goodsModel = new GoodsModel();
				goodsModel = orderService.selectGoods(goods_num_s);
				
				BasketModel basketModel1 = new BasketModel();
				
				basketModel1.setBasket_num(0);
				basketModel1.setGoods_num(goodsModel.getGoods_num());
				basketModel1.setGoods_name(goodsModel.getGoods_name());
				basketModel1.setGoods_price(goodsModel.getGoods_price());
				basketModel1.setBasket_goods_amount(goods_amount_s);
				basketModel1.setBasket_goods_size(goods_size_s);
					
				basketList.add(basketModel1);
				
			}
			
		}

		int count = basketList.size();

		for (int i = 0; i < count; i++) {
			basketModel.setBasket_num(basketList.get(i).getBasket_num());
			if(member_id != null && member_id != "") {
				orderModel.setOrder_trade_num(todayS + member_id);
			} else if(n_id != null && n_id != "") {
				orderModel.setOrder_trade_num(todayS + n_id);
			}
			orderModel.setOrder_trans_num("");
			orderModel.setGoods_num(basketList.get(i).getGoods_num());
			orderModel.setOrder_goods_amount(basketList.get(i).getBasket_goods_amount());
			orderModel.setOrder_goods_size(basketList.get(i).getBasket_goods_size());
			
			if(member_id != null && member_id != "") {
				orderModel.setOrder_member_id(member_id);
			} else if(n_id != null && n_id != "") {
				orderModel.setOrder_member_id(n_id);
			}
			orderModel.setOrder_receive_name(orderModel.getOrder_receive_name());
			orderModel.setOrder_receive_addr1(orderModel.getOrder_receive_addr1());
			orderModel.setOrder_receive_addr2(orderModel.getOrder_receive_addr2());
			orderModel.setOrder_memo(orderModel.getOrder_memo());
			orderModel.setOrder_date(today.getTime());
			orderModel.setOrder_receive_zipcode(orderModel.getOrder_receive_zipcode());
			orderModel.setOrder_trade_type(orderModel.getOrder_trade_type());
			orderModel.setOrder_trade_date(today.getTime());
			orderModel.setOrder_trade_payer(orderModel.getOrder_trade_payer());

			orderService.goodsOrder(orderModel);
			
			if(member_id != null && member_id != "") {
				orderService.basketDelete(basketList.get(i).getBasket_num());
			} else if(n_id != null && n_id != "") {
				
				if(request.getParameter("goods_num") == null) {
					
					session.removeAttribute("goods_num_s");
					session.removeAttribute("goods_size_s");
					session.removeAttribute("goods_amount_s");
					
				} else if(request.getParameter("goods_num") != null) {
					
					basketList.clear();
					
				}
			}
		}
		
		
		OrderModel orderModel2 = new OrderModel();
		
		if(member_id != null && member_id != "") {
			
		orderModel2 = orderService.selectNewestOrder(member_id);
		
		} else if(n_id != null && n_id != "") {
		orderModel2 = orderService.selectNewestOrder(n_id);
		}
		
		mav.addObject("orderModel", orderModel2);
		mav.setViewName("noBank");
		
		return mav;
	}

}
