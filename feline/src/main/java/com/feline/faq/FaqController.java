package com.feline.faq;

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
import org.springframework.web.servlet.ModelAndView;

import com.feline.faq.FaqModel;
import com.feline.util.Paging;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Resource
	private FaqService faqService;
	
	private int searchNum;
	private String keyword;

	// 페이징을 위한 변수 설정
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	// FAQ 리스트(검색 처리 포함)
		@RequestMapping(value = "faqList.cat", method = RequestMethod.GET)
		public ModelAndView faqList(HttpServletRequest request) throws UnsupportedEncodingException {
			ModelAndView mav = new ModelAndView();

			if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
					|| request.getParameter("currentPage").equals("0")) {
				currentPage = 1;
			} else {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			List<FaqModel> faqList= new ArrayList<FaqModel>();
			keyword = request.getParameter("keyword");
			
			if (keyword != null && keyword!="") {
				keyword = new String(keyword.getBytes("8859_1"), "UTF-8");
				searchNum = Integer.parseInt(request.getParameter("searchNum"));

				if (searchNum == 0)
					faqList = faqService.faqSearchSubject(keyword);
				else if(searchNum==1)
					faqList = faqService.faqSearchContent(keyword);

				totalCount = faqList.size();
				page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "faqList");
				pagingHtml = page.getPagingHtml().toString();

				int lastCount = totalCount;

				if (page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;

				faqList = faqList.subList(page.getStartCount(), lastCount);

				mav.addObject("keyword", keyword);
				mav.addObject("searchNum", searchNum);
				mav.addObject("totalCount", totalCount);
				mav.addObject("pagingHtml", pagingHtml);
				mav.addObject("currentPage", currentPage);
				mav.addObject("faqList", faqList);
				mav.setViewName("boardFaqList");
				return mav;
			}

			faqList = faqService.faqList();

			totalCount = faqList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, "", "faqList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			faqList = faqList.subList(page.getStartCount(), lastCount);

			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("faqList", faqList);
			mav.setViewName("faqList");
			return mav;
		}

		// FAQ 글쓰기 폼
		@RequestMapping(value = "faqWrite.cat", method = RequestMethod.GET)
		public ModelAndView faqWriteForm(HttpServletRequest request) {

			ModelAndView mav = new ModelAndView();
			mav.setViewName("faqWrite");
			return mav;
		}

		// FAQ 글쓰기
		@RequestMapping(value = "faqWrite.cat", method = RequestMethod.POST)
		public ModelAndView faqWrite(@ModelAttribute("faqModel") FaqModel faqModel,
				HttpServletRequest request, HttpSession session) throws IOException {
			ModelAndView mav = new ModelAndView();
			
			Calendar today = Calendar.getInstance();
			String content = faqModel.getContent().replaceAll("\r\n", "<br />");
			faqModel.setId((String)session.getAttribute("id"));
			faqModel.setContent(content);
			faqModel.setRegdate(today.getTime());

			faqService.faqWrite(faqModel);
			mav.addObject("faqModel", faqModel);
			mav.setViewName("redirect:faqList.cat");

			return mav;
		}

		// FAQ 삭제
		@RequestMapping("faqDelete.cat")
		public ModelAndView faqDelete(HttpServletRequest request) {

			ModelAndView mav = new ModelAndView();
			int no = Integer.parseInt(request.getParameter("no"));
			faqService.faqDelete(no);
			mav.setViewName("redirect:faqList.cat");

			return mav;
		}

		// FAQ 수정폼
		@RequestMapping(value="faqModify.cat", method=RequestMethod.GET)
		public ModelAndView faqModifyForm(FaqModel faqModel,
				HttpServletRequest request) {

			ModelAndView mav = new ModelAndView();
			faqModel = faqService.faqSelect(faqModel.getNo());

			String content = faqModel.getContent().replaceAll("<br />", "\r\n");
			faqModel.setContent(content);

			mav.addObject("faqModel", faqModel);
			mav.setViewName("faqWrite");

			return mav;
		}

		// FAQ 수정
		@RequestMapping(value = "faqModify.cat", method = RequestMethod.POST)
		public ModelAndView faqModify(@ModelAttribute("faqModel") FaqModel faqModel, HttpServletRequest request) throws IOException{
			
			ModelAndView mav = new ModelAndView("redirect:faqList.cat");

			String content = faqModel.getContent().replaceAll("\r\n", "<br />");
			faqModel.setContent(content);

			faqService.faqModify(faqModel);

			mav.addObject("no", faqModel.getNo());
			return mav;
		}
}
