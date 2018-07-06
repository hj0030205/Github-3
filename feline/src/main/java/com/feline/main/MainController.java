package com.feline.main;

import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.feline.goods.GoodsModel;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	@Resource
	private MainService mainService;

	ModelAndView mav = new ModelAndView();

	private List<GoodsModel> newGoodsList = new ArrayList<GoodsModel>();

	/* 메인페이지 */
	@RequestMapping(value = "main.cat")
	public ModelAndView main(HttpServletRequest request) {

		newGoodsList = mainService.selectNewGoodsList();

		mav.addObject("newGoodsList", newGoodsList);
		mav.setViewName("main");

		return mav;

	}

}
