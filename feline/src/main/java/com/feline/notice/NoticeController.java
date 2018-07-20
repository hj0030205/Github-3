package com.feline.notice;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.servlet.ModelAndView;

import com.feline.util.FileUpload;
import com.feline.util.Paging;
import com.feline.validator.NoticeValidator;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Resource
	private NoticeService noticeService;

	private int searchNum;
	private String keyword;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	@RequestMapping(value = "noticeList.cat", method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<NoticeModel> noticeList=null;

		keyword = request.getParameter("keyword");

		if (keyword != null) {
			keyword = new String(keyword.getBytes("8859_1"), "UTF-8");
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 0)
				noticeList = noticeService.noticeSearchSubject(keyword);
			else if(searchNum==1)
				noticeList = noticeService.noticeSearchContent(keyword);

			totalCount = noticeList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "noticeList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			noticeList = noticeList.subList(page.getStartCount(), lastCount);

			mav.addObject("keyword", keyword);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("noticeList", noticeList);
			mav.setViewName("noticeList");
			return mav;
		}

		noticeList = noticeService.noticeList();

		totalCount = noticeList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, "", "noticeList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		noticeList = noticeList.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("noticeList");
		return mav;
	}

	@RequestMapping("noticeView.cat")
	public ModelAndView noticeView(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int no = Integer.parseInt(request.getParameter("no"));

		NoticeModel noticeModel = noticeService.noticeView(no);

		noticeService.noticeUpdateReadcount(no);

		mav.addObject("currentPage", currentPage);
		mav.addObject("noticeModel", noticeModel);
		mav.setViewName("noticeView");

		return mav;
	}
	
	@RequestMapping(value = "noticeWrite.cat", method = RequestMethod.GET)
	public ModelAndView noticeWriteForm(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeWrite");
		return mav;
	}

	@RequestMapping(value = "noticeWrite.cat", method = RequestMethod.POST)
	public ModelAndView noticeWrite(@ModelAttribute("noticeModel") NoticeModel noticeModel, BindingResult result,
			MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpSession session) throws IOException {

		MultipartFile file = multipartRequest.getFile("file");
		Calendar today = Calendar.getInstance();
		String oldfileName = request.getParameter("oldFile");

		ModelAndView mav = new ModelAndView();

		new NoticeValidator().validate(noticeModel, result); 
		if (result.hasErrors()) { 
			mav.setViewName("noticeWrite"); return mav; }
		 

		String content = noticeModel.getContent().replaceAll("\r\n", "<br />");
		noticeModel.setId((String)session.getAttribute("adminId"));
		noticeModel.setContent(content);
		noticeModel.setRegdate(today.getTime());

		noticeService.noticeWrite(noticeModel);

		if (file != null) {
			noticeModel=fileUploading(file, oldfileName, noticeModel);
		}

		mav.addObject("noticeModel", noticeModel);
		mav.setViewName("redirect:noticeList.cat");

		return mav;
	}

	@RequestMapping("noticeDelete.cat")
	public ModelAndView noticeDelete(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		noticeService.noticeDelete(no);
		mav.setViewName("redirect:noticeList.cat");

		return mav;
	}

	
	@RequestMapping(value="noticeModify.cat", method=RequestMethod.GET)
	public ModelAndView noticeModifyForm(@ModelAttribute("noticeModel") NoticeModel noticeModel, 
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		
		noticeModel = noticeService.noticeView(noticeModel.getNo());

		String content = noticeModel.getContent().replaceAll("<br />", "\r\n");
		noticeModel.setContent(content);

		mav.addObject("noticeModel", noticeModel);
		mav.setViewName("noticeWrite");

		return mav;
	}

	@RequestMapping(value = "noticeModify.cat", method = RequestMethod.POST)
	public ModelAndView noticeModify(@ModelAttribute("noticeModel") NoticeModel noticeModel, HttpServletRequest request, 
			MultipartHttpServletRequest multipartRequest, BindingResult result) throws IOException{

		ModelAndView mav = new ModelAndView();
		new NoticeValidator().validate(noticeModel, result); 
		if (result.hasErrors()) { 
			mav.addObject("noticeModel", noticeModel);
			mav.setViewName("noticeWrite"); return mav; }
		
		MultipartFile file = multipartRequest.getFile("file");
		String oldfileName = request.getParameter("oldFile");
		int notice_num = noticeModel.getNo();
		mav.setViewName("redirect:noticeView.cat");

		String content = noticeModel.getContent().replaceAll("\r\n", "<br />");
		noticeModel.setContent(content);

		noticeService.noticeModify(noticeModel);
		if (file != null) {
			noticeModel=fileUploading(file, oldfileName, noticeModel);
		}

		mav.addObject("no", notice_num);

		return mav;
	}

	private NoticeModel fileUploading(MultipartFile file, String oldfileName, NoticeModel noticeModel) throws IOException {

		String uploadPath = "E:\\Github-3\\feline\\src\\main\\webapp\\resources\\upload\\images";
		String fileRealName = file.getOriginalFilename();
		String fileName;
		int lastNo;
		if (oldfileName == null) {
			lastNo = noticeService.noticeLastNo();
			fileName = "feline_notice_" + 
			lastNo +"."+fileRealName.substring(fileRealName.lastIndexOf(".")+1, fileRealName.length());

			FileUpload.fileUpload(file, uploadPath, fileName);
			
		} else {
			lastNo = noticeModel.getNo();
			fileName = "file_notice_" + 
					lastNo + "."+fileRealName.substring(fileRealName.lastIndexOf(".")+1, fileRealName.length());
			
			File deleteFile = new File(uploadPath+oldfileName);
			deleteFile.delete();
			
			FileUpload.fileUpload(file, uploadPath, fileName);
		}
		noticeModel.setNo(lastNo);
		noticeModel.setFile_orgname(fileRealName);
		noticeModel.setFile_savname(fileName);
		noticeService.updateFile(noticeModel);
		
		return noticeModel;

	}

}
