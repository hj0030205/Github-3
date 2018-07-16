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
	
	/* ���������� */
	@RequestMapping(value = "main.cat")
	public ModelAndView main(HttpServletRequest request) {
		
		//�̺�Ʈ �����ؾ� �� ��ǰ ��� �ҷ�����
		startEventList = eventService.selectStartEvent();
		
		logger.info("startEventListSize : " + startEventList.size());
		
		if(startEventList.size() > 0) {
			String goods_num_s = null;
			
			for(int i = 0; i < startEventList.size(); i++) {
				//goods_num_s ����Ʈ ����
				goods_num_s = startEventList.get(i).getGoods_num() + ",";
				
				//status 1�� �̺�Ʈ Ȱ��ȭ
				EventModel eventModel1 = new EventModel();
				eventModel1.setStatus(1);
				eventModel1.setEvent_num(startEventList.get(i).getEvent_num());
				
				eventService.eventOnOff(eventModel1);
			}
			
			goods_num_s = goods_num_s.substring(0, goods_num_s.length() - 1);
			
			String[] goods_num_array = goods_num_s.split(",");
			
			int[] goods_num_i = new int[goods_num_array.length];
			
			for(int i = 0; i < goods_num_array.length; i++) {
				goods_num_i[i] = Integer.parseInt(goods_num_array[i]);
			}
			
			//�̺�Ʈ ���� ����
			for(int j = 0; j < goods_num_i.length; j++) {
				eventService.eventPriceOn(goods_num_i[j]);
			}
		}
		
		//�̺�Ʈ �����ؾ� �� ��ǰ ��� �ҷ�����
		endEventList = eventService.selectEndEvent();
		
		if(endEventList.size() > 0) {
			String goods_num_s = null;
			
			for(int i = 0; i < endEventList.size(); i++) {
				
				//goods_num_s ����Ʈ ����
				goods_num_s = endEventList.get(i).getGoods_num() + ",";
				
				//status=0���� �̺�Ʈ ��Ȱ��ȭ
				EventModel eventModel1 = new EventModel();
				eventModel1.setStatus(0);
				eventModel1.setEvent_num(startEventList.get(i).getEvent_num());
				
				eventService.eventOnOff(eventModel1);
			}
			
			goods_num_s = goods_num_s.substring(0, goods_num_s.length() - 1);
			
			String[] goods_num_array = goods_num_s.split(",");
			
			int[] goods_num_i = new int[goods_num_array.length];
			
			for(int i = 0; i < goods_num_array.length; i++) {
				goods_num_i[i] = Integer.parseInt(goods_num_array[i]);
			}
			
			//�̺�Ʈ ���� ����
			for(int j = 0; j < goods_num_i.length; j++) {
				eventService.eventPriceOff(goods_num_i[j]);
			}
		}
		

		newGoodsList = mainService.selectNewGoodsList();

		mav.addObject("newGoodsList", newGoodsList);
		mav.setViewName("main");

		return mav;

	}

}
