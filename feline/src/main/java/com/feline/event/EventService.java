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
	
	//�̺�Ʈ �߰�
	@Override
	public Object insertEvent(EventModel eventModel) {
		return sqlSessionTemplate.insert("event.insertEvent", eventModel);
	}
	
	//�̺�Ʈ ����Ʈ
	@Override
	public List<EventModel> eventList() {
		return sqlSessionTemplate.selectList("event.eventList");
	}
	
	//�̺�Ʈ �ϳ� ����
	@Override
	public EventModel eventSelectOne(int event_num) {
		return sqlSessionTemplate.selectOne("event.eventSelectOne", event_num);
	}
	
	//�̺�Ʈ ����
	@Override
	public int eventModify(EventModel eventModel) {
		return sqlSessionTemplate.update("event.eventModify", eventModel);
	}
	
	//�̺�Ʈ ����
	public int eventDelete(int event_num) {
		return sqlSessionTemplate.delete("event.eventDelete", event_num);
	}
	
	//�̺�Ʈ �߰� ȭ�鿡�� goodsList �����ֱ�
	@Override
	public List<GoodsModel> goodsCategoryList(int goods_category){
		return sqlSessionTemplate.selectList("goods.selectCategory",goods_category);
	}
}
