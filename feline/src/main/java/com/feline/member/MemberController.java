package com.feline.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.feline.ccr.CancleModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.order.OrderModel;
import com.feline.order.OrderService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Resource
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();

	// �α��� ��
	@RequestMapping(value = "login.cat", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		mav.setViewName("login");
		return mav;
	}

	// �α��ε��� �� ���� ����
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

	// ��й�ȣã��
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

	// ���������� ����
	@RequestMapping("mypage.cat")
	public ModelAndView myPage(HttpSession session) {

		String member_id = (String) session.getAttribute("id");

		MemberModel memberModel = memberService.getMember(member_id);
		List<OrderModel> orderList = memberService.selectNewOrderList(member_id); // �ֱ��ֹ�����10���̾ƿ���
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

	/********************* ȸ�� �ֹ� ������ �κ� **********************/

	// �ֹ������ �̾ƿ��� ����
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

	// �ֹ��󼼺��⸦���� ����
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

	// ȸ������ ����������
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

	// ȸ������ ����.
	@RequestMapping(value = "memberModify.cat", method = RequestMethod.POST)
	public ModelAndView memberModify(@ModelAttribute("memberModel") MemberModel memberModel, HttpSession session) {

		memberModel.setMember_id((String)session.getAttribute("id"));
		memberService.memberModify(memberModel);

		mav.setViewName("/member/memberModifyEnd");
		return mav;
	}

	// �̸��� üũ
	@RequestMapping("member_emailCheck.cat")
	public ModelAndView memberemailCheck(HttpServletRequest request, HttpSession session) {

		String member_email = request.getParameter("member_email");
		String CheckEmail = memberService.emailCheck(member_email);
		
		
		if (member_email.equals(CheckEmail)) {
			mav.addObject("checkNumber", 1); // ���� checkNumber�� 1�̸� �ߺ�
		}else {
			mav.addObject("checkNumber", 0);
		}
		mav.addObject("member_email",member_email);
		mav.setViewName("/member/emailEnd");
		return mav;
	}

	// ȸ������������
	@RequestMapping(value = "memberDelete.cat", method = RequestMethod.GET)
	public ModelAndView memberWith() {
		mav.setViewName("memberDelete");
		return mav;
	}

	// ȸ������ ����
	@RequestMapping(value = "memberDelete.cat", method = RequestMethod.POST)
	public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, HttpSession session,
			HttpServletRequest request) {

		MemberModel memberModel; // ������ ������ ��ü

		String member_id = session.getAttribute("id").toString();
		String member_pw = request.getParameter("member_pw");
		int deleteCheck;

		memberModel = (MemberModel) memberService.getMember(member_id);

		if (memberModel.getMember_pw().equals(member_pw)) {
			// ��й�ȣ�� ������
			deleteCheck = 1;
			// �������� ����
			memberService.memberDelete(member_id);
			session.removeAttribute("member_id");
		} else {
			deleteCheck = -1;
		}
		mav.addObject("deleteCheck", deleteCheck);
		mav.setViewName("/member/deleteResult");
		return mav;
	}
	
	/********************* ȸ�� �ֹ� ��� ��ȯ ȯ�� **********************/
	
	//�ֹ�������
	@RequestMapping(value="orderCancle.cat",method=RequestMethod.GET)
	public ModelAndView orderCancleForm(@RequestParam("order_num")int order_num,
			HttpSession session) { //id�� �޾ƿ������� ����, get������� order_num�ϳ��� ������������ 
		
		String member_id = session.getAttribute("id").toString();
		
		mav.addObject("member_id",member_id); //mav�� member_id��� �̸����� ���ǰ��� �־���
		mav.addObject("order_num",order_num); // order_num�� �޾ƿ°��� ��Ƽ� �Ѱ���
		mav.setViewName("orderCancle"); //orderCancle.jsp
		return mav;
	}
	
	//�ֹ�����ó��
	@RequestMapping(value="orderCancle.cat",method=RequestMethod.POST)
	public ModelAndView orderCancle(HttpServletRequest request,HttpSession session, 
			CancleModel cancleModel,OrderModel orderModel) {
		
		memberService.orderCancle(cancleModel, orderModel);
		 //2���� ������ ���� orderCancle�� insert�� update 2���� �Ѵ� 

		mav.setViewName("orderCancleResult");
		
		return mav;
		
	}
	
	//�ֹ�ȯ�� ��
	@RequestMapping(value="orderRefund.cat", method=RequestMethod.GET)
	public ModelAndView orderRefundForm(@RequestParam("order_num")int order_num,
			HttpSession session) {
		String member_id = session.getAttribute("id").toString();
		
		mav.addObject("member_id",member_id);
		mav.addObject("order_num",order_num);
		mav.setViewName("orderRefund");
		
		return mav;
	}
	
	//���ֹ�ȯ�ҽ�û
	@RequestMapping(value="orderRefund.cat",method=RequestMethod.POST)
	public ModelAndView orderRefund(RefundModel refundModel) {
		
		memberService.clientOrderRefund(refundModel);
		
		mav.setViewName("orderRefundResult");
		
		return mav;
	}
}
