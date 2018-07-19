package com.feline.member;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
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
	public String adminLogin(MemberModel adminModel) {
		return sqlSessionTemplate.selectOne("member.adminLogin", adminModel);
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
	public void orderCancle(CancleModel cancleModel,OrderModel orderModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("order.insertCancle", cancleModel);
		sqlSessionTemplate.update("order.orderCancle", orderModel);
	}

	@Override
	public void clientOrderRefund(RefundModel refundModel,OrderModel orderModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("order.insertRefund",refundModel);
		sqlSessionTemplate.update("order.orderRefund", orderModel);
	}

	@Override
	public void clientOrderChange(ChangeModel changeModel,OrderModel orderModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("order.insertChange",changeModel);
		sqlSessionTemplate.update("order.orderChange", orderModel);
	}

	@Override
	public List<OrderModel> orderCancleList(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.orderCancleList", member_id);
	}

	@Override
	public List<OrderModel> orderRefundList(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.orderRefundList",member_id);
	}

	@Override
	public List<OrderModel> orderChangeList(String member_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.orderChangeList",member_id);
	}

	@Override
	public CancleModel orderCancleOne(CancleModel cancleModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.orderCancleOne", cancleModel);
	}

	@Override
	public RefundModel orderRefundOne(RefundModel refundModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.orderRefundOne", refundModel);
	}

	@Override
	public ChangeModel orderChangeOne(ChangeModel changeModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.orderChangeOne", changeModel);
	}
	
	@Override
	public List<OrderModel> b_selectOrder(String order_trade_num) {
		return sqlSessionTemplate.selectList("order.b_selectOrder", order_trade_num);
	}
	
	//비회원 취소목록 가져오기
	public List<OrderModel> b_orderCancleList(String order_trade_num) {
		return sqlSessionTemplate.selectList("order.b_orderCancleList", order_trade_num);
	}
	 
	 //비회원 주문취소 상세보기
	public CancleModel b_orderCancleOne(int order_num) {
		return sqlSessionTemplate.selectOne("order.b_orderCancleOne", order_num);
	}
	 
	 //비회원 환불목록 가져오기
	public List<OrderModel> b_orderRefundList(String order_trade_num) {
		return sqlSessionTemplate.selectList("order.b_orderRefundList", order_trade_num);
	}
	 
	 //비회원 환불목록 상세보기
	public RefundModel b_orderRefundOne(int order_num) {
		return sqlSessionTemplate.selectOne("order.b_orderRefundOne", order_num);
	}
	 
	 //비회원 교환목록 가져오기
	public List<OrderModel> b_orderChangeList(String order_trade_num) {
		return sqlSessionTemplate.selectList("order.b_orderChangeList", order_trade_num);
	}
	 
	 //비회원 교환목록 상세보기
	public ChangeModel b_orderChangeOne(int order_num) {
		return sqlSessionTemplate.selectOne("order.b_orderChangeOne", order_num);
	}

}