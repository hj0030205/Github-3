package com.feline.faq;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class FaqService implements FaqDAO{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<FaqModel> faqList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("faq.selectAll");
	}

	@Override
	public FaqModel faqSelect(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("faq.selectFaq", no);
	}

	@Override
	public List<FaqModel> faqSearchSubject(String subject) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("faq.selectSearchS", subject);
	}

	@Override
	public List<FaqModel> faqSearchContent(String content) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("faq.selectSearchC", content);
	}

	@Override
	public int faqWrite(FaqModel faqModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("faq.insertFaq", faqModel);
	}
	@Override
	public int faqModify(FaqModel faqModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("faq.updateFaq",faqModel);
	}

	@Override
	public int faqDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("faq.deleteFaq",no);
	}

}
