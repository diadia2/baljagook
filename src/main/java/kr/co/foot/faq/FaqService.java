package kr.co.foot.faq;

import java.util.List;

public interface FaqService {
	
	public void insertFAQ(FaqVO faqVO);
	public List<FaqVO> getFAQList();
	public void removeFAQ(int idx);
	public void editFAQ(FaqVO faqVO);
	public FaqVO getFAQByIdx(int idx);

}
