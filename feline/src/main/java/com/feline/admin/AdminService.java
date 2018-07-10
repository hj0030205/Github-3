package com.feline.admin;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.order.OrderModel;

@Service
public class AdminService implements AdminDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	/*********************** ȸ�� ���� *************************/
	
	// ������ ȸ������
	// ȸ�� ���
	@Override
	public List<MemberModel> memberList() {
		return sqlSessionTemplate.selectList("member.memberList");
	}

	// ȸ�� �Ѹ� ����
	@Override
	public MemberModel memberSelect(String member_id) {
		return sqlSessionTemplate.selectOne("member.memberSelect", member_id);
	}

	// ȸ������ ����
	@Override
	public Object updateMember(MemberModel memberModel) {
		return sqlSessionTemplate.update("member.updateMember", memberModel);
	}

	// ȸ�� �˻�
	@Override
	public List<MemberModel> memberSearchN(String searchKeyword) {
		return sqlSessionTemplate.selectList("member.memberSearchN", searchKeyword);
	}

	@Override
	public List<MemberModel> memberSearchI(String searchKeyword) {
		return sqlSessionTemplate.selectList("member.memberSearchI", searchKeyword);
	}

	@Override
	public List<MemberModel> memberSearchA(String searchKeyword) {
		return sqlSessionTemplate.selectList("member.memberSearchA", searchKeyword);
	}

	@Override
	public List<MemberModel> memberSearchP(String searchKeyword) {
		return sqlSessionTemplate.selectList("member.memberSearchP", searchKeyword);
	}

	@Override
	public List<MemberModel> memberSearchE(String searchKeyword) {
		return sqlSessionTemplate.selectList("member.memberSearchE", searchKeyword);
	}

	@Override
	public Object deleteMember(String member_id) {
		return sqlSessionTemplate.update("member.deleteMember", member_id);
	}

	/*********************** ��ǰ ���� *************************/

	// ��ǰ ����Ʈ
	@Override
	public List<GoodsModel> goodsList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.selectAll");
	}

	// ��ǰ ����(�� ��)
	@Override
	public GoodsModel goodsView(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.selectGoods", goods_num);
	}

	// ��ǰ ������ �˻�
	@Override
	public List<GoodsModel> goodsSearchName(String goods_name) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.selectSearchN", goods_name);
	}

	// ��ǰ ī�װ��� �˻�
	@Override
	public List<GoodsModel> goodsSearchCategory(String goods_category) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.selectSearchC", goods_category);
	}

	// ��ǰ ���
	@Override
	public Object insertGoods(GoodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("goods.insertGoods", goodsModel);
	}

	// ��ǰ ����
	@Override
	public int goodsModify(GoodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("goods.updateGoods", goodsModel);
	}

	// ��ǰ ����
	@Override
	public int goodsDelete(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("goods.deleteGoods", goods_num);
	}

	// ������ ��ǰ ��ȣ ��ȯ(���ε� ���ϸ��� ����)
	@Override
	public int goodsLastNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.selectLastNo");
	}

	// ÷�� ���� �߰� �� ����.
	@Override
	public int updateFile(GoodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("goods.updateFile", goodsModel);
	}
	
	/*********************** �ֹ� ���� *************************/
	
	@Override
	public List<OrderModel> orderAllList(){
		return sqlSessionTemplate.selectList("order.orderAllList");
	}
	
	@Override
	public List<OrderModel> orderSearchNum(String search){
		return sqlSessionTemplate.selectList("order.orderSearchNum", "%"+search+"%");
	}
	
	@Override
	public List<OrderModel> orderSearchId(String search){
		return sqlSessionTemplate.selectList("order.orderSearchId", "%"+search+"%");
	}
	
	@Override
	public List<OrderModel> orderSearchP(String search){
		return sqlSessionTemplate.selectList("order.orderSearchP", "%"+search+"%");
	}
	
	@Override
	public Object orderModify(OrderModel OrderModel){
		return sqlSessionTemplate.update("order.orderModify", OrderModel);
	}

	@Override
	public OrderModel OrderView(int order_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.ordergetOne", order_num);
	}

	/////////////////////////////��� ��ȯ ȯ�� ��� ���� ///////////////////////////////////////////
	@Override
	public List<CancleModel> adOrderCancleList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.adOrderCancleList");
	}

	@Override
	public List<RefundModel> adOrderRefundList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.adOrderRefundList");
	}

	@Override
	public List<ChangeModel> adOrderChangeList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("order.adOrderChangeList");
	}

}
