package com.feline.qna;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class QnaService implements QnaDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// 글 목록
	@Override
	public List<QnaModel> qnaList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectAll");
	}

	// 글 쓰기
	@Override
	public int qnaWrite(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("qna.insertQna", qnaModel);
	}

	// 답변 글 쓰기
	@Override
	public int qnaReplyWrite(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("qna.insertReplyQna", qnaModel);
	}

	// 상세 뷰
	@Override
	public QnaModel qnaView(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qna.selectQna", no);
	}

	// 제목으로 검색
	@Override
	public List<QnaModel> qnaSearchSubject(String subject) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectSearchS", subject);
	}

	// 내용으로 검색
	@Override
	public List<QnaModel> qnaSearchContent(String content) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectSearchC", content);
	}

	// 작성자로 검색
	@Override
	public List<QnaModel> qnaSearchWriter(String writer) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectSearchW", writer);
	}

	// 게시물 수정
	@Override
	public int qnaModify(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateQna", qnaModel);
	}

	// 마지막 게시물 번호 반환(업로드파일명 작성시 사용)
	@Override
	public int qnaLastNo() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qna.selectLastNo");
	}

	// 업로드 추가 및 수정
	@Override
	public Object updateFile(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateFile", qnaModel);
	}

	// 답변 된 게시물로 변환.
	@Override
	public int qnaSetReplyStep(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateReplyStep", qnaModel);
	}

	// 답변 상태 변경.
	@Override
	public int qnaAnswer(int ref) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateAnswer", ref);
	}

	// 게시물 삭제
	@Override
	public int qnaDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.deleteQna", no);
	}

}
