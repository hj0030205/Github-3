package com.feline.admin;

import java.util.List;
import java.util.Map;

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

	/**************** 대쉬보드 body 상단 차트 *********************/
	
	public int countTrade() {
		return sqlSessionTemplate.selectOne("admin.countTrade");
	}
	public int countTrans() {
		return sqlSessionTemplate.selectOne("admin.countTrans");
	}
	public int countTrans2() {
		return sqlSessionTemplate.selectOne("admin.countTrans2");
	}
	public int todayMember() {
		return sqlSessionTemplate.selectOne("admin.todayMember");
	}
	public int todayOrder() {
		return sqlSessionTemplate.selectOne("admin.todayOrder");
	}
	public int todaySalesM() {
		return sqlSessionTemplate.selectOne("admin.todaySalesM");
	}
	
	/*************** 대쉬보드 body 하단 차트 *********************/
	
	public List<GoodsModel> todaySalesGoods() {
		return sqlSessionTemplate.selectList("admin.todaySalesGoods");
	}
	public List<ChartModel> todayMemberAge() {
		return sqlSessionTemplate.selectList("admin.todayMemberAge");
	}
	public List<ChartModel> todayMemberRegion() {
		return sqlSessionTemplate.selectList("admin.todayMemberRegion");
	}
	public List<ChartModel> todayOrderAge() {
		return sqlSessionTemplate.selectList("admin.todayOrderAge");
	}
	public List<ChartModel> todayOrderRegion() {
		return sqlSessionTemplate.selectList("admin.todayOrderRegion");
	}
	
	/************************ 통계 차트 *********************/
	
	@Override
	public List<ChartModel> chartAllM() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.chartAllM");
	}

	@Override
	public List<ChartModel> chartNewM() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.chartNewM");
	}

	@Override
	public List<ChartModel> memberAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.memberAge");
	}

	@Override
	public List<ChartModel> newMemberAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.newMemberAge");
	}

	@Override
	public List<ChartModel> memberRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.memberRegion");
	}

	@Override
	public List<ChartModel> newMemberRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.newMemberRegion");
	}
	
	/* ----------------------------------------------------------------------------------- */

	@Override
	public List<GoodsModel> GoodsSelling() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.GoodsSelling");
	}

	@Override
	public List<GoodsModel> monthGoodsSelling() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthGoodsSelling");
	}

	@Override
	public List<GoodsModel> weekGoodsSelling() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekGoodsSelling");
	}

	/* ----------------------------------------------------------------------------------- */
	
	@Override
	public List<ChartModel> monthOrderNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthOrderNum");
	}

	@Override
	public List<ChartModel> monthSales() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthSales");
	}

	@Override
	public List<ChartModel> weekOrderNum() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekOrderNum");
	}

	@Override
	public List<ChartModel> weekSales() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekSales");
	}

	@Override
	public List<ChartModel> monthOrderAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthOrderAge");
	}

	@Override
	public List<ChartModel> weekOrderAge() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekOrderAge");
	}

	@Override
	public List<ChartModel> monthOrderRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.monthOrderRegion");
	}

	@Override
	public List<ChartModel> weekOrderRegion() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("admin.weekOrderRegion");
	}
	
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
	public List<MemberModel> searchMemberList(Map map) {
		return sqlSessionTemplate.selectList("member.searchMemberList", map);
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

	// 상품 검색
	@Override
	public List<GoodsModel> goodsSearch(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.searchGoods", map);
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

	@Override
	public OrderModel adOrderCancleView(int order_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.adOrderCancleView", order_num);
	}
	
	@Override
	public CancleModel adOrderCancleView2(int cancle_num) {
		return sqlSessionTemplate.selectOne("order.adOrderCancleView2", cancle_num);
	}

	@Override
	public GoodsModel adOrderCancleView3(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.adOrderCancleView3",goods_num);
	}

	@Override
	public OrderModel adOrderRefundView(int order_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.adOrderRefundView", order_num);
	}

	@Override
	public RefundModel adOrderRefundView2(int trade_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.adOrderRefundView2", trade_num);
	}

	@Override
	public GoodsModel adOrderRefundView3(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.adOrderRefundView3",goods_num);
	}

	@Override
	public OrderModel adOrderChangeView(int order_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.adOrderChangeView", order_num);
	}

	@Override
	public ChangeModel adOrderChangeView2(int change_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("order.adOrderChangeView2", change_num);
	}

	@Override
	public GoodsModel adOrderChangeView3(int goods_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("goods.adOrderChangeView3",goods_num);
	}

	@Override
	public void adOrderRefundAgree(OrderModel orderModel, RefundModel refundModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("order.orderRefundAgree",orderModel);
		sqlSessionTemplate.update("order.adOrderRefundAgree",refundModel);
	}

	@Override
	public void adOrderRefundRefuse(OrderModel orderModel, RefundModel refundModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("order.orderRefundRefuse",orderModel);
		sqlSessionTemplate.update("order.adOrderRefundRefuse",refundModel);
	}

	@Override
	public void adOrderChangeAgree(OrderModel orderModel, ChangeModel changeModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("order.orderChangeAgree",orderModel);
		sqlSessionTemplate.update("order.adOrderChangeAgree",changeModel);
	}

	@Override
	public void adOrderChangeRefuse(OrderModel orderModel, ChangeModel changeModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("order.orderChangeRefuse",orderModel);
		sqlSessionTemplate.update("order.adOrderChangeRefuse",changeModel);
	}


}
