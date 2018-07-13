package com.feline.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.event.EventModel;
import com.feline.event.EventService;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.member.MemberService;
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

	private Logger logger = Logger.getLogger(getClass());

	@RequestMapping("main.cat") // 관리자 페이지
	public ModelAndView adMain() throws Exception {
		
	/*	int countTrade = adminService.countTrade();
		int countTrans = adminService.countTrans();
		int countTrans2 = adminService.countTrans2();
		int todayMember = adminService.todayMember();
		int todayOrder = adminService.todayOrder();
		int todaySalesM = adminService.todaySalesM();
		
		List<BooksModel> todaySalesBook = adminService.todaySalesBook();
		
		List<ChartModel> todayMemberGender = adminService.todayMemberGender();
		GoogleChartDTO pie1 = new GoogleChartDTO();

		pie1.addColumn("성별", "string");
		pie1.addColumn("number", "number");
		pie1.createRows(todayMemberGender.size());

		for (int i = 0; i < todayMemberGender.size(); i++) {
			pie1.addCell(i, Integer.parseInt(todayMemberGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie1.addCell(i, todayMemberGender.get(i).getValue());
		}
		String memberGenderPie = gson.toJson(pie1.getResult());
		System.out.println("//////////////////////////////////////////"+memberGenderPie);
		mv.addObject("memberGenderPie", memberGenderPie);
		
		
		List<ChartModel> todayMemberAge = adminService.todayMemberAge();
		GoogleChartDTO pie2 = new GoogleChartDTO();

		pie2.addColumn("연령대", "string");
		pie2.addColumn("number", "number");
		pie2.createRows(todayMemberAge.size());

		for (int i = 0; i < todayMemberAge.size(); i++) {
			pie2.addCell(i, todayMemberAge.get(i).getKey() + "0 년대");
			pie2.addCell(i, todayMemberAge.get(i).getValue());
		}
		String memberAgePie = gson.toJson(pie2.getResult());
		System.out.println("//////////////////////////////////////////"+memberAgePie);
		mv.addObject("memberAgePie", memberAgePie);
		
		
		List<ChartModel> todayMemberRegion = adminService.todayMemberRegion();
		GoogleChartDTO pie3 = new GoogleChartDTO();

		pie3.addColumn("지역", "string");
		pie3.addColumn("number", "number");
		pie3.createRows(todayMemberRegion.size());

		for (int i = 0; i < todayMemberRegion.size(); i++) {
			pie3.addCell(i, todayMemberRegion.get(i).getKey());
			pie3.addCell(i, todayMemberRegion.get(i).getValue());
		}
		String memberRegionPie = gson.toJson(pie3.getResult());
		System.out.println("//////////////////////////////////////////"+memberRegionPie);
		mv.addObject("memberRegionPie", memberRegionPie);
		
		
		List<ChartModel> todayOrderGender = adminService.todayOrderGender();
		GoogleChartDTO pie4 = new GoogleChartDTO();

		pie4.addColumn("성별", "string");
		pie4.addColumn("number", "number");
		pie4.createRows(todayOrderGender.size());

		for (int i = 0; i < todayOrderGender.size(); i++) {
			pie4.addCell(i, Integer.parseInt(todayOrderGender.get(i).getKey()) == 1 ? "남자" : "여자");
			pie4.addCell(i, todayOrderGender.get(i).getValue());
		}
		String orderGenderPie = gson.toJson(pie4.getResult());
		System.out.println("//////////////////////////////////////////"+orderGenderPie);
		mv.addObject("orderGenderPie", orderGenderPie);
		
		
		List<ChartModel> todayOrderAge = adminService.todayOrderAge();
		GoogleChartDTO pie5 = new GoogleChartDTO();

		pie5.addColumn("연령대", "string");
		pie5.addColumn("number", "number");
		pie5.createRows(todayOrderAge.size());

		for (int i = 0; i < todayOrderAge.size(); i++) {
			pie5.addCell(i, todayOrderAge.get(i).getKey() + "0 년대");
			pie5.addCell(i, todayOrderAge.get(i).getValue());
		}
		String orderAgePie = gson.toJson(pie5.getResult());
		System.out.println("//////////////////////////////////////////"+orderAgePie);
		mv.addObject("orderAgePie", orderAgePie);
		
		
		List<ChartModel> todayOrderRegion = adminService.todayOrderRegion();
		GoogleChartDTO pie6 = new GoogleChartDTO();

		pie6.addColumn("지역", "string");
		pie6.addColumn("number", "number");
		pie6.createRows(todayOrderRegion.size());

		for (int i = 0; i < todayOrderRegion.size(); i++) {
			pie6.addCell(i, todayOrderRegion.get(i).getKey());
			pie6.addCell(i, todayOrderRegion.get(i).getValue());
		}
		String orderRegionPie = gson.toJson(pie6.getResult());
		System.out.println("//////////////////////////////////////////"+orderRegionPie);
		mv.addObject("orderRegionPie", orderRegionPie);
		
		
		mv.addObject("countTrade", countTrade);
		mv.addObject("countTrans", countTrans);
		mv.addObject("countTrans2", countTrans2);
		mv.addObject("todayMember", todayMember);
		mv.addObject("todayOrder", todayOrder);
		mv.addObject("todaySalesM", todaySalesM);
		mv.addObject("todaySalesBook", todaySalesBook);
		mv.addObject("todayBookC", todaySalesBook.size());
		*/
		mav.setViewName("admin");
		return mav;
	}
	
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
	@RequestMapping(value = "adGoodsList.cat")
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

			if (searchNum == 0)
				adGoodsList = adminService.goodsSearchName(keyword);
			else if (searchNum == 1)
				adGoodsList = adminService.goodsSearchCategory(keyword);

			totalCount = adGoodsList.size();
			System.out.println(totalCount);
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

		mav.addObject("goodsModel", new GoodsModel());
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
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		adminService.goodsDelete(no);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:adGoodsList.cat");

		return mav;
	}

	// Admin 상품 수정폼
	@RequestMapping(value = "adGoodsModify.cat", method = RequestMethod.GET)
	public ModelAndView adGoodsModifyForm(GoodsModel GoodsModel, BindingResult result,
			HttpServletRequest request) {
		int goods_num= Integer.parseInt(request.getParameter("goods_num"));
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
		GoodsModel = adminService.goodsView(goods_num);

		String content = GoodsModel.getGoods_content().replaceAll("<br />", "\r\n");
		GoodsModel.setGoods_content(content);
		
		mav.addObject("currentPage",currentPage);
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

		String uploadPath = "E:\\Github-3\\feline\\src\\main\\webapp\\resources\\upload\\images";
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
	@RequestMapping(value = "adEventList.cat")
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
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adEventList");
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
	@RequestMapping(value = "eventGoodsList.cat")
	public void eventGoodsList(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			int goods_category = Integer.parseInt(request.getParameter("param"));
			goodsList = eventService.goodsCategoryList(goods_category);
			
			logger.info("goodsList:" + goodsList.size());
			
			JSONArray jsonArray = new JSONArray();
			for(int i = 0; i < goodsList.size(); i++) {
				JSONObject sObject = new JSONObject();
				sObject.put("goods_img_savname", goodsList.get(i).getGoods_image_savname());
				sObject.put("goods_name", goodsList.get(i).getGoods_name());
				sObject.put("goods_price", goodsList.get(i).getGoods_price());
				sObject.put("goods_num", goodsList.get(i).getGoods_num());
				jsonArray.add(i, sObject);
				
			}
			
			//jsonArray 넘김
			PrintWriter pw = response.getWriter();
			pw.print(jsonArray.toString());
			pw.flush();
			pw.close();
		} catch(Exception e) {
			System.out.println("Controller error");
		}

	}
	
	// Admin 이벤트 등록 폼
	@RequestMapping(value = "adEventWrite.cat", method = RequestMethod.GET)
	public ModelAndView adEventWriteForm() {

		mav.setViewName("adEventWrite");
		return mav;
	}
	
	// Admin 이벤트 등록
	@RequestMapping(value = "adEventWrite.cat", method = RequestMethod.POST)
	public ModelAndView adEventWrite(HttpServletRequest request) throws ParseException {
		
		EventModel eventModel = new EventModel();
		
		Calendar today = Calendar.getInstance();
		
		String goods_num = request.getParameter("goods_num");
		
		goods_num = goods_num.substring(1, goods_num.length());
		
		String start_date_s = request.getParameter("start_date");
		Date start_date = new SimpleDateFormat("yyyy-MM-dd").parse(start_date_s);
		
		String end_date_s = request.getParameter("end_date");
		Date end_date = new SimpleDateFormat("yyyy-MM-dd").parse(end_date_s);
		
		eventModel.setEvent_name(request.getParameter("event_name"));
		
		eventModel.setGoods_num(goods_num);
		eventModel.setDc_rate(Integer.parseInt(request.getParameter("dc_rate")));
		
		eventModel.setStart_date(start_date);
		eventModel.setEnd_date(end_date);
		eventModel.setReg_date(today.getTime());
		

		logger.info("start_date : " + request.getParameter("start_date"));
		logger.info("end_date : " + request.getParameter("end_date"));
		
		eventService.insertEvent(eventModel);

		mav.setViewName("redirect:adEventList.cat");
		return mav;
	}

	
	////////////////////////////////////주문취소 환불 교환 목록 ////////////////////////////////////////////////
	
	
	//고객주문취소 목록 리스트
	@RequestMapping(value="adOrderCancleList.cat")
	public ModelAndView adOrderCancleList(HttpServletRequest request) {
		
		
		List<CancleModel> adOrderCancleList = adminService.adOrderCancleList();
		
				
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		totalCount = adOrderCancleList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adOrderCancleList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
			if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		adOrderCancleList = adOrderCancleList.subList(page.getStartCount(), lastCount);
			
			
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("adOrderCancleList",adOrderCancleList);
		mav.setViewName("adOrderCancleList");
		return mav;
	}
	
	//고객주문 취소 상세보기
	@RequestMapping(value="adOrderCancleView.cat")
	public ModelAndView adOrderCancleView(@RequestParam("order_num")int order_num,
			@RequestParam("cancle_num")int cancle_num,
			HttpServletRequest request) {
		
		OrderModel orderModel= new OrderModel();
		CancleModel cancleModel = new CancleModel();
		GoodsModel goodsModel = new GoodsModel();
		
		orderModel=adminService.adOrderCancleView(order_num);
		
		cancleModel=adminService.adOrderCancleView2(cancle_num);
		
		goodsModel = adminService.adOrderCancleView3(orderModel.getGoods_num());

		mav.addObject("orderModel",orderModel);
		mav.addObject("cancleModel",cancleModel);
		mav.addObject("goodsModel",goodsModel);
		mav.setViewName("adOrderCancleView");

		return mav;
	}
	
	
	
	//고객주문환불 목록 리스트
	@RequestMapping(value="adOrderRefundList.cat", method=RequestMethod.GET)
	public ModelAndView adOrderRefundList(HttpServletRequest request) {
		
		List<RefundModel> adOrderRefundList = adminService.adOrderRefundList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		totalCount = adOrderRefundList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adOrderRefundList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
			if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		adOrderRefundList = adOrderRefundList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("adOrderRefundList",adOrderRefundList);
		mav.setViewName("adOrderRefundList");
		
		return mav;
	}
	
	//고객주문 환불 상세보기
	@RequestMapping(value="adOrderRefundView.cat")
	public ModelAndView adOrderRefundView(@RequestParam("order_num")int order_num,
			@RequestParam("trade_num")int trade_num,
			HttpServletRequest request) {
		
		OrderModel orderModel= new OrderModel();
		RefundModel refundModel= new RefundModel();
		GoodsModel goodsModel = new GoodsModel();
		
		orderModel=adminService.adOrderRefundView(order_num);
		
		refundModel=adminService.adOrderRefundView2(trade_num);
		
		goodsModel = adminService.adOrderRefundView3(orderModel.getGoods_num());

		mav.addObject("orderModel",orderModel);
		mav.addObject("refundModel",refundModel);
		mav.addObject("goodsModel",goodsModel);
		mav.setViewName("adOrderRefundView");

		return mav;
	}
	
	//환불 수락
	@RequestMapping(value="adOrderRefundAgree.cat",method=RequestMethod.POST)
	public ModelAndView RefundAgree(OrderModel orderModel,RefundModel refundModel,
			@RequestParam("redirect_type")String redirect_type) {
		
		String url=null;
		
		adminService.adOrderRefundAgree(orderModel, refundModel);
		
		if(redirect_type.equals("list")) {
			
			url="redirect:/admin/adOrderRefundList.cat";
		} else if(redirect_type.equals("detail")) {
			
			url="redirect:/admin/adOrderRefundView.cat?order_num="+refundModel.getOrder_num()+"&trade_num="+refundModel.getTrade_num();
		}

		return new ModelAndView(url);
	}
	
	//환불거절
	@RequestMapping(value="adOrderRefundRefuse.cat",method=RequestMethod.POST)
	public ModelAndView RefundRefuse(OrderModel orderModel,RefundModel refundModel,
			@RequestParam("redirect_type")String redirect_type) {
		
		String url=null;
		
		adminService.adOrderRefundRefuse(orderModel, refundModel);
		if(redirect_type.equals("list")) {
			
			url="redirect:/admin/adOrderRefundList.cat";
		} else if(redirect_type.equals("detail")) {
			
			url="redirect:/admin/adOrderRefundView.cat?order_num="+refundModel.getOrder_num()+"&trade_num="+refundModel.getTrade_num();
		}
		
		return new ModelAndView(url);
	}
	
	//고객주문교환내역 목록 리스트
	@RequestMapping(value="adOrderChangeList.cat",method=RequestMethod.GET)
	public ModelAndView adOrderChangeList(HttpServletRequest request) {
		
		List<ChangeModel> adOrderChangeList = adminService.adOrderChangeList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
			} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		totalCount = adOrderChangeList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adOrderChangeList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
			if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		
		adOrderChangeList = adOrderChangeList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("adOrderChangeList",adOrderChangeList);
		mav.setViewName("adOrderChangeList");
			
		return mav;
	}
	
	//고객주문 교환 상세보기
	@RequestMapping(value="adOrderChangeView.cat")
	public ModelAndView adOrderChangeView(@RequestParam("order_num")int order_num,
			@RequestParam("change_num")int change_num,
			HttpServletRequest request) {
		
		OrderModel orderModel= new OrderModel();
		ChangeModel changeModel = new ChangeModel();
		GoodsModel goodsModel = new GoodsModel();
		
		orderModel=adminService.adOrderChangeView(order_num);
		
		changeModel=adminService.adOrderChangeView2(change_num);
		
		goodsModel = adminService.adOrderChangeView3(orderModel.getGoods_num());

		mav.addObject("orderModel",orderModel);
		mav.addObject("changeModel",changeModel);
		mav.addObject("goodsModel",goodsModel);
		mav.setViewName("adOrderChangeView");

		return mav;
	}
	
	//교환 수락
	@RequestMapping(value="adOrderChangeAgree.cat",method=RequestMethod.POST)
	public ModelAndView ChangeAgree(OrderModel orderModel,ChangeModel changeModel,
			@RequestParam("redirect_type")String redirect_type) {
		
		String url=null;
		
		adminService.adOrderChangeAgree(orderModel, changeModel);
		
		if(redirect_type.equals("list")) {
			
			url="redirect:/admin/adOrderChangeList.cat";
		} else if(redirect_type.equals("detail")) {
			
			url="redirect:/admin/adOrderChangeView.cat?order_num="+changeModel.getOrder_num()+"&change_num="+changeModel.getChange_num();
		}

		return new ModelAndView(url);
	}
	
	//교환거절
	@RequestMapping(value="adOrderChangeRefuse.cat",method=RequestMethod.POST)
	public ModelAndView ChangeRefuse(OrderModel orderModel,ChangeModel changeModel,
			@RequestParam("redirect_type")String redirect_type) {
		
		String url=null;
		
		adminService.adOrderChangeRefuse(orderModel, changeModel);
		if(redirect_type.equals("list")) {
			
			url="redirect:/admin/adOrderChangeList.cat";
		} else if(redirect_type.equals("detail")) {
			
			url="redirect:/admin/adOrderChangeView.cat?order_num="+changeModel.getOrder_num()+"&change_num="+changeModel.getChange_num();
		}
		
		return new ModelAndView(url);
	}

}
