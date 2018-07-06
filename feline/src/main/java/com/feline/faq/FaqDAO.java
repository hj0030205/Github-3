package com.feline.faq;

import java.util.List;

public interface FaqDAO {
	// 글목록
	List<FaqModel> faqList();

	// 글쓰기
	int faqWrite(FaqModel faqModel);

	// 글선택
	FaqModel faqSelect(int no);

	// 검색
	List<FaqModel> faqSearchSubject(String subject);

	List<FaqModel> faqSearchContent(String content);

	// 글수정
	int faqModify(FaqModel faqModel);

	// 글삭제
	int faqDelete(int no);

}
