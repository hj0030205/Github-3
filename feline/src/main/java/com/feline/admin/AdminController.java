package com.feline.admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.feline.event.EventModel;
import com.feline.event.EventService;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.order.OrderModel;
import com.feline.util.FileUpload;
import com.feline.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource
	private AdminService adminService;
	
	@Resource
	private EventService eventService;

	ModelAndView mav = new ModelAndView();

	private int searchNum;
	private String keyword;

	// 페이징을 위한 변수 설정
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	private List<MemberModel> memberList = new ArrayList<MemberModel>();
	private List<GoodsModel> goodsList = new ArrayList<GoodsModel>();
	private List<EventModel> eventList = new ArrayList<EventModel>();

	/*********************** 회원 관리 *************************/

	/* 회원 목록 */
	@RequestMapping(value = "adMemberList.cat")
	public ModelAndView adMemberList(HttpServletRequest request) throws UnsupportedEncodingException {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		keyword = request.getParameter("searchKeyword");

		if (keyword != null && keyword!="") {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			keyword = new String(keyword.getBytes("8859_1"), "UTF-8");

			if (searchNum == 0) { // 이름검색
				memberList = adminService.memberSearchN(keyword);
			} else if (searchNum == 1) { // 아이디 검색
				memberList = adminService.memberSearchI(keyword);
			} else if (searchNum == 2) { // 주소 검색
				memberList = adminService.memberSearchA(keyword);
			} else if (searchNum == 3) { // 전화번호 검색
				memberList = adminService.memberSearchP(keyword);
			} else if (searchNum == 4) { // 이메일 검색
				memberList = adminService.memberSearchE(keyword);
			}

			totalCount = memberList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adMemberList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount) {
				lastCount = page.getEndCount() + 1;
			}

			memberList = memberList.subList(page.getStartCount(), lastCount);

			mav.addObject("searchKeyword", keyword);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("memberList", memberList);

			mav.setViewName("adMemberList");

			return mav;
		}

		memberList = adminService.memberList();

		totalCount = memberList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adMemberList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		memberList = memberList.subList(page.getStartCount(), lastCount);

		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("memberList", memberList);

		mav.setViewName("adMemberList");

		return mav;
	}

	/* 회원 정보 상세보기 */
	@RequestMapping(value = "adMemberView.cat")
	public ModelAndView adMemberView(HttpServletRequest request) {

		String member_id = request.getParameter("member_id");
		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		MemberModel memberModel = adminService.memberSelect(member_id);

		mav.addObject("currentPage", currentPage);
		mav.addObject("memberModel", memberModel);
		mav.setViewName("adMemberView");

		return mav;
	}

	/* 회원 삭제 */
	@RequestMapping(value = "adMemberDelete.cat")
	public ModelAndView adMemberDelete(HttpServletRequest request) {

		String member_id = request.getParameter("member_id");

		adminService.deleteMember(member_id);

		mav.setViewName("redirect:adMemberList.cat");

		return mav;
	}

	/* 회원 정보 수정 폼 */
	@RequestMapping(value = "adMemberModify.cat", method=RequestMethod.GET)
	public ModelAndView adMemberModifyForm(HttpServletRequest request, @ModelAttribute("memberModel") MemberModel memberModel) {

		String member_id = request.getParameter("member_id");
		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		memberModel = adminService.memberSelect(member_id);

		mav.addObject("currentPage", currentPage);
		mav.addObject("memberModel", memberModel);
		mav.setViewName("adMemberModify");

		return mav;
	}

	/* 회원 정보 수정 */
	@RequestMapping(value = "adMemberModify.cat",method=RequestMethod.POST)
	public ModelAndView adMemberModify(@ModelAttribute("memberModel") MemberModel memberModel) {

		adminService.updateMember(memberModel);

		mav.setViewName("redirect:adMemberList.cat");

		return mav;
	}

	/*********************** 상품 관리 *************************/

	// Admin 상품 리스트(검색 처리 포함)
	@RequestMapping(value = "adGoodsList.cat", method = RequestMethod.GET)
	public ModelAndView adGoodsList(HttpServletRequest request) throws UnsupportedEncodingException {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		keyword = request.getParameter("searchKeyword");
		

		List<GoodsModel> adGoodsList = new ArrayList<GoodsModel>();

		if (keyword != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			keyword = new String(keyword.getBytes("8859_1"), "UTF-8");

			if (searchNum == 0)
				adGoodsList = adminService.goodsSearchName(keyword);
			else if (searchNum == 1)
				adGoodsList = adminService.goodsSearchCategory(keyword);

			totalCount = adGoodsList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adGoodsList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			adGoodsList = adGoodsList.subList(page.getStartCount(), lastCount);

			mav.addObject("searchKeyword", keyword);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("goodsList", adGoodsList);
			mav.setViewName("adGoodsList");
			return mav;
		}

		adGoodsList = adminService.goodsList();

		totalCount = adGoodsList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, "", "adGoodsList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		adGoodsList = adGoodsList.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("goodsList", adGoodsList);
		mav.setViewName("adGoodsList");
		return mav;
	}

	// Admin 상품 상세보기
	@RequestMapping("adGoodsView.cat")
	public ModelAndView adGoodsView(HttpServletRequest request) {

		int no = Integer.parseInt(request.getParameter("goods_num"));

		GoodsModel GoodsModel = adminService.goodsView(no);

		mav.addObject("currentPage", currentPage);
		mav.addObject("goodsModel", GoodsModel);
		mav.setViewName("adGoodsView");

		return mav;
	}

	// Admin 상품 글쓰기 폼
	@RequestMapping(value = "adGoodsWrite.cat", method = RequestMethod.GET)
	public ModelAndView adGoodsWriteForm() {

		mav.setViewName("adGoodsWrite");
		return mav;
	}

	// Admin 상품 글쓰기
	@RequestMapping(value = "adGoodsWrite.cat", method = RequestMethod.POST)
	public ModelAndView adGoodsWrite(@ModelAttribute("goodsModel") GoodsModel GoodsModel,
			MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpSession session) throws IOException {

		MultipartFile file = multipartRequest.getFile("file");
		Calendar today = Calendar.getInstance();
		String oldfileName = request.getParameter("oldFile");

		String content = GoodsModel.getGoods_content().replaceAll("\r\n", "<br />");
		GoodsModel.setGoods_content(content);
		GoodsModel.setGoods_date(today.getTime());

		adminService.insertGoods(GoodsModel);

		if (file != null) {
			GoodsModel = fileUploading(file, oldfileName, GoodsModel);
		}

		mav.addObject("goodsModel", GoodsModel);
		mav.setViewName("redirect:adGoodsList.cat");

		return mav;
	}

	// Admin 상품 삭제
	@RequestMapping("adGoodsDelete.cat")
	public ModelAndView adGoodsDelete(HttpServletRequest request) {

		int no = Integer.parseInt(request.getParameter("goods_num"));
		adminService.goodsDelete(no);
		mav.setViewName("redirect:adGoodsList.cat");

		return mav;
	}

	// Admin 상품 수정폼
	@RequestMapping(value = "adGoodsModify.cat", method = RequestMethod.GET)
	public ModelAndView adGoodsModifyForm(@ModelAttribute("goodsModel") GoodsModel GoodsModel, BindingResult result,
			HttpServletRequest request) {

		GoodsModel = adminService.goodsView(GoodsModel.getGoods_num());

		String content = GoodsModel.getGoods_content().replaceAll("<br />", "\r\n");
		GoodsModel.setGoods_content(content);

		mav.addObject("goodsModel", GoodsModel);
		mav.setViewName("adGoodsWrite");

		return mav;
	}

	// Admin 상품 수정
	@RequestMapping(value = "adGoodsModify.cat", method = RequestMethod.POST)
	public ModelAndView adGoodsModify(@ModelAttribute("goodsModel") GoodsModel GoodsModel, HttpServletRequest request,
			MultipartHttpServletRequest multipartRequest) throws IOException {

		MultipartFile file = multipartRequest.getFile("file");
		String oldfileName = request.getParameter("oldFile");

		mav = new ModelAndView("redirect:adGoodsView.cat");

		String content = GoodsModel.getGoods_content().replaceAll("\r\n", "<br />");
		GoodsModel.setGoods_content(content);

		adminService.goodsModify(GoodsModel);
		if (file != null) {
			GoodsModel = fileUploading(file, oldfileName, GoodsModel);
		}

		mav.addObject("goods_num", GoodsModel.getGoods_num());
		return mav;
	}

	// 파일 업로드.
	private GoodsModel fileUploading(MultipartFile file, String oldfileName, GoodsModel GoodsModel) throws IOException {

		String uploadPath = "E:\\workspace-spring-Final2\\feline\\src\\main\\webapp\\resources\\upload\\images";
		String fileRealName = file.getOriginalFilename();
		String fileName;
		int lastNo;
		if (oldfileName == null) {
			lastNo = adminService.goodsLastNum();
			fileName = "feline_adGoods_" + lastNo+"."
					+ fileRealName.substring(fileRealName.lastIndexOf(".") + 1, fileRealName.length());

			FileUpload.fileUpload(file, uploadPath, fileName);

		} else {
			lastNo = GoodsModel.getGoods_num();
			fileName = "file_adGoods_" + lastNo+"."
					+ fileRealName.substring(fileRealName.lastIndexOf(".") + 1, fileRealName.length());

			File deleteFile = new File(uploadPath + oldfileName);
			deleteFile.delete();

			FileUpload.fileUpload(file, uploadPath, fileName);
		}
		GoodsModel.setGoods_num(lastNo);
		GoodsModel.setGoods_image_orgname(fileRealName);
		GoodsModel.setGoods_image_savname(fileName);
		adminService.updateFile(GoodsModel);

		return GoodsModel;

	}

	/*********************** 주문 관리 *************************/

	// 주문 목록
	@RequestMapping("adOrderList.cat")
	public ModelAndView OrderList(HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<OrderModel> orderlist = adminService.orderAllList();

		keyword = request.getParameter("searchKeyword");
		

		if (keyword != null) {
			keyword = new String(keyword.getBytes("8859_1"), "UTF-8");
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 0)
				orderlist = adminService.orderSearchNum(keyword);
			else if (searchNum == 1)
				orderlist = adminService.orderSearchId(keyword);
			else if (searchNum == 2)
				orderlist = adminService.orderSearchP(keyword);

			totalCount = orderlist.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adOrderList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			orderlist = orderlist.subList(page.getStartCount(), lastCount);

			mav.addObject("searchKeyword", keyword);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("orderlist", orderlist);
			mav.setViewName("adOrderList");
			return mav;
		}

		totalCount = orderlist.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, "", "adOrderList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		orderlist = orderlist.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("orderlist", orderlist);
		mav.setViewName("adOrderList");

		return mav;
	}

	// Admin 상품 상세보기
	@RequestMapping("adOrderView.cat")
	public ModelAndView adOrderView(HttpServletRequest request) {

		int order_num = Integer.parseInt(request.getParameter("order_num"));

		OrderModel orderModel = adminService.OrderView(order_num);
		GoodsModel goodsModel = adminService.goodsView(orderModel.getGoods_num());

		mav.addObject("currentPage", currentPage);
		mav.addObject("goodsModel", goodsModel);
		mav.addObject("orderModel", orderModel);
		mav.setViewName("adOrderView");

		return mav;
	}

	// 주문 수정하기 폼
	@RequestMapping(value = "adOrderModify.cat", method = RequestMethod.GET)
	public ModelAndView orderModifyForm(HttpServletRequest request) {
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		
		OrderModel orderModel = adminService.OrderView(order_num);
		GoodsModel goodsModel = adminService.goodsView(orderModel.getGoods_num());
		
		mav.addObject("orderModel",orderModel);
		mav.addObject("goodsModel",goodsModel);
		mav.setViewName("adOrderModify");

		return mav;
	}

	// 주문수정
	@RequestMapping(value = "adOrderModify.cat", method = RequestMethod.POST)
	public ModelAndView orderModify(@ModelAttribute("orderModel") OrderModel orderModel, HttpServletRequest request) {

		adminService.orderModify(orderModel);

		mav.setViewName("redirect:adOrderList.cat");
		mav.addObject("currentPage",request.getParameter("currentPage"));
		return mav;
	}
	
	/*********************** 이벤트 관리 *************************/
	
	//이벤트 리스트
	@RequestMapping(value="adEventList.cat")
	public ModelAndView eventList(HttpServletRequest request) {
		
		eventList = eventService.eventList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		keyword = request.getParameter("searchKeyword");
		
		totalCount = eventList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adMemberList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
			if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
			eventList = eventList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("eventList", eventList);
		mav.setViewName("adEventList");
		
		return mav;
			
		}
		
	//이벤트 추가 폼의 상품 리스트
	@RequestMapping(value="eventGoodsList.cat")
	public ModelAndView eventGoodsList(HttpServletRequest request) {
		
		if(request.getParameter("goods_category") != null) {
			int goods_category = Integer.parseInt(request.getParameter("goods_category"));
			goodsList = eventService.goodsList(goods_category);
			
			mav.addObject("goodsList", goodsList);
		}
		
		mav.setViewName("addEvent");
		
		return mav;
	}

}
