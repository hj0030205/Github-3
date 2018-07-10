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

	/*********************** 회원 관리 *************************/
	
	// 관리자 회원관리
	// 회원 목록
	@Override
	public List<MemberModel> memberList() {
		return sqlSessionTemplate.selectList("member.memberList");
	}

	// 회원 한명 선택
	@Override
	public MemberModel memberSelect(String member_id) {
		return sqlSessionTemplate.selectOne("member.memberSelect", member_id);
	}

	// 회원정보 수정
	@Override
	public Object updateMember(MemberModel memberModel) {
		return sqlSessionTemplate.update("member.updateMember", memberModel);
	}

	// 회원 검색
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

	/*********************** 상품 관리 *************************/

	// 상품 리스트
	@Override
	public List<GoodsModel> goodsList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.selectAll");
	}

	// 상품 선택(상세 뷰)
	@Override
	public GoodsModel goodsView(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.selectGoods", goods_num);
	}

	// 상품 명으로 검색
	@Override
	public List<GoodsModel> goodsSearchName(String goods_name) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.selectSearchN", goods_name);
	}

	// 상품 카테고리로 검색
	@Override
	public List<GoodsModel> goodsSearchCategory(String goods_category) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.selectSearchC", goods_category);
	}

	// 상품 등록
	@Override
	public Object insertGoods(GoodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("goods.insertGoods", goodsModel);
	}

	// 상품 수정
	@Override
	public int goodsModify(GoodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("goods.updateGoods", goodsModel);
	}

	// 상품 삭제
	@Override
	public int goodsDelete(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("goods.deleteGoods", goods_num);
	}

	// 마지막 상품 번호 반환(업로드 파일명을 위해)
	@Override
	public int goodsLastNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.selectLastNo");
	}

	// 첨부 파일 추가 및 수정.
	@Override
	public int updateFile(GoodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("goods.updateFile", goodsModel);
	}
	
	/*********************** 주문 관리 *************************/
	
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

	/////////////////////////////취소 교환 환불 목록 보기 ///////////////////////////////////////////
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
