package com.feline.qna;

import java.util.List;

import com.feline.qna.QnaModel;;

public interface QnaDAO {
		
		//�۸��
		List<QnaModel> qnaList();

		//�۾���
		int qnaWrite(QnaModel qnaModel);
		
		//�亯�� ����
		int qnaReplyWrite(QnaModel qnaModel);

		//�� �󼼺���
		QnaModel qnaView(int no);
		
		//�˻�
		List<QnaModel> qnaSearchSubject(String subject);
		List<QnaModel> qnaSearchContent(String content);
		List<QnaModel> qnaSearchWriter(String writer);
		
		//�ۼ���
		int qnaModify(QnaModel qnaModel);
		
		//�亯 �� ��ȯ
		int qnaSetReplyStep(QnaModel qnaModel);
		
		//�亯 ���� ����.
		int qnaAnswer(int ref);
		
		//������ �Խù� ��ȣ ��ȯ
		int qnaLastNo();
		
		//÷������ �߰� �� ����
		Object updateFile(QnaModel qnaModel);

		//�ۻ���
		int qnaDelete(int no);
}
