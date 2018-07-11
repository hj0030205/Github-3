package com.feline.event;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.goods.GoodsModel;

@Service
public class EventService implements EventDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//이벤트 추가
	@Override
	public Object insertEvent(EventModel eventModel) {
		return sqlSessionTemplate.insert("event.insertEvent", eventModel);
	}
	
	//이벤트 리스트
	@Override
	public List<EventModel> eventList() {
		return sqlSessionTemplate.selectList("event.eventList");
	}
	
	//이벤트 하나 선택
	@Override
	public EventModel eventSelectOne(int event_num) {
		return sqlSessionTemplate.selectOne("event.eventSelectOne", event_num);
	}
	
	//이벤트 수정
	@Override
	public int eventModify(EventModel eventModel) {
		return sqlSessionTemplate.update("event.eventModify", eventModel);
	}
	
	//이벤트 삭제
	public int eventDelete(int event_num) {
		return sqlSessionTemplate.delete("event.eventDelete", event_num);
	}
	
	//이벤트 추가 화면에서 goodsList 보여주기
	@Override
	public List<GoodsModel> goodsCategoryList(int goods_category){
		return sqlSessionTemplate.selectList("goods.selectCategory",goods_category);
	}
}
