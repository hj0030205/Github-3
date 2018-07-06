package com.feline.notice;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements NoticeDAO{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 공지사항 목록
	@Override
	public List<NoticeModel> noticeList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("notice.selectAll");
	}

	// 공지사항 작성
	@Override
	public int noticeWrite(NoticeModel noticeModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("notice.insertNotice", noticeModel);
	}

	// 상세 뷰
	@Override
	public NoticeModel noticeView(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("notice.selectNotice", no);
	}

	// 조회수 증가
	@Override
	public int noticeUpdateReadcount(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.updateReadHit",no);
	}

	// 제목으로 검색
	@Override
	public List<NoticeModel> noticeSearchSubject(String subject) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("notice.selectSearchS",subject);
	}

	// 내용으로 검색
	@Override
	public List<NoticeModel> noticeSearchContent(String content) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("notice.selectSearchC",content);
	}

	// 내용 수정
	@Override
	public int noticeModify(NoticeModel noticeModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.updateNotice",noticeModel);
	}

	// 글 삭제.
	@Override
	public int noticeDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.deleteNotice",no);
	}

	// 마지막 글번호 반환
	@Override
	public int noticeLastNo() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("notice.selectLastNo");
	}

	// 첨부파일 수정 및 삽입.
	@Override
	public int updateFile(NoticeModel noticeModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("notice.updateFile", noticeModel);
	}

}
