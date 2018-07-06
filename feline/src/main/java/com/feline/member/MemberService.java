package com.feline.member;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.goods.GoodsModel;
import com.feline.order.OrderModel;

@Service
public class MemberService implements MemberDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
    public String memberLogin(MemberModel member) {
	    return sqlSessionTemplate.selectOne("member.login", member);
    }

	@Override
	public MemberModel getMember(String id) {
		return sqlSessionTemplate.selectOne("member.memberSelect", id);
	}

	@Override
	public String idCheck(String member_id) {
		return sqlSessionTemplate.selectOne("member.idCheck", member_id);
	}
	
	@Override
	public String emailCheck(String email) {
		return sqlSessionTemplate.selectOne("member.emailCheck", email);
	}

	@Override
	public Object insertMember(MemberModel member) {
		return sqlSessionTemplate.insert("member.insertMember", member);
	}
	
	@Override
	public String idFindByName(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.idfind", member);
    }
	
	@Override
	public String pwFindById(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.pwfind", member);
    }
    
	@Override
	public Object memberModify(MemberModel member) {
		return sqlSessionTemplate.update("member.updateMember", member);
	}
	
	@Override
	public Object memberDelete(String id) {
		return sqlSessionTemplate.delete("member.deleteMember", id);
    }

	@Override
	public List<OrderModel> selectNewOrderList(String member_id) {
		return sqlSessionTemplate.selectList("order.selectNewOrderList",member_id);
	}

	@Override
	public List<OrderModel> OrderList(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.orderList", member_id);
	}

	@Override
	public OrderModel OrdergetOne(int order_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.ordergetOne", order_num);
	}

	@Override
	public GoodsModel goodsView(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.selectGoods",goods_num);
	}

	@Override
	public void orderCancle(int order_num) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("order.insertCancle", order_num);
		sqlSessionTemplate.update("order.orderCancle", order_num);
	}

}