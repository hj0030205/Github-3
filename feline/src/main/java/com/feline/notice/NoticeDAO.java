package com.feline.notice;

import java.util.List;

public interface NoticeDAO {
	//�۸��
	List<NoticeModel> noticeList();

	//�۾���
	int noticeWrite(NoticeModel noticeModel);

	//�� �󼼺���
	NoticeModel noticeView(int no);
	
	//��ȸ�� ����
	int noticeUpdateReadcount(int no);
	
	//�˻�
	List<NoticeModel> noticeSearchSubject(String subject);
	List<NoticeModel> noticeSearchContent(String content);
	
	//�ۼ���
	int noticeModify(NoticeModel noticeModel);
	
	//������ �Խù� ��ȣ ��ȯ
	int noticeLastNo();
	
	//÷������ �߰� �� ����
	int  updateFile(NoticeModel noticeModel);

	//�ۻ���
	int noticeDelete(int no);
	
}
