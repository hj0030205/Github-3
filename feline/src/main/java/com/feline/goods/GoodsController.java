package com.feline.goods;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		
		mav.addObject("search", null);
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
	
	@RequestMapping("goodsSearchList.cat")
	public ModelAndView goodsSearchList(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		
		String search = request.getParameter("search");
		
		List<GoodsModel> goodslist = goodsService.goodsSearchList(search);
		
		String minprice = request.getParameter("minprice");
		String maxprice = request.getParameter("maxprice");
		String category = request.getParameter("category");
		String fromyear = request.getParameter("fromyear");
		String frommonth =request.getParameter("frommonth");
		String toyear = request.getParameter("toyear");
		String tomonth =request.getParameter("tomonth");
		
		if(!category.equals(""))
		{
			if(search.equals(""))
			{
				mav.addObject("search", null);
				mav.addObject("goodsList", goodslist);
				mav.setViewName("goodsList");
				
				return mav;
			}
			
			else 
			{
				for(int i = 0; i < goodslist.size(); i++) 
				{
					for(int j = 0; !goodslist.get(i).getGoods_category().equals(category); j++)
					{
						goodslist.remove(i);
						
						if(goodslist.size() == 0 || goodslist.size() == 1)
						{
							break;
						}
					}
				}
			}
		}
			
		if(!minprice.equals(""))
		{
			if(search.equals(""))
			{
				mav.addObject("search", null);
				mav.addObject("goodsList", goodslist);
				mav.setViewName("goodsList");
				
				return mav;
			}
			
			else 
			{
				for(int i = 0; i < goodslist.size(); i++) 
				{
					for(int j = 0; goodslist.get(i).getGoods_price() < Integer.parseInt(minprice); j++)
					{
						goodslist.remove(i);
						
						if(goodslist.size() == 0)
						{
							break;
						}
					}
				}
			}
		}
		
		if(!maxprice.equals(""))
		{
			if(search.equals(""))
			{
				mav.addObject("search", null);
				mav.addObject("goodsList", goodslist);
				mav.setViewName("goodsList");
				
				return mav;
			}
			
			else 
			{
				for(int i = 0; i < goodslist.size(); i++) 
				{
					for(int j = 0; Integer.parseInt(maxprice) < goodslist.get(i).getGoods_price(); j++)
					{
						goodslist.remove(i);
						
						if(goodslist.size() == 0)
						{
							break;
						}
					}
				}
			}
		}
		
		if(!fromyear.equals("") && !frommonth.equals(""))
		{
			if(search.equals(""))
			{
				mav.addObject("search", null);
				mav.addObject("goodsList", goodslist);
				mav.setViewName("goodsList");
				
				return mav;
			}
			
			else 
			{
				Date fromdate = new Date();
				fromdate.setYear(Integer.parseInt(fromyear));
				fromdate.setMonth(Integer.parseInt(frommonth));
				
				for(int i = 0; i < goodslist.size(); i++) 
				{
					for(int j = 0; goodslist.get(i).getGoods_date().before(fromdate) ; j++)
					{
						goodslist.remove(i);
						
						if(goodslist.size() == 0)
						{
							break;
						}
					}
				}
			}
		}
		
		if(!toyear.equals("") && !tomonth.equals(""))
		{		
			if(search.equals(""))
			{
				mav.addObject("search", null);
				mav.addObject("goodsList", goodslist);
				mav.setViewName("goodsList");
				
				return mav;
			}
			
			else 
			{
				Date todate = new Date();
				todate.setYear(Integer.parseInt(toyear));
				todate.setMonth(Integer.parseInt(tomonth));
				
				for(int i = 0; i < goodslist.size(); i++) 
				{
					for(int j = 0; goodslist.get(i).getGoods_date().after(todate) ; j++)
					{
						goodslist.remove(i);
						
						if(goodslist.size() == 0)
						{
							break;
						}
					}
				}
			}
		}
		
		mav.addObject("search", search);
		mav.addObject("goodsList", goodslist);
		mav.setViewName("goodsList");
		
		return mav;
	}

}
