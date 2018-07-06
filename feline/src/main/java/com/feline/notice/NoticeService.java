package com.feline.notice;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements NoticeDAO{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	// �������� ���
	@Override
	public List<NoticeModel> noticeList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("notice.selectAll");
	}

	// �������� �ۼ�
	@Override
	public int noticeWrite(NoticeModel noticeModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("notice.insertNotice", noticeModel);
	}

	// �� ��
	@Override
	public NoticeModel noticeView(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("notice.selectNotice", no);
	}

	// ��ȸ�� ����
	@Override
	public int noticeUpdateReadcount(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.updateReadHit",no);
	}

	// �������� �˻�
	@Override
	public List<NoticeModel> noticeSearchSubject(String subject) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("notice.selectSearchS",subject);
	}

	// �������� �˻�
	@Override
	public List<NoticeModel> noticeSearchContent(String content) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("notice.selectSearchC",content);
	}

	// ���� ����
	@Override
	public int noticeModify(NoticeModel noticeModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.updateNotice",noticeModel);
	}

	// �� ����.
	@Override
	public int noticeDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.deleteNotice",no);
	}

	// ������ �۹�ȣ ��ȯ
	@Override
	public int noticeLastNo() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("notice.selectLastNo");
	}

	// ÷������ ���� �� ����.
	@Override
	public int updateFile(NoticeModel noticeModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.updateFile", noticeModel);
	}

}
