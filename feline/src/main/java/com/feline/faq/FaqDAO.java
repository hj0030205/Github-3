package com.feline.faq;

import java.util.List;

public interface FaqDAO {
	// �۸��
	List<FaqModel> faqList();

	// �۾���
	int faqWrite(FaqModel faqModel);

	// �ۼ���
	FaqModel faqSelect(int no);

	// �˻�
	List<FaqModel> faqSearchSubject(String subject);

	List<FaqModel> faqSearchContent(String content);

	// �ۼ���
	int faqModify(FaqModel faqModel);

	// �ۻ���
	int faqDelete(int no);

}
