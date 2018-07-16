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
	
	//이벤트 뷰 화면에서 대상 상품 목록 보여주기
	@Override
	public GoodsModel selectGoods(int goods_num) {
		return sqlSessionTemplate.selectOne("goods.selectGoods", goods_num);
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
	
	//시작할 이벤트 데이터 가져오기
	@Override
	public List<EventModel> selectStartEvent() {
		return sqlSessionTemplate.selectList("event.selectStartEvent");
	}
	
	//종료할 이벤트 데이터 가져오기
	@Override
	public List<EventModel> selectEndEvent() {
		return sqlSessionTemplate.selectList("event.selectEndEvent");
	}
	
	//이벤트 활성화/비활성화
	@Override
	public int eventOnOff(EventModel eventModel) {
		return sqlSessionTemplate.update("event.eventOnOff", eventModel);
	}
	
	//이벤트 가격 적용
	@Override
	public int eventPriceOn(int goods_num) {
		return sqlSessionTemplate.update("goods.eventPriceOn", goods_num);
	}
	
	//이벤트 후 가격 원복
	@Override
	public int eventPriceOff(int goods_num) {
		return sqlSessionTemplate.update("goods.eventPriceOff", goods_num);
	}
	
}
