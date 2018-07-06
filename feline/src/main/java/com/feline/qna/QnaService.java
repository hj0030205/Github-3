package com.feline.qna;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class QnaService implements QnaDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// �� ���
	@Override
	public List<QnaModel> qnaList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectAll");
	}

	// �� ����
	@Override
	public int qnaWrite(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("qna.insertQna", qnaModel);
	}

	// �亯 �� ����
	@Override
	public int qnaReplyWrite(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("qna.insertReplyQna", qnaModel);
	}

	// �� ��
	@Override
	public QnaModel qnaView(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qna.selectQna", no);
	}

	// �������� �˻�
	@Override
	public List<QnaModel> qnaSearchSubject(String subject) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectSearchS", subject);
	}

	// �������� �˻�
	@Override
	public List<QnaModel> qnaSearchContent(String content) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectSearchC", content);
	}

	// �ۼ��ڷ� �˻�
	@Override
	public List<QnaModel> qnaSearchWriter(String writer) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.selectSearchW", writer);
	}

	// �Խù� ����
	@Override
	public int qnaModify(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateQna", qnaModel);
	}

	// ������ �Խù� ��ȣ ��ȯ(���ε����ϸ� �ۼ��� ���)
	@Override
	public int qnaLastNo() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qna.selectLastNo");
	}

	// ���ε� �߰� �� ����
	@Override
	public Object updateFile(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateFile", qnaModel);
	}

	// �亯 �� �Խù��� ��ȯ.
	@Override
	public int qnaSetReplyStep(QnaModel qnaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateReplyStep", qnaModel);
	}

	// �亯 ���� ����.
	@Override
	public int qnaAnswer(int ref) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.updateAnswer", ref);
	}

	// �Խù� ����
	@Override
	public int qnaDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.deleteQna", no);
	}

}
