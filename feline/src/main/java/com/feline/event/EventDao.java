package com.feline.event;

import java.util.List;

import com.feline.goods.GoodsModel;

public interface EventDao {
	
	Object insertEvent(EventModel eventModel);
	List<EventModel> eventList();
	EventModel eventSelectOne(int event_num);
	GoodsModel selectGoods(int goods_num);
	int eventModify(EventModel eventModel);
	int eventDelete(int event_num);
	List<GoodsModel> goodsCategoryList(int goods_category);
	List<EventModel> selectStartEvent();
	List<EventModel> selectEndEvent();
	int eventOnOff(EventModel eventModel);
	int eventPriceOn(EventModel eventModel);
	int eventPriceOff(EventModel eventModel);

}
