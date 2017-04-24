package kr.co.foot.faq;

public class FaqVO {
	
	private int idx;
	private String title;
	private String content;
	private String regdate;
	private String order;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "FaqVO [idx=" + idx + ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", order="
				+ order + "]";
	}


}
