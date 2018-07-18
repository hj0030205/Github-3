package com.feline.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.order.OrderModel;


@Controller
@RequestMapping("/member")
public class MemberController {
	

	@Resource
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();
	


	// 로그인 폼
	@RequestMapping(value = "login.cat", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		mav.setViewName("login");
		return mav;
	}

	// 로그인동작 및 세션 생성
	@RequestMapping(value = "login.cat", method = RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, @ModelAttribute("memberModel") MemberModel member,
			HttpSession session) {

		String member_id = memberService.memberLogin(member);
		if (member_id != null) {
			session.setAttribute("id", member_id);
			
			mav.setViewName("redirect:/main.cat");
			return mav;
		}
				
		mav.setViewName("loginError");
		return mav;

	}
	
	// 비회원 로그인동작 및 세션 생성
	@RequestMapping(value = "nMemberLogin.cat", method = RequestMethod.POST)
	public ModelAndView bMemberLogin(HttpServletRequest request, HttpSession session) {
		
		if (request.getParameter("member_name") != null) {
			
			String member_name = request.getParameter("member_name");
			String member_phone = request.getParameter("member_phone");
			
			session.setAttribute("n_id", member_name);
			session.setAttribute("n_phone", member_phone);
				
			mav.setViewName("redirect:/main.cat");
			return mav;
		}

		mav.setViewName("loginError");
		return mav;

	}

	@RequestMapping("logout.cat")
	public ModelAndView memberLogout(HttpServletRequest request, @ModelAttribute("memberModel") MemberModel member) {

		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}
		mav.addObject("member", new MemberModel());
		mav.setViewName("/user/logoutCheck");
		return mav;
	}

	@RequestMapping("joinMemberCheck.cat")
	public String memberJoincheckForm() {

		return "joinMemberCheck";
	}

	@RequestMapping("EmailCheck.cat")
	public ModelAndView memberEmailCheck(HttpServletRequest request) {

		String email = request.getParameter("member_email");
		String check_email = memberService.emailCheck(email);
		if (email.equals(check_email)) {
			mav.addObject("checkNum", "0");
		}else {
			mav.addObject("checkNum", "1");
		}

		mav.addObject("member_email",email);
		mav.setViewName("/user/emailPro");
		return mav;

	}

	@RequestMapping("idCheck.cat")
	public ModelAndView memberIdCheck(HttpServletRequest request) {

		String id = request.getParameter("member_id");
		System.out.println(id);
		String check_id = memberService.idCheck(id);

		if (id.equals(check_id)) {
			mav.addObject("checkNum", 1);
		}else {
			mav.addObject("checkNum", 0);
		}
		
		mav.addObject("member_id",id);
		mav.setViewName("/user/loginPro");
		return mav;

	}

	@RequestMapping(value = "joinForm.cat", method = RequestMethod.GET)
	public ModelAndView JoinForm(HttpServletRequest request) {
		
		mav.addObject("member_email", request.getParameter("member_email"));
		mav.setViewName("joinForm");
		return mav;
	}

	@RequestMapping(value = "joinForm.cat", method = RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute("memberModel") MemberModel memberModel, HttpSession session) {

		memberService.insertMember(memberModel);
		
		session.setAttribute("id", memberModel.getMember_id());

		mav.setViewName("redirect:/main.cat");
		return mav;

	}

	@RequestMapping(value="findId.cat", method=RequestMethod.GET)
	public ModelAndView memberFindForm() {
		mav.setViewName("findIdForm");
		return mav;
	}

	@RequestMapping(value="findIdEx.cat")
	public ModelAndView memberIdFind(@ModelAttribute("memberModel") MemberModel memberModel, HttpServletRequest request) {

		int checkNum;
		String member_id = memberService.idFindByName(memberModel);

		if(member_id!=null) {
			checkNum=1;
		}else {
			checkNum=0;
		}
		mav.addObject("checkNum", checkNum);
		mav.addObject("member_id",member_id);
		mav.setViewName("/user/findIdCheck");
		return mav;
	}

	// 비밀번호찾기
	@RequestMapping(value="findPwd.cat", method=RequestMethod.GET)
	public ModelAndView memberPwFindForm() {
		mav.setViewName("findPwdForm");
		return mav;
	}

	@RequestMapping(value="findPwdEx.cat")
	public ModelAndView memberPwFind(@ModelAttribute("memberModel") MemberModel memberModel, HttpServletRequest request) {

		int checkNum;
		
		String member_pw = memberService.pwFindById(memberModel);

		if(member_pw!=null) {
			checkNum=1;
		}else {
			checkNum=0;
		}
		mav.addObject("checkNum", checkNum);
		mav.addObject("member_pw",member_pw);
		mav.setViewName("/user/findPwdCheck");
		return mav;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////
	
	// 마이페이지 띄우기
	@RequestMapping("mypage.cat")
	public ModelAndView myPage(HttpSession session) {

		String member_id = (String) session.getAttribute("id");

		MemberModel memberModel = memberService.getMember(member_id);
		List<OrderModel> orderList = memberService.selectNewOrderList(member_id); // 최근주문정보10개뽑아오기
		List<GoodsModel> goodsModel = new ArrayList<GoodsModel>();
		int totalPrice=0;
		for(int i=0; i<orderList.size(); i++) {
			goodsModel.add(memberService.goodsView(orderList.get(i).getGoods_num())); 
			totalPrice += orderList.get(i).getOrder_goods_amount() * goodsModel.get(i).getGoods_price();
		}
		mav.addObject("totalPrice",totalPrice);
		mav.addObject("memberModel", memberModel);
		mav.addObject("goodsModel",goodsModel);
		mav.addObject("orderList", orderList);
		mav.setViewName("mypage");
		return mav;
	}

	/********************* 회원 주문 페이지 부분 **********************/

	// 주문목록을 뽑아오는 로직(취소는 따로)
	@RequestMapping(value = "orderList.cat")
	public ModelAndView orderList(HttpServletRequest request, HttpSession session) {

		String member_id = (String) session.getAttribute("id");
		System.out.println(member_id);
		List<OrderModel> orderList = memberService.OrderList(member_id);
		List<GoodsModel> goodsList = new ArrayList<GoodsModel>();
		for(int i=0; i<orderList.size(); i++) {
			goodsList.add(memberService.goodsView(orderList.get(i).getGoods_num())); 
		}
		
		mav.addObject("goodsList",goodsList);
		mav.addObject("orderList", orderList);
		mav.setViewName("myOrderList");
		return mav;
	}

	// 주문상세보기를위한 로직
	@RequestMapping(value = "orderView.cat")
	public ModelAndView orderView(HttpServletRequest request, HttpSession session) {

		OrderModel orderModel = new OrderModel();

		int order_num = Integer.parseInt(request.getParameter("order_num"));

		orderModel = memberService.OrdergetOne(order_num);
		GoodsModel goodsModel = memberService.goodsView(orderModel.getGoods_num());

		mav.addObject("goodsModel",goodsModel);
		mav.addObject("orderModel", orderModel);
		mav.setViewName("myOrderView");
		return mav;
	}

	// 회원정보 수정폼으로
	@RequestMapping(value = "memberModify.cat", method = RequestMethod.GET)
	public ModelAndView memberModifyForm(@ModelAttribute("memberModel") MemberModel memberModel, HttpSession session) {

		String member_id = (String) session.getAttribute("id");

		if (member_id != null) {
			memberModel = memberService.getMember(member_id);

			mav.addObject("memberModel", memberModel);
			mav.setViewName("memberModify");
			return mav;
		} else {
			mav.setViewName("login");
			return mav;
		}
	}

	// 회원정보 수정.
	@RequestMapping(value = "memberModify.cat", method = RequestMethod.POST)
	public ModelAndView memberModify(@ModelAttribute("memberModel") MemberModel memberModel, HttpSession session) {

		memberModel.setMember_id((String)session.getAttribute("id"));
		memberService.memberModify(memberModel);

		mav.setViewName("/member/memberModifyEnd");
		return mav;
	}

	// 이메일 체크
	@RequestMapping("member_emailCheck.cat")
	public ModelAndView memberemailCheck(HttpServletRequest request, HttpSession session) {

		String member_email = request.getParameter("member_email");
		String CheckEmail = memberService.emailCheck(member_email);
		
		
		if (member_email.equals(CheckEmail)) {
			mav.addObject("checkNumber", 1); // 만약 checkNumber가 1이면 중복
		}else {
			mav.addObject("checkNumber", 0);
		}
		mav.addObject("member_email",member_email);
		mav.setViewName("/member/emailEnd");
		return mav;
	}

	// 회원정보삭제폼
	@RequestMapping(value = "memberDelete.cat", method = RequestMethod.GET)
	public ModelAndView memberWith() {
		mav.setViewName("memberDelete");
		return mav;
	}

	// 회원정보 삭제
	@RequestMapping(value = "memberDelete.cat", method = RequestMethod.POST)
	public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, HttpSession session,
			HttpServletRequest request) {

		MemberModel memberModel; // 쿼리값 저장할 객체

		String member_id = session.getAttribute("id").toString();
		String member_pw = request.getParameter("member_pw");
		int deleteCheck;

		memberModel = (MemberModel) memberService.getMember(member_id);

		if (memberModel.getMember_pw().equals(member_pw)) {
			// 비밀번호가 맞으면
			deleteCheck = 1;
			// 삭제쿼리 ㄱㄱ
			memberService.memberDelete(member_id);
			session.removeAttribute("member_id");
		} else {
			deleteCheck = -1;
		}
		mav.addObject("deleteCheck", deleteCheck);
		mav.setViewName("/member/deleteResult");
		return mav;
	}
	
	/********************* 회원 주문 취소 교환 환불 **********************/
	
	
	// 주문취소목록만 뽑아오는 로직
	@RequestMapping(value = "orderCancleList.cat")
	public ModelAndView orderCancleList(HttpServletRequest request, HttpSession session) {

		String member_id = (String) session.getAttribute("id").toString();
		System.out.println(member_id);
		List<OrderModel> orderCancleList = memberService.orderCancleList(member_id);
		List<GoodsModel> goodsList = new ArrayList<GoodsModel>();
		
		for(int i=0; i<orderCancleList.size(); i++) {
			goodsList.add(memberService.goodsView(orderCancleList.get(i).getGoods_num())); 
		}
		
		mav.addObject("goodsList",goodsList);
		mav.addObject("orderCancleList", orderCancleList);
		mav.setViewName("orderCancleList");
		return mav;
	}
	
	//주문삭제 상세보기 로직
	@RequestMapping(value="orderCancleView.cat" , method=RequestMethod.GET)
	public ModelAndView orderCancleView(HttpServletRequest request,HttpSession session) {
		
		CancleModel cancleModel = new CancleModel(); //cancleModel이라는 객체생성
		
		int order_num = Integer.parseInt(request.getParameter("order_num")); //get으로 들어온 order_num받아오기

		cancleModel.setMember_id((String)session.getAttribute("id")); //cancleModel에 session의 id를 담는다
		cancleModel.setOrder_num(order_num); //cancleModel에 order_num을담는다.

		cancleModel = memberService.orderCancleOne(cancleModel); //cancleModel에 orderCancleOne을 넣음
		
		mav.addObject("cancleModel", cancleModel);
		mav.setViewName("orderCancleView");
		return mav;
	}


	//주문삭제폼
	@RequestMapping(value="orderCancle.cat",method=RequestMethod.GET)
	public ModelAndView orderCancleForm(@RequestParam("order_num")int order_num,
			HttpSession session) { //id를 받아오기위한 세션, get방식으로 order_num하나만 가져오기위해 
		
		String member_id = session.getAttribute("id").toString();
		
		mav.addObject("member_id",member_id); //mav에 member_id라는 이름으로 세션값을 넣어줌
		mav.addObject("order_num",order_num); // order_num을 받아온것을 담아서 넘겨줌
		mav.setViewName("orderCancle"); //orderCancle.jsp
		return mav;
	}
	
	//주문삭제처리
	@RequestMapping(value="orderCancle.cat",method=RequestMethod.POST)
	public ModelAndView orderCancle(HttpServletRequest request,HttpSession session, 
			CancleModel cancleModel,OrderModel orderModel) {
		
		memberService.orderCancle(cancleModel, orderModel);
		 //2개의 쿼리문 실행 orderCancle은 insert와 update 2개를 한다 

		mav.setViewName("member/orderCancleResult");
		
		return mav;
		
	}
	
	// 주문환불목록만 뽑아오는 로직
	@RequestMapping(value = "orderRefundList.cat")
	public ModelAndView orderRefundList(HttpServletRequest request, HttpSession session) {

		String member_id = (String) session.getAttribute("id").toString();
		System.out.println(member_id);
		List<OrderModel> orderRefundList = memberService.orderRefundList(member_id);
		List<GoodsModel> goodsList = new ArrayList<GoodsModel>();
		
		for(int i=0; i<orderRefundList.size(); i++) {
			goodsList.add(memberService.goodsView(orderRefundList.get(i).getGoods_num())); 
		}
		
		mav.addObject("goodsList",goodsList);
		mav.addObject("orderRefundList", orderRefundList);
		mav.setViewName("orderRefundList");
		return mav;
	}

	//주문 환불 상세보기
	@RequestMapping(value="orderRefundView.cat", method=RequestMethod.GET)
	public ModelAndView orderRefundView(HttpServletRequest request,HttpSession session) {
		
		RefundModel refundModel= new RefundModel();
		
		int order_num = Integer.parseInt(request.getParameter("order_num")); 
		refundModel.setMember_id((String)session.getAttribute("id"));
		refundModel.setOrder_num(order_num);
		
		refundModel = memberService.orderRefundOne(refundModel);
		
		mav.addObject("refundModel",refundModel);
		mav.setViewName("orderRefundView");
		
		return mav;
	}
	
	//주문환불 폼
	@RequestMapping(value="orderRefund.cat", method=RequestMethod.GET)
	public ModelAndView orderRefundForm(@RequestParam("order_num")int order_num,
			HttpSession session) {
		String member_id = session.getAttribute("id").toString();
		
		mav.addObject("member_id",member_id);
		mav.addObject("order_num",order_num);
		mav.setViewName("orderRefund");
		
		return mav;
	}
	
	//고객주문환불신청
	@RequestMapping(value="orderRefund.cat",method=RequestMethod.POST)
	public ModelAndView orderRefund(RefundModel refundModel,OrderModel orderModel) {
		
		memberService.clientOrderRefund(refundModel,orderModel);
		//2개의 쿼리문으로 하나는 RefundModel에 insert , OrderModel의 상태를 바꿔주기 위해 update
		
		mav.setViewName("member/orderRefundResult");
		
		return mav;
	}
	
	//주문교환 폼
	@RequestMapping(value="orderChange.cat",method=RequestMethod.GET)
	public ModelAndView orderChangeForm(@RequestParam("order_num")int order_num,
			HttpSession session) {
		
		String member_id = session.getAttribute("id").toString();
		
		mav.addObject("member_id",member_id);
		mav.addObject("order_num",order_num);
		mav.setViewName("orderChange");
		
		return mav;
	}
	
	//고객주문교환신청
	@RequestMapping(value="orderChange.cat",method=RequestMethod.POST)
	public ModelAndView orderChange(ChangeModel changeModel,OrderModel orderModel) {
		
		memberService.clientOrderChange(changeModel,orderModel);
		//2개의 쿼리문으로 하나는 ChangeModel에 insert , OrderModel의 상태를 바꿔주기 위해 update

		mav.setViewName("member/orderChangeResult");
		
		return mav;
	}
	
	// 주문교환목록만 뽑아오는 로직
	@RequestMapping(value = "orderChangeList.cat")
	public ModelAndView orderChangeList(HttpServletRequest request, HttpSession session) {

		String member_id = (String) session.getAttribute("id").toString();
		System.out.println(member_id);
		List<OrderModel> orderChangeList = memberService.orderChangeList(member_id);
		List<GoodsModel> goodsList = new ArrayList<GoodsModel>();
		
		for(int i=0; i<orderChangeList.size(); i++) {
			goodsList.add(memberService.goodsView(orderChangeList.get(i).getGoods_num())); 
		}
		
		mav.addObject("goodsList",goodsList);
		mav.addObject("orderChangeList", orderChangeList);
		mav.setViewName("orderChangeList");
		return mav;
	}
	
	//주문교환상세보기
	@RequestMapping(value="orderChangeView.cat")
	public ModelAndView orderChangeView(HttpServletRequest request,HttpSession session) {
		
		ChangeModel changeModel= new ChangeModel();
		
		int order_num = Integer.parseInt(request.getParameter("order_num")); 
		
		changeModel.setMember_id((String)session.getAttribute("id"));
		changeModel.setOrder_num(order_num);
		
		changeModel = memberService.orderChangeOne(changeModel);
		
		mav.addObject("changeModel",changeModel);
		mav.setViewName("orderChangeView");
		
		
		return mav;
	}
}
