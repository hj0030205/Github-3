package com.feline.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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

import com.google.gson.Gson;
import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
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

	Gson gson = new Gson();

	private List<MemberModel> memberList = new ArrayList<MemberModel>();
	private List<GoodsModel> goodsList = new ArrayList<GoodsModel>();
	private List<EventModel> eventList = new ArrayList<EventModel>();

	private Logger logger = Logger.getLogger(getClass());

	@RequestMapping("main.cat") // 관리자 페이지
	public ModelAndView adMain() throws Exception {

		int countTrade = adminService.countTrade();
		int countTrans = adminService.countTrans();
		int countTrans2 = adminService.countTrans2();
		int todayMember = adminService.todayMember();
		int todayOrder = adminService.todayOrder();
		int todaySalesM = adminService.todaySalesM();

		List<GoodsModel> todaySalesGoods = adminService.todaySalesGoods();

		GregorianCalendar today = new GregorianCalendar();
		String sYear = Integer.toString(today.get(today.YEAR)).substring(2,4);
		int iYear = Integer.parseInt(sYear);
		Map<Integer, Integer> mapYear = new HashMap<>();
		int icell=0;

		// 연령대1 - 회원
		List<ChartModel> todayMemberAge = adminService.todayMemberAge();
		GoogleChartDTO pie1 = new GoogleChartDTO();
		
		
		pie1.addColumn("연령대", "string");
		pie1.addColumn("number", "number");
		pie1.createRows(todayMemberAge.size());

		mapYear = CalculationYear(todayMemberAge, iYear);
		
		icell=0;
		for(Integer i : mapYear.keySet()) {
			if(i==0) {
				pie1.addCell(icell, "비회원");
			}else {
				pie1.addCell(icell, i+"0대");
			}
			pie1.addCell(icell, mapYear.get(i));
			icell++;
		}
		
		String memberAgePie = gson.toJson(pie1.getResult());
		System.out.println("//////////////////////////////////////////" + memberAgePie);
		mav.addObject("memberAgePie", memberAgePie);

		// 지역1 - 회원
		List<ChartModel> todayMemberRegion = adminService.todayMemberRegion();
		GoogleChartDTO pie2 = new GoogleChartDTO();

		pie2.addColumn("지역", "string");
		pie2.addColumn("number", "number");
		pie2.createRows(todayMemberRegion.size());

		for (int i = 0; i < todayMemberRegion.size(); i++) {
			pie2.addCell(i, todayMemberRegion.get(i).getKey());
			pie2.addCell(i, todayMemberRegion.get(i).getValue());
		}
		String memberRegionPie = gson.toJson(pie2.getResult());
		System.out.println("//////////////////////////////////////////" + memberRegionPie);
		mav.addObject("memberRegionPie", memberRegionPie);

		// 연령대2 - 주문
		List<ChartModel> todayOrderAge = adminService.todayOrderAge();
		GoogleChartDTO pie3 = new GoogleChartDTO();

		pie3.addColumn("연령대", "string");
		pie3.addColumn("number", "number");
		pie3.createRows(todayOrderAge.size());

		mapYear = CalculationYear(todayOrderAge, iYear);
		icell=0;
		for(Integer i : mapYear.keySet()) {
			if(i==0) {
				pie3.addCell(icell, "비회원");
			}else {
				pie3.addCell(icell, i+"0대");
			}
			pie3.addCell(icell, mapYear.get(i));
			icell++;
		}
		
		String orderAgePie = gson.toJson(pie3.getResult());
		System.out.println("//////////////////////////////////////////" + orderAgePie);
		mav.addObject("orderAgePie", orderAgePie);

		// 지역2 - 주문
		List<ChartModel> todayOrderRegion = adminService.todayOrderRegion();
		GoogleChartDTO pie4 = new GoogleChartDTO();

		pie4.addColumn("지역", "string");
		pie4.addColumn("number", "number");
		pie4.createRows(todayOrderRegion.size());

		for (int i = 0; i < todayOrderRegion.size(); i++) {
			if(todayOrderRegion.get(i).getKey().equals("0")) {
				pie4.addCell(i, "비회원");
			}else {
				pie4.addCell(i, todayOrderRegion.get(i).getKey());
			}
			pie4.addCell(i, todayOrderRegion.get(i).getValue());
		}
		String orderRegionPie = gson.toJson(pie4.getResult());
		System.out.println("//////////////////////////////////////////" + orderRegionPie);
		mav.addObject("orderRegionPie", orderRegionPie);

		mav.addObject("countTrade", countTrade);
		mav.addObject("countTrans", countTrans);
		mav.addObject("countTrans2", countTrans2);
		mav.addObject("todayMember", todayMember);
		mav.addObject("todayOrder", todayOrder);
		mav.addObject("todayOrderMoney", todaySalesM);
		mav.addObject("todaySalesGoods", todaySalesGoods);
		mav.addObject("todayGoodsC", todaySalesGoods.size());

		mav.setViewName("admin");
		return mav;
	}

	/*********************** 회원 관리 *************************/

	/* 회원 목록 */
	@RequestMapping(value = "adMemberList.cat")
	public ModelAndView adMemberList(HttpServletRequest request) throws UnsupportedEncodingException {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		Map<String, Object> map = new HashMap<String, Object>();
		
		keyword = request.getParameter("searchKeyword");
		searchNum = 0;
		String date_min = request.getParameter("date_min");
		String date_max = request.getParameter("date_max");
		int status = 0;

		if(request.getParameter("searchNum")!=null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
		}
		if (keyword==null) {
			keyword = null;
		}
		if (date_min == null || request.getParameter("date_min").trim().isEmpty()) {
			date_min = null;
		}
		if (date_max == null || request.getParameter("date_max").trim().isEmpty()) {
			date_max = null;
		}
		if(request.getParameter("status")!=null) {
			status = Integer.parseInt(request.getParameter("status"));
		}
		
		map.put("searchNum", searchNum);
		map.put("searchKeyword", keyword);
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("status", status);
		
		if (keyword == null && searchNum==0 && date_min==null && date_max==null && status==0) {
			memberList = adminService.memberList();
		}else {
			memberList = adminService.searchMemberList(map);
			mav.addObject("searchKeyword", keyword);
			mav.addObject("searchNum", searchNum);
		}

		totalCount = memberList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adMemberList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		memberList = memberList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
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
	@RequestMapping(value = "adMemberModify.cat", method = RequestMethod.GET)
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
	@RequestMapping(value = "adMemberModify.cat", method = RequestMethod.POST)
	public ModelAndView adMemberModify(@ModelAttribute("memberModel") MemberModel memberModel) {

		adminService.updateMember(memberModel);

		mav.setViewName("redirect:adMemberList.cat");

		return mav;
	}

	/*********************** 상품 관리 *************************/

	// Admin 상품 리스트(검색 처리 포함)
	@RequestMapping(value = "adGoodsList.cat")
	public ModelAndView adGoodsList(HttpServletRequest request) throws UnsupportedEncodingException {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<GoodsModel> adGoodsList = new ArrayList<GoodsModel>();
		
		keyword = request.getParameter("searchKeyword");
		String date_min = request.getParameter("date_min");
		String date_max = request.getParameter("date_max");
		searchNum=0;
		int price_min = 0;
		int price_max = 0;
		
		if(request.getParameter("searchNum")!=null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
		}
		if (keyword==null) {
			keyword = null;
		}
		if (date_min == null || request.getParameter("date_min").trim().isEmpty()) {
			date_min = null;
		}

		if (date_max == null || request.getParameter("date_max").trim().isEmpty()) {
			date_max = null;
		}
		if(request.getParameter("price_min")!=null && !request.getParameter("price_min").trim().isEmpty()) {
			price_min = Integer.parseInt(request.getParameter("price_min"));
		}
		
		if(request.getParameter("price_max")!=null && !request.getParameter("price_max").trim().isEmpty()) {
			price_max = Integer.parseInt(request.getParameter("price_max"));
		}
		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("searchNum", searchNum);
		map.put("searchKeyword", keyword);
		map.put("price_min", price_min);
		map.put("price_max", price_max);
		
		if (keyword == null && searchNum==0 && date_min==null && date_max==null && price_min==0 &&price_max==0) {
			adGoodsList = adminService.goodsList();
		}else {
			adGoodsList = adminService.goodsSearch(map);
			mav.addObject("searchKeyword", keyword);
			mav.addObject("searchNum", searchNum);
		}

		totalCount = adGoodsList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "adGoodsList");
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
	public ModelAndView adGoodsWrite(@ModelAttribute("goodsModel") GoodsModel GoodsModel, MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpSession session) throws IOException {

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
	public ModelAndView adGoodsModifyForm(GoodsModel GoodsModel, BindingResult result, HttpServletRequest request) {
		int goods_num = Integer.parseInt(request.getParameter("goods_num"));
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		GoodsModel = adminService.goodsView(goods_num);

		String content = GoodsModel.getGoods_content().replaceAll("<br />", "\r\n");
		GoodsModel.setGoods_content(content);

		mav.addObject("currentPage", currentPage);
		mav.addObject("goodsModel", GoodsModel);
		mav.setViewName("adGoodsWrite");

		return mav;
	}

	// Admin 상품 수정
	@RequestMapping(value = "adGoodsModify.cat", method = RequestMethod.POST)
	public ModelAndView adGoodsModify(@ModelAttribute("goodsModel") GoodsModel GoodsModel, HttpServletRequest request, MultipartHttpServletRequest multipartRequest) throws IOException {

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
			fileName = "feline_adGoods_" + lastNo + "." + fileRealName.substring(fileRealName.lastIndexOf(".") + 1, fileRealName.length());

			FileUpload.fileUpload(file, uploadPath, fileName);

		} else {
			lastNo = GoodsModel.getGoods_num();
			fileName = "file_adGoods_" + lastNo + "." + fileRealName.substring(fileRealName.lastIndexOf(".") + 1, fileRealName.length());

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

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<OrderModel> orderlist = new ArrayList<OrderModel>();
		Map<String,Object> map = new HashMap<String,Object>();

		keyword = request.getParameter("searchKeyword");
		String date_min = request.getParameter("date_min");
		String date_max = request.getParameter("date_max");
		int status = 1;
		searchNum=0;

		if(request.getParameter("searchNum")!=null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
		}
		if (keyword==null) {
			keyword = null;
		}
		if (date_min == null || request.getParameter("date_min").trim().isEmpty()) {
			date_min = null;
		}

		if (date_max == null || request.getParameter("date_max").trim().isEmpty()) {
			date_max = null;
		}
		if(request.getParameter("status")!=null) {
			status = Integer.parseInt(request.getParameter("status"));
		}

		map.put("date_min", date_min);
		map.put("date_max", date_max);
		map.put("searchNum", searchNum);
		map.put("searchKeyword", keyword);
		map.put("status", status);
		
		
		if (keyword == null && date_min==null && date_max==null && searchNum==0 && keyword==null && status==1) {
			orderlist = adminService.orderAllList();
		}else {
			orderlist = adminService.searchOrder(map);
			mav.addObject("searchKeyword", keyword);
			mav.addObject("searchNum", searchNum);
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

		mav.addObject("orderModel", orderModel);
		mav.addObject("goodsModel", goodsModel);
		mav.setViewName("adOrderModify");

		return mav;
	}

	// 주문수정
	@RequestMapping(value = "adOrderModify.cat", method = RequestMethod.POST)
	public ModelAndView orderModify(@ModelAttribute("orderModel") OrderModel orderModel, HttpServletRequest request) {

		adminService.orderModify(orderModel);

		mav.setViewName("redirect:adOrderList.cat");
		mav.addObject("currentPage", request.getParameter("currentPage"));
		return mav;
	}

	/*********************** 이벤트 관리 *************************/

	// 이벤트 리스트
	@RequestMapping(value = "adEventList.cat")
	public ModelAndView eventList(HttpServletRequest request) {

		eventList = eventService.eventList();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
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

	// 이벤트 추가 폼의 상품 리스트
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "eventGoodsList.cat")
	public void eventGoodsList(HttpServletRequest request, HttpServletResponse response) {
		try {

			int goods_category = Integer.parseInt(request.getParameter("param"));
			goodsList = eventService.goodsCategoryList(goods_category);

			JSONArray jsonArray = new JSONArray();
			for (int i = 0; i < goodsList.size(); i++) {
				JSONObject sObject = new JSONObject();
				sObject.put("goods_img_savname", goodsList.get(i).getGoods_image_savname());
				sObject.put("goods_name", goodsList.get(i).getGoods_name());
				sObject.put("goods_price", goodsList.get(i).getGoods_price());
				sObject.put("goods_num", goodsList.get(i).getGoods_num());
				jsonArray.add(i, sObject);

			}

			// jsonArray 넘김
			PrintWriter pw = response.getWriter();
			pw.print(jsonArray.toString());
			pw.flush();
			pw.close();
		} catch (Exception e) {
			System.out.println("Controller error");
		}

	}

	// Admin 이벤트 등록 폼
	@RequestMapping(value = "adEventWrite.cat", method = RequestMethod.GET)
	public ModelAndView adEventWriteForm() {

		mav.addObject("eventModel", new EventModel());
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

		eventService.insertEvent(eventModel);

		mav.setViewName("redirect:adEventList.cat");
		return mav;
	}

	// 등록된 이벤트 보기
	@RequestMapping(value = "adEventView.cat")
	public ModelAndView adEventView(HttpServletRequest request) {

		EventModel eventModel = new EventModel();

		int event_num = Integer.parseInt(request.getParameter("event_num"));

		eventModel = eventService.eventSelectOne(event_num);

		// String으로 된 goods_num 받아서 파싱 후 Integer 타입으로 변환
		String goods_num_s = eventModel.getGoods_num();

		String[] goods_num_array = goods_num_s.split(",");

		int[] goods_num_i = new int[goods_num_array.length];

		for (int i = 0; i < goods_num_array.length; i++) {
			goods_num_i[i] = Integer.parseInt(goods_num_array[i]);
		}

		// 쌓임방지
		goodsList.clear();

		GoodsModel goodsModel1 = new GoodsModel();

		// goodsList에 goodsModel 삽입
		for (int j = 0; j < goods_num_i.length; j++) {
			GoodsModel goodsModel = new GoodsModel();
			goodsModel = eventService.selectGoods(goods_num_i[j]);
			goodsList.add(j, goodsModel);

			goodsModel1.setGoods_category(goodsList.get(0).getGoods_category());
		}

		mav.addObject("eventModel", eventModel);
		mav.addObject("goodsList", goodsList);
		mav.addObject("goodsModel1", goodsModel1);

		mav.setViewName("adEventView");

		return mav;
	}

	// 등록된 이벤트 수정하기 폼
	@RequestMapping(value = "adEventModify.cat", method = RequestMethod.GET)
	public ModelAndView adEventModifyForm(HttpServletRequest request) {

		EventModel eventModel = new EventModel();

		int event_num = Integer.parseInt(request.getParameter("event_num"));

		eventModel = eventService.eventSelectOne(event_num);

		// String으로 된 goods_num 받아서 파싱 후 Integer 타입으로 변환
		String goods_num_s = eventModel.getGoods_num();

		String[] goods_num_array = goods_num_s.split(",");

		int[] goods_num_i = new int[goods_num_array.length];

		for (int i = 0; i < goods_num_array.length; i++) {
			goods_num_i[i] = Integer.parseInt(goods_num_array[i]);
		}

		// 쌓임방지
		goodsList.clear();

		// goodsList에 goodsModel 삽입
		for (int j = 0; j < goods_num_i.length; j++) {
			GoodsModel goodsModel = new GoodsModel();
			goodsModel = eventService.selectGoods(goods_num_i[j]);
			goodsList.add(j, goodsModel);

		}

		mav.addObject("eventModel", eventModel);
		mav.addObject("goodsList", goodsList);

		mav.setViewName("adEventModify");
		return mav;
	}

	@RequestMapping(value = "adEventModify.cat", method = RequestMethod.POST)
	public ModelAndView adEventModify(HttpServletRequest request) throws ParseException {

		int event_num = Integer.parseInt(request.getParameter("event_num"));

		EventModel eventModel = new EventModel();

		String goods_num = request.getParameter("goods_num");

		if (goods_num.substring(1, 1) == ",") {
			goods_num = goods_num.substring(1, goods_num.length());
		}

		String start_date_s = request.getParameter("start_date");
		Date start_date = new SimpleDateFormat("yyyy-MM-dd").parse(start_date_s);

		String end_date_s = request.getParameter("end_date");
		Date end_date = new SimpleDateFormat("yyyy-MM-dd").parse(end_date_s);

		eventModel.setEvent_name(request.getParameter("event_name"));

		eventModel.setGoods_num(goods_num);
		eventModel.setDc_rate(Integer.parseInt(request.getParameter("dc_rate")));

		eventModel.setStart_date(start_date);
		eventModel.setEnd_date(end_date);
		eventModel.setEvent_num(event_num);

		eventService.eventModify(eventModel);

		mav.setViewName("redirect:adEventList.cat");
		return mav;

	}

	// 이벤트 삭제하기
	@RequestMapping(value = "adEventDelete.cat")
	public ModelAndView adEventDelete(HttpServletRequest request) {

		int event_num = Integer.parseInt(request.getParameter("event_num"));

		eventService.eventDelete(event_num);

		mav.setViewName("redirect:adEventList.cat");

		return mav;
	}

	// 이벤트 중지하기
	@RequestMapping(value = "adEventStop.cat")
	public ModelAndView adEventStop(HttpServletRequest request) {

		EventModel eventModel = new EventModel();

		int event_num = Integer.parseInt(request.getParameter("event_num"));

		eventModel.setStatus(0);
		eventModel.setEvent_num(event_num);

		eventService.eventOnOff(eventModel);

		eventModel = eventService.eventSelectOne(event_num);

		String goods_num_s = eventModel.getGoods_num();
		int event_num1 = eventModel.getEvent_num();

		String[] goods_num_array = goods_num_s.split(",");

		for (int i = 0; i < goods_num_array.length; i++) {
			EventModel eventModel1 = new EventModel();

			eventModel1.setGoods_num(goods_num_array[i]);
			eventModel1.setEvent_num(event_num1);

			eventService.eventPriceOff(eventModel1);
		}

		mav.setViewName("redirect:adEventList.cat");

		return mav;
	}

	//////////////////////////////////// 주문취소 환불 교환 목록 ////////////////////////////////////////////////

	// 고객주문취소 목록 리스트
	@RequestMapping(value = "adOrderCancleList.cat")
	public ModelAndView adOrderCancleList(HttpServletRequest request) {

		List<CancleModel> adOrderCancleList = adminService.adOrderCancleList();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
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
		mav.addObject("adOrderCancleList", adOrderCancleList);
		mav.setViewName("adOrderCancleList");
		return mav;
	}

	// 고객주문 취소 상세보기
	@RequestMapping(value = "adOrderCancleView.cat")
	public ModelAndView adOrderCancleView(@RequestParam("order_num") int order_num, @RequestParam("cancle_num") int cancle_num, HttpServletRequest request) {

		OrderModel orderModel = new OrderModel();
		CancleModel cancleModel = new CancleModel();
		GoodsModel goodsModel = new GoodsModel();

		orderModel = adminService.adOrderCancleView(order_num);

		cancleModel = adminService.adOrderCancleView2(cancle_num);

		goodsModel = adminService.adOrderCancleView3(orderModel.getGoods_num());

		mav.addObject("orderModel", orderModel);
		mav.addObject("cancleModel", cancleModel);
		mav.addObject("goodsModel", goodsModel);
		mav.setViewName("adOrderCancleView");

		return mav;
	}

	// 고객주문환불 목록 리스트
	@RequestMapping(value = "adOrderRefundList.cat", method = RequestMethod.GET)
	public ModelAndView adOrderRefundList(HttpServletRequest request) {

		List<RefundModel> adOrderRefundList = adminService.adOrderRefundList();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
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
		mav.addObject("adOrderRefundList", adOrderRefundList);
		mav.setViewName("adOrderRefundList");

		return mav;
	}

	// 고객주문 환불 상세보기
	@RequestMapping(value = "adOrderRefundView.cat")
	public ModelAndView adOrderRefundView(@RequestParam("order_num") int order_num, @RequestParam("trade_num") int trade_num, HttpServletRequest request) {

		OrderModel orderModel = new OrderModel();
		RefundModel refundModel = new RefundModel();
		GoodsModel goodsModel = new GoodsModel();

		orderModel = adminService.adOrderRefundView(order_num);

		refundModel = adminService.adOrderRefundView2(trade_num);

		goodsModel = adminService.adOrderRefundView3(orderModel.getGoods_num());

		mav.addObject("orderModel", orderModel);
		mav.addObject("refundModel", refundModel);
		mav.addObject("goodsModel", goodsModel);
		mav.setViewName("adOrderRefundView");

		return mav;
	}

	// 환불 수락
	@RequestMapping(value = "adOrderRefundAgree.cat", method = RequestMethod.POST)
	public ModelAndView RefundAgree(OrderModel orderModel, RefundModel refundModel, @RequestParam("redirect_type") String redirect_type) {

		String url = null;

		adminService.adOrderRefundAgree(orderModel, refundModel);

		if (redirect_type.equals("list")) {

			url = "redirect:/admin/adOrderRefundList.cat";
		} else if (redirect_type.equals("detail")) {

			url = "redirect:/admin/adOrderRefundView.cat?order_num=" + refundModel.getOrder_num() + "&trade_num=" + refundModel.getTrade_num();
		}

		return new ModelAndView(url);
	}

	// 환불거절
	@RequestMapping(value = "adOrderRefundRefuse.cat", method = RequestMethod.POST)
	public ModelAndView RefundRefuse(OrderModel orderModel, RefundModel refundModel, @RequestParam("redirect_type") String redirect_type) {

		String url = null;

		adminService.adOrderRefundRefuse(orderModel, refundModel);
		if (redirect_type.equals("list")) {

			url = "redirect:/admin/adOrderRefundList.cat";
		} else if (redirect_type.equals("detail")) {

			url = "redirect:/admin/adOrderRefundView.cat?order_num=" + refundModel.getOrder_num() + "&trade_num=" + refundModel.getTrade_num();
		}

		return new ModelAndView(url);
	}

	// 고객주문교환내역 목록 리스트
	@RequestMapping(value = "adOrderChangeList.cat", method = RequestMethod.GET)
	public ModelAndView adOrderChangeList(HttpServletRequest request) {

		List<ChangeModel> adOrderChangeList = adminService.adOrderChangeList();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
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
		mav.addObject("adOrderChangeList", adOrderChangeList);
		mav.setViewName("adOrderChangeList");

		return mav;
	}

	// 고객주문 교환 상세보기
	@RequestMapping(value = "adOrderChangeView.cat")
	public ModelAndView adOrderChangeView(@RequestParam("order_num") int order_num, @RequestParam("change_num") int change_num, HttpServletRequest request) {

		OrderModel orderModel = new OrderModel();
		ChangeModel changeModel = new ChangeModel();
		GoodsModel goodsModel = new GoodsModel();

		orderModel = adminService.adOrderChangeView(order_num);

		changeModel = adminService.adOrderChangeView2(change_num);

		goodsModel = adminService.adOrderChangeView3(orderModel.getGoods_num());

		mav.addObject("orderModel", orderModel);
		mav.addObject("changeModel", changeModel);
		mav.addObject("goodsModel", goodsModel);
		mav.setViewName("adOrderChangeView");

		return mav;
	}

	// 교환 수락
	@RequestMapping(value = "adOrderChangeAgree.cat", method = RequestMethod.POST)
	public ModelAndView ChangeAgree(OrderModel orderModel, ChangeModel changeModel, @RequestParam("redirect_type") String redirect_type) {

		String url = null;

		adminService.adOrderChangeAgree(orderModel, changeModel);

		if (redirect_type.equals("list")) {

			url = "redirect:/admin/adOrderChangeList.cat";
		} else if (redirect_type.equals("detail")) {

			url = "redirect:/admin/adOrderChangeView.cat?order_num=" + changeModel.getOrder_num() + "&change_num=" + changeModel.getChange_num();
		}

		return new ModelAndView(url);
	}

	// 교환거절
	@RequestMapping(value = "adOrderChangeRefuse.cat", method = RequestMethod.POST)
	public ModelAndView ChangeRefuse(OrderModel orderModel, ChangeModel changeModel, @RequestParam("redirect_type") String redirect_type) {

		String url = null;

		adminService.adOrderChangeRefuse(orderModel, changeModel);
		if (redirect_type.equals("list")) {

			url = "redirect:/admin/adOrderChangeList.cat";
		} else if (redirect_type.equals("detail")) {

			url = "redirect:/admin/adOrderChangeView.cat?order_num=" + changeModel.getOrder_num() + "&change_num=" + changeModel.getChange_num();
		}

		return new ModelAndView(url);
	}

	/////////////////////////////////////////////////////////////////

	@RequestMapping("adChartMember.cat")
	public ModelAndView chartM() {
		
		GregorianCalendar today = new GregorianCalendar();
		String sYear = Integer.toString(today.get(Calendar.YEAR)).substring(2,4);
		int iYear = Integer.parseInt(sYear);
		Map<Integer, Integer> mapYear = new HashMap<>();
		int icell=0;

		// 신규 회원 통계
		List<ChartModel> listNew = adminService.chartNewM();

		GoogleChartDTO goNew = new GoogleChartDTO();

		goNew.addColumn("DAY", "string");
		goNew.addColumn("신규 가입 회원수", "number");
		goNew.createRows(listNew.size());

		for (int i = 0; i < listNew.size(); i++) {
			goNew.addCell(i, listNew.get(i).getKey() + "(일)");
			goNew.addCell(i, listNew.get(i).getValue());
		}

		String jsonNew = gson.toJson(goNew.getResult());

		// 전체 회원 통계
		List<ChartModel> listAll = adminService.chartAllM();

		GoogleChartDTO goAll = new GoogleChartDTO();

		goAll.addColumn("DAY", "string");
		goAll.addColumn("가입 회원수", "number");
		goAll.createRows(listAll.size());

		for (int i = 0; i < listAll.size(); i++) {
			goAll.addCell(i, listAll.get(i).getKey() + "(월)");
			goAll.addCell(i, listAll.get(i).getValue());
		}

		String jsonAll = gson.toJson(goAll.getResult());
		System.out.println(jsonAll);

		// 신규회원 연령 통계
		List<ChartModel> newMemberAge = adminService.newMemberAge();
		GoogleChartDTO pie = new GoogleChartDTO();

		pie.addColumn("연령대", "string");
		pie.addColumn("number", "number");
		pie.createRows(newMemberAge.size());

		mapYear = CalculationYear(newMemberAge, iYear);
		
		icell=0;
		for(Integer i : mapYear.keySet()) {
			if(i==0) {
				pie.addCell(icell, "비회원");
			}else {
				pie.addCell(icell, i+"0대");
			}
			pie.addCell(icell, mapYear.get(i));
			icell++;
		}
		String newAgePie = gson.toJson(pie.getResult());
		System.out.println("//////////////////////////////////////////" + newAgePie);
		mav.addObject("newAgePie", newAgePie);

		// 신규회원 지역 통계
		List<ChartModel> newMemberRegion = adminService.newMemberRegion();
		GoogleChartDTO pie2 = new GoogleChartDTO();

		pie2.addColumn("지역", "string");
		pie2.addColumn("number", "number");
		pie2.createRows(newMemberRegion.size());

		for (int i = 0; i < newMemberRegion.size(); i++) {
			pie2.addCell(i, newMemberRegion.get(i).getKey());
			pie2.addCell(i, newMemberRegion.get(i).getValue());
		}
		String newRegionPie = gson.toJson(pie2.getResult());
		mav.addObject("newRegionPie", newRegionPie);

		// 전체 회원 나이 통계
		List<ChartModel> memberAge = adminService.memberAge();
		GoogleChartDTO pie3 = new GoogleChartDTO();

		pie3.addColumn("연령대", "string");
		pie3.addColumn("number", "number");
		pie3.createRows(memberAge.size());

		mapYear = CalculationYear(memberAge, iYear);
		
		icell=0;
		for(Integer i : mapYear.keySet()) {
			pie3.addCell(icell, i+"0대");
			pie3.addCell(icell, mapYear.get(i));
			icell++;
		}
		String agePie = gson.toJson(pie3.getResult());
		System.out.println("//////////////////////////////////////////" + agePie);
		mav.addObject("agePie", agePie);

		// 전체 회원 지역 통계
		List<ChartModel> memberRegion = adminService.memberRegion();
		GoogleChartDTO pie4 = new GoogleChartDTO();

		pie4.addColumn("지역", "string");
		pie4.addColumn("number", "number");
		pie4.createRows(memberRegion.size());

		for (int i = 0; i < memberRegion.size(); i++) {
			pie4.addCell(i, memberRegion.get(i).getKey());
			pie4.addCell(i, memberRegion.get(i).getValue());
		}
		String regionPie = gson.toJson(pie4.getResult());
		mav.addObject("regionPie", regionPie);

		mav.addObject("jsonAll", jsonAll);
		mav.addObject("jsonNew", jsonNew);
		mav.setViewName("adminChartOrder");

		return mav;
	}
	
	@RequestMapping("adChartOrder.cat")
	public ModelAndView chartO() {
		
		GregorianCalendar today = new GregorianCalendar();
		String sYear = Integer.toString(today.get(Calendar.YEAR)).substring(2,4);
		int iYear = Integer.parseInt(sYear);
		Map<Integer, Integer> mapYear = new HashMap<>();
		int icell=0;

		Gson gson = new Gson();

		// 최근 7일 날짜별 주문량 조회
		List<ChartModel> weekOrderNum = adminService.weekOrderNum();
		GoogleChartDTO line1 = new GoogleChartDTO();

		line1.addColumn("day", "string");
		line1.addColumn("주문수", "number");
		line1.createRows(weekOrderNum.size());

		for (int i = 0; i < weekOrderNum.size(); i++) {
			line1.addCell(i, weekOrderNum.get(i).getKey());
			line1.addCell(i, weekOrderNum.get(i).getValue());
		}
		String jsonNew = gson.toJson(line1.getResult());
		mav.addObject("jsonNew", jsonNew);

		// 최근 7일 날짜별 판매량 조회
		List<ChartModel> weekSales = adminService.weekSales();
		GoogleChartDTO sales1 = new GoogleChartDTO();

		sales1.addColumn("day", "string");
		sales1.addColumn("판매금액", "number");
		sales1.createRows(weekSales.size());

		for (int i = 0; i < weekSales.size(); i++) {
			sales1.addCell(i, weekSales.get(i).getKey());
			sales1.addCell(i, weekSales.get(i).getPrice());
		}
		String salesNew = gson.toJson(sales1.getResult());
		mav.addObject("salesNew", salesNew);

		// 주간 연령 구분
		List<ChartModel> weekOrderAge = adminService.weekOrderAge();
		GoogleChartDTO pie1 = new GoogleChartDTO();

		pie1.addColumn("연령대", "string");
		pie1.addColumn("number", "number");
		pie1.createRows(weekOrderAge.size());

		mapYear = CalculationYear(weekOrderAge, iYear);
		
		icell=0;
		for(Integer i : mapYear.keySet()) {
			if(i==0) {
				pie1.addCell(icell, "비회원");
			}else {
				pie1.addCell(icell, i+"0대");
			}
			pie1.addCell(icell, mapYear.get(i));
			icell++;
		}
		String newAgePie = gson.toJson(pie1.getResult());
		mav.addObject("newAgePie", newAgePie);

		// 주간 지역 구분
		List<ChartModel> weekOrderRegion = adminService.weekOrderRegion();
		GoogleChartDTO pie2 = new GoogleChartDTO();

		pie2.addColumn("지역", "string");
		pie2.addColumn("number", "number");
		pie2.createRows(weekOrderRegion.size());

		for (int i = 0; i < weekOrderRegion.size(); i++) {
			if(weekOrderRegion.get(i).getKey().equals("0")) {
				pie2.addCell(i, "비회원");
			}else {
				pie2.addCell(i, weekOrderRegion.get(i).getKey());
			}
			pie2.addCell(i, weekOrderRegion.get(i).getValue());
		}
		String newRegionPie = gson.toJson(pie2.getResult());
		System.out.println(newRegionPie);

		mav.addObject("newRegionPie", newRegionPie);

		// 달별 주문량
		List<ChartModel> monthOrderNum = adminService.monthOrderNum();
		GoogleChartDTO line2 = new GoogleChartDTO();

		line2.addColumn("day", "string");
		line2.addColumn("주문수", "number");
		line2.createRows(monthOrderNum.size());

		for (int i = 0; i < monthOrderNum.size(); i++) {
			line2.addCell(i, monthOrderNum.get(i).getKey());
			line2.addCell(i, monthOrderNum.get(i).getValue());
		}
		String jsonAll = gson.toJson(line2.getResult());
		mav.addObject("jsonAll", jsonAll);

		// 달별 판매량
		List<ChartModel> monthSales = adminService.monthSales();
		GoogleChartDTO sales2 = new GoogleChartDTO();

		sales2.addColumn("day", "string");
		sales2.addColumn("판매 금액", "number");
		sales2.createRows(monthSales.size());

		for (int i = 0; i < monthSales.size(); i++) {
			sales2.addCell(i, monthSales.get(i).getKey());
			sales2.addCell(i, monthSales.get(i).getPrice());
		}
		String salesAll = gson.toJson(sales2.getResult());
		mav.addObject("salesAll", salesAll);

		// 달별 연령 구분
		List<ChartModel> monthOrderAge = adminService.monthOrderAge();
		GoogleChartDTO pie3 = new GoogleChartDTO();

		pie3.addColumn("항목", "string");
		pie3.addColumn("값", "number");
		pie3.createRows(monthOrderAge.size());

		mapYear = CalculationYear(monthOrderAge, iYear);
		
		icell=0;
		for(Integer k : mapYear.keySet()) {
			if(k==0) {
				pie3.addCell(icell, "비회원");
			}else {
				pie3.addCell(icell, k+"0대");
			}
			pie3.addCell(icell, mapYear.get(k));
			icell++;
		}
		String agePie = gson.toJson(pie3.getResult());
		mav.addObject("agePie", agePie);

		// 달별 지역 구분
		List<ChartModel> monthOrderRegion = adminService.monthOrderRegion();
		GoogleChartDTO pie4 = new GoogleChartDTO();

		pie4.addColumn("항목", "string");
		pie4.addColumn("값", "number");
		pie4.createRows(monthOrderRegion.size());

		for (int i = 0; i < monthOrderRegion.size(); i++) {
			if(monthOrderRegion.get(i).getKey().equals("0")) {
				pie4.addCell(i, "비회원");
			}else {
				pie4.addCell(i, monthOrderRegion.get(i).getKey());
			}
			pie4.addCell(i, monthOrderRegion.get(i).getValue());
		}
		String regionPie = gson.toJson(pie4.getResult());
		mav.addObject("regionPie", regionPie);

		mav.setViewName("adminChart");
		return mav;

	}

	@RequestMapping("adGoodsChart.cat")
	public ModelAndView chartB() {

		List<GoodsModel> GoodsSelling = adminService.GoodsSelling();
		List<GoodsModel> monthGoodsSelling = adminService.monthGoodsSelling();
		List<GoodsModel> weekGoodsSelling = adminService.weekGoodsSelling();

		mav.addObject("GoodsSelling", GoodsSelling);
		mav.addObject("monthGoodsSelling", monthGoodsSelling);
		mav.addObject("weekGoodsSelling", weekGoodsSelling);
		mav.setViewName("adminChartGoods");
		return mav;
	}
	
	private Map<Integer, Integer> CalculationYear(List<ChartModel> chartList, int iYear){
		Map<Integer, Integer> map = new HashMap<>();
		int mYear=0, kYear=0, yearValue=0, count=0;
		for (int i = 0; i < chartList.size(); i++) {
			mYear = Integer.parseInt(chartList.get(i).getKey());
			yearValue = chartList.get(i).getValue();
			count=0;
			if (mYear >= iYear) {
				kYear = ((100 + iYear) - mYear) / 10;
				if(kYear>90)
					kYear=10;
			}else if(mYear==0) {
				kYear=0;
			}else {
				kYear = (iYear - mYear) / 10;
				if(kYear<10)
					kYear=1;
			}
			count+=yearValue;
			if(map.size()!=0 && map.containsKey(kYear)) {
				count=map.get(kYear);
				map.put(kYear, count);
			}else if(map.size()==0 && !map.containsKey(kYear) && yearValue>0){
				map.put(kYear, count);
			}else {
				map.put(kYear, ++count);
			}
		}
		return map;
	}

}

