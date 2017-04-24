package kr.co.foot.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	FaqDAO faqDAO;
	
	public void insertFAQ(FaqVO faqVO) {
		faqDAO.insertFAQ(faqVO);
	}
	
	public List<FaqVO> getFAQList() {
		List<FaqVO> faqList = faqDAO.getFAQList();
		return faqList;
	}
	
	public void removeFAQ(int idx) {
		faqDAO.removeFAQ(idx);
	}
	
	public void editFAQ(FaqVO faqVO) {
		faqDAO.editFAQ(faqVO);
	}
	
	public FaqVO getFAQByIdx(int idx) {
		FaqVO faqVO = faqDAO.getFAQByIdx(idx);
		return faqVO;
	}

}
