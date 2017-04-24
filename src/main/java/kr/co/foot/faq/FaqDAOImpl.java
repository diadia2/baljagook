package kr.co.foot.faq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public void insertFAQ(FaqVO faqVO) {
		sst.insert("kr.co.foot.faq.FaqDAO.insertFAQ", faqVO );
	}
	
	public List<FaqVO> getFAQList() {
		List<FaqVO> faqList = sst.selectList("kr.co.foot.faq.FaqDAO.getFAQList");
		return faqList;
	}
	
	public void removeFAQ(int idx) {
		sst.delete("kr.co.foot.faq.FaqDAO.removeFAQ", idx);
	}
	
	public void editFAQ(FaqVO faqVO) {
		sst.update("kr.co.foot.faq.FaqDAO.editFAQ", faqVO);
	}
	
	public FaqVO getFAQByIdx(int idx) {
		FaqVO faqVO = sst.selectOne("kr.co.foot.faq.FaqDAO.getFAQByIdx", idx);
		return faqVO;
	}


}
