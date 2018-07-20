package com.feline.main;

import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.feline.goods.GoodsModel;
import com.feline.event.EventModel;
import com.feline.event.EventService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	@Resource
	private MainService mainService;
	
	@Resource
	private EventService eventService;

	ModelAndView mav = new ModelAndView();

	private List<GoodsModel> newGoodsList = new ArrayList<GoodsModel>();
	
	private List<EventModel> startEventList = new ArrayList<EventModel>();
	private List<EventModel> endEventList = new ArrayList<EventModel>();
	
	private Logger logger = Logger.getLogger(getClass());
	
	/* 메인화면 */
	@RequestMapping(value = "main.cat")
	public ModelAndView main(HttpServletRequest request) {
		
		//시작할 이벤트 가져오기
		startEventList = eventService.selectStartEvent();
		
		logger.info("startEventListSize : " + startEventList.size());
		
		if(startEventList.size() > 0) {
			String goods_num_s = null;
			
			for(int i = 0; i < startEventList.size(); i++) {
				//goods_num_s 파싱해서 이벤트 가격 조정
				goods_num_s = startEventList.get(i).getGoods_num();
				String[] goods_num_array = goods_num_s.split(",");
				
				int event_num = startEventList.get(i).getEvent_num();
				
				for(int j = 0; j < goods_num_array.length; j++) {
					
					EventModel eventModel = new EventModel();
					
					eventModel.setGoods_num(goods_num_array[j]);
					eventModel.setEvent_num(event_num);
					
					eventService.eventPriceOn(eventModel);
				}
				
				//status 1로 활성화
				EventModel eventModel1 = new EventModel();
				
				eventModel1.setStatus(1);
				eventModel1.setEvent_num(startEventList.get(i).getEvent_num());
				
				eventService.eventOnOff(eventModel1);
			}
		}
		
		//종료할 이벤트 가져오기
		endEventList = eventService.selectEndEvent();
		
		if(endEventList.size() > 0) {
			String goods_num_s = null;
			
			for(int i = 0; i < endEventList.size(); i++) {
				
				//goods_num_s 파싱해서 이벤트 가격 조정
				goods_num_s = startEventList.get(i).getGoods_num();
				String[] goods_num_array = goods_num_s.split(",");
				
				int event_num = endEventList.get(i).getEvent_num();
				
				for(int j = 0; j < goods_num_array.length; j++) {
					
					EventModel eventModel = new EventModel();
					
					eventModel.setGoods_num(goods_num_array[j]);
					eventModel.setEvent_num(event_num);
					
					eventService.eventPriceOff(eventModel);
				}
				
				//status=0으로 비활성화
				EventModel eventModel1 = new EventModel();
				eventModel1.setStatus(0);
				eventModel1.setEvent_num(startEventList.get(i).getEvent_num());
				
				eventService.eventOnOff(eventModel1);
			}
		}
		

		newGoodsList = mainService.selectNewGoodsList();

		mav.addObject("newGoodsList", newGoodsList);
		mav.setViewName("main");

		return mav;

	}

}
