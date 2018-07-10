package com.feline.qna;

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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.feline.qna.QnaModel;
import com.feline.util.FileUpload;
import com.feline.util.Paging;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Resource
	private QnaService qnaService;

	private int searchNum;
	private String keyword;

	// 페이징을 위한 변수 설정
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	// Q&A 리스트(검색 처리 포함)
	@RequestMapping(value = "qnaList.cat", method = RequestMethod.GET)
	public ModelAndView qnaList(HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<QnaModel> qnaList = null;

		keyword = request.getParameter("keyword");
		if (keyword != null)
			keyword = new String(keyword.getBytes("8859_1"), "UTF-8");

		if (keyword != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 0)
				qnaList = qnaService.qnaSearchSubject(keyword);
			else if (searchNum == 1)
				qnaList = qnaService.qnaSearchContent(keyword);
			else if (searchNum == 2)
				qnaList = qnaService.qnaSearchWriter(keyword);

			totalCount = qnaList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, keyword, "qnaList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			qnaList = qnaList.subList(page.getStartCount(), lastCount);

			mav.addObject("keyword", keyword);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("qnaList", qnaList);
			mav.setViewName("qnaList");
			return mav;
		}

		qnaList = qnaService.qnaList();

		totalCount = qnaList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, searchNum, "", "qnaList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		qnaList = qnaList.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("qnaList", qnaList);
		mav.setViewName("qnaList");
		return mav;
	}

	// Q&A 상세보기
	@RequestMapping("qnaView.cat")
	public ModelAndView qnaView(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		int no = Integer.parseInt(request.getParameter("no"));

		QnaModel qnaModel = qnaService.qnaView(no);

		mav.addObject("currentPage", currentPage);
		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaView");

		return mav;
	}

	// Q&A 글쓰기 폼
	@RequestMapping(value = "qnaWrite.cat", method = RequestMethod.GET)
	public ModelAndView qnaWriteForm(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("qnaWrite");
		return mav;
	}

	// Q&A 답변글 쓰기 폼
	@RequestMapping(value="qnaReplyWrite.cat", method=RequestMethod.GET)
	public ModelAndView qnaReplyWriteForm(HttpServletRequest request, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		boolean reply=true; 
		QnaModel qnaModel = qnaService.qnaView(no);
		qnaModel.setSubject("[답변]"+qnaModel.getSubject());
		qnaModel.setId((String)session.getAttribute("id"));
		qnaModel.setPassword("temporary");
		qnaModel.setContent("");
		qnaModel.setImage_orgname(null);
		qnaModel.setImage_savname(null);
		
		mav.addObject("reply",reply);
		mav.addObject("qnaModel",qnaModel);
		mav.setViewName("qnaWrite");
		return mav;
	}

	// Q&A 글쓰기
	@RequestMapping(value = "qnaWrite.cat", method = RequestMethod.POST)
	public ModelAndView qnaWrite(@ModelAttribute("qnaModel") QnaModel qnaModel,
			MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpSession session) throws IOException {

		MultipartFile file = multipartRequest.getFile("file");
		Calendar today = Calendar.getInstance();
		String oldfileName = request.getParameter("oldFile");
		int ref=0;
		int re_step=0;
		
		if(request.getParameter("ref")!=null && request.getParameter("re_step")!=null) {
			ref=Integer.parseInt(request.getParameter("ref"));
			re_step=Integer.parseInt(request.getParameter("re_step"));
		}

		ModelAndView mav = new ModelAndView();
		
		if(ref==0) {
			qnaModel.setRe_step(0);
		}else {
			qnaModel.setRef(ref);
			qnaModel.setRe_step(re_step);
			qnaService.qnaSetReplyStep(qnaModel);
			qnaService.qnaAnswer(ref);
			
			qnaModel.setRe_step(re_step+1);
		}
		
		String content = qnaModel.getContent().replaceAll("\r\n", "<br />");
		qnaModel.setId((String)session.getAttribute("id"));
		qnaModel.setPassword("temporary");
		qnaModel.setContent(content);
		qnaModel.setRegdate(today.getTime());

		if(ref==0) {
			qnaService.qnaWrite(qnaModel);
		}else {
			qnaService.qnaReplyWrite(qnaModel);
		}

		if (file != null) {
			qnaModel = fileUploading(file, oldfileName, qnaModel);
		}

		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("redirect:qnaList.cat");

		return mav;
	}

	// Q&A 삭제
	@RequestMapping("qnaDelete.cat")
	public ModelAndView qnaDelete(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		qnaService.qnaDelete(no);
		mav.setViewName("redirect:qnaList.cat");

		return mav;
	}

	// Q&A 수정폼
	@RequestMapping(value = "qnaModify.cat", method = RequestMethod.GET)
	public ModelAndView qnaModifyForm(@ModelAttribute("qnaModel") QnaModel qnaModel, BindingResult result,
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		qnaModel = qnaService.qnaView(qnaModel.getNo());

		String content = qnaModel.getContent().replaceAll("<br />", "\r\n");
		qnaModel.setContent(content);

		mav.addObject("currentPage",request.getParameter("currentPage"));
		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaWrite");

		return mav;
	}

	// Q&A 수정
	@RequestMapping(value = "qnaModify.cat", method = RequestMethod.POST)
	public ModelAndView qnaModify(@ModelAttribute("qnaModel") QnaModel qnaModel, HttpServletRequest request,
			MultipartHttpServletRequest multipartRequest) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		MultipartFile file = multipartRequest.getFile("file");
		String oldfileName = request.getParameter("oldFile");
		int qna_num = qnaModel.getNo();
		String content = qnaModel.getContent().replaceAll("\r\n", "<br />");
		
		qnaModel.setContent(content);
		qnaService.qnaModify(qnaModel);
		
		if (file != null) {
			qnaModel = fileUploading(file, oldfileName, qnaModel);
		}
		
		mav.setViewName("redirect:qnaView.cat");
		mav.addObject("currentPage",request.getParameter("currentPage"));
		mav.addObject("no", qna_num);

		return mav;
	}

	// 파일 업로드.
	private QnaModel fileUploading(MultipartFile file, String oldfileName, QnaModel qnaModel) throws IOException {

		String uploadPath = "E:\\Github-3\\feline\\src\\main\\webapp\\resources\\upload\\images";
		String fileRealName = file.getOriginalFilename();
		String fileName;
		int lastNo;
		if (oldfileName == null) {
			lastNo = qnaService.qnaLastNo();
			fileName = "feline_qna_" + lastNo+"."+fileRealName.substring(fileRealName.lastIndexOf(".")+1, fileRealName.length());

			FileUpload.fileUpload(file, uploadPath, fileName);

		} else {
			lastNo = qnaModel.getNo();
			fileName = "file_qna_" + lastNo+"."+fileRealName.substring(fileRealName.lastIndexOf(".")+1, fileRealName.length());

			File deleteFile = new File(uploadPath + oldfileName);
			deleteFile.delete();

			FileUpload.fileUpload(file, uploadPath, fileName);
		}
		qnaModel.setNo(lastNo);
		qnaModel.setImage_orgname(fileRealName);
		qnaModel.setImage_savname(fileName);
		qnaService.updateFile(qnaModel);

		return qnaModel;

	}

	
}
