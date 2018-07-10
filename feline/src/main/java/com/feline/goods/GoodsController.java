package com.feline.goods;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Resource
	private GoodsService goodsService;
	
	ModelAndView mav=new ModelAndView();
	
	@RequestMapping("goodsList.cat")
	public ModelAndView goodsList(HttpServletRequest request) throws Exception{
		
		List<GoodsModel> goodsList=goodsService.goodsList();
		
		mav.addObject("goodsList", goodsList);
		mav.setViewName("goodsList");
		
		return mav;		
	}
	
	@RequestMapping("goodsCategoryList.cat")
	public ModelAndView goodsCategoryList(HttpServletRequest request) throws Exception{
		
		String goods_categoryy = request.getParameter("goods_category");
		
		List<GoodsModel> goodsCategoryList = goodsService.goodsCategoryList(goods_categoryy);
		
		mav.addObject("category",goods_categoryy);
		mav.addObject("goodsList", goodsCategoryList);
		mav.setViewName("goodsList");
		return mav;
	}
	
	@RequestMapping("goodsView.cat")
	public ModelAndView goodsView(HttpServletRequest request) throws Exception{
		
		int goods_num = Integer.parseInt(request.getParameter("goods_num"));
		
		GoodsModel goodsModel = goodsService.goodsView(goods_num);
		
		String category = goodsModel.getGoods_category();
		
		mav.addObject("category", category);
		mav.addObject("goodsModel",goodsModel);
		mav.setViewName("goodsView");
		
		return mav;
	}
	
	/*@RequestMapping("goodsSearchList.cat")
	public ModelAndView goodsSearchList(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		String search = request.getParameter("search");
		
		List<GoodsModel> goodslist = goodsService.goodsSearchList(search);
		
		mav.addObject("goodsList", goodslist);
		mav.setViewName("goodsList");
		
		return mav;
	}*/

}
