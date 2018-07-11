package com.feline.event;

import java.util.List;

import com.feline.goods.GoodsModel;

public interface EventDao {
	
	Object insertEvent(EventModel eventModel);
	List<EventModel> eventList();
	EventModel eventSelectOne(int event_num);
	int eventModify(EventModel eventModel);
	int eventDelete(int event_num);
	List<GoodsModel> goodsCategoryList(int goods_category);

}
