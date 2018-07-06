package com.feline.notice;

import java.util.List;

public interface NoticeDAO {
	//글목록
	List<NoticeModel> noticeList();

	//글쓰기
	int noticeWrite(NoticeModel noticeModel);

	//글 상세보기
	NoticeModel noticeView(int no);
	
	//조회수 증가
	int noticeUpdateReadcount(int no);
	
	//검색
	List<NoticeModel> noticeSearchSubject(String subject);
	List<NoticeModel> noticeSearchContent(String content);
	
	//글수정
	int noticeModify(NoticeModel noticeModel);
	
	//마지막 게시물 번호 반환
	int noticeLastNo();
	
	//첨부파일 추가 및 수정
	int  updateFile(NoticeModel noticeModel);

	//글삭제
	int noticeDelete(int no);
	
}
