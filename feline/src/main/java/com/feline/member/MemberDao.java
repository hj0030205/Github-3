package com.feline.member;

import java.util.List;

import com.feline.goods.GoodsModel;
import com.feline.order.OrderModel;

public interface MemberDao 
{
	//�α���
	 String memberLogin(MemberModel memberModel);

	 //ȸ�� ���� ��������
	 MemberModel getMember(String id);

	// ���̵� üũ
	 String idCheck(String member_id);
	
	//�̸��� üũ
	 String emailCheck(String email);
	
	//ȸ�� ����
	 Object insertMember(MemberModel memberModel);

	// ���̵� ã��
	 String idFindByName(MemberModel memberModel);
	
	//��й�ȣ ã��
	 String pwFindById(MemberModel memberModel);

	// ȸ�� ���� ����
	 Object memberModify(MemberModel memberModel);

	// ȸ�� Ż��
	 Object memberDelete(String id);
	
	//�ֱ��ֹ����10���̾ƿ��� 
	 List<OrderModel> selectNewOrderList(String member_id);
	
	//�ֹ� ��� ��������
	 List<OrderModel> OrderList(String member_id);

	//�ֹ� �󼼺��� ��������
	 OrderModel OrdergetOne(int order_num);
	 
	 //�ֹ� ��ǰ ���� ��������
	 GoodsModel goodsView(int goods_num);	

}
