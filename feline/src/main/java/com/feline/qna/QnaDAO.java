package com.feline.qna;

import java.util.List;

import com.feline.qna.QnaModel;;

public interface QnaDAO {
		
		//글목록
		List<QnaModel> qnaList();

		//글쓰기
		int qnaWrite(QnaModel qnaModel);
		
		//답변글 쓰기
		int qnaReplyWrite(QnaModel qnaModel);

		//글 상세보기
		QnaModel qnaView(int no);
		
		//검색
		List<QnaModel> qnaSearchSubject(String subject);
		List<QnaModel> qnaSearchContent(String content);
		List<QnaModel> qnaSearchWriter(String writer);
		
		//글수정
		int qnaModify(QnaModel qnaModel);
		
		//답변 글 변환
		int qnaSetReplyStep(QnaModel qnaModel);
		
		//답변 여부 변경.
		int qnaAnswer(int ref);
		
		//마지막 게시물 번호 반환
		int qnaLastNo();
		
		//첨부파일 추가 및 수정
		Object updateFile(QnaModel qnaModel);

		//글삭제
		int qnaDelete(int no);
}
