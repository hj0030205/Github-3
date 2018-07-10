package com.feline.admin;

import java.util.List;

import com.feline.ccr.CancleModel;
import com.feline.ccr.ChangeModel;
import com.feline.ccr.RefundModel;
import com.feline.goods.GoodsModel;
import com.feline.member.MemberModel;
import com.feline.notice.NoticeModel;
import com.feline.order.OrderModel;

public interface AdminDAO {

	/*********************** ȸ�� ���� *************************/

	// ȸ�� ���
	List<MemberModel> memberList();

	MemberModel memberSelect(String member_id);

	Object updateMember(MemberModel memberModel);

	List<MemberModel> memberSearchN(String searchKeyword);

	List<MemberModel> memberSearchI(String searchKeyword);

	List<MemberModel> memberSearchA(String searchKeyword);

	List<MemberModel> memberSearchP(String searchKeyword);

	List<MemberModel> memberSearchE(String searchKeyword);

	Object deleteMember(String member_id);

	/*********************** ��ǰ ���� *************************/

	// ��ǰ���
	List<GoodsModel> goodsList();

	// ��ǰ �� ��
	GoodsModel goodsView(int goods_num);

	// �˻�
	List<GoodsModel> goodsSearchName(String goods_name);

	List<GoodsModel> goodsSearchCategory(String goods_category);

	// ��ǰ���
	Object insertGoods(GoodsModel goodsModel);

	// �ۼ���
	int goodsModify(GoodsModel goodsModel);

	// ������ �Խù� ��ȣ ��ȯ
	int goodsLastNum();

	// ÷������ �߰� �� ����
	int updateFile(GoodsModel goodsModel);

	// �ۻ���
	int goodsDelete(int goods_num);

	/*********************** �ֹ� ���� *************************/

	List<OrderModel> orderAllList();

	// �ֹ��󼼺��� �̾ƿ���
	OrderModel OrderView(int order_num);

	List<OrderModel> orderSearchNum(String search);

	List<OrderModel> orderSearchId(String search);

	List<OrderModel> orderSearchP(String search);

	Object orderModify(OrderModel OrderModel);
	
	
	
	/**********************���/ȯ��/��ȯ����*****************************/
	//��Ҹ�� �̾ƿ���
	List<CancleModel> adOrderCancleList();
	
	//ȯ�� ��� �̾ƿ���
	List<RefundModel> adOrderRefundList();
	
	//��ȯ ��� �̾ƿ���
	List<ChangeModel> adOrderChangeList();
	

}
