package kr.co.foot.board.vo;

public class RegMapVO {
	private int idx;
	private String s_date;
	private String e_date;
	private int view;
	private int like;
	private int blind;
	private int report;
	private int city;
	private int theme;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getBlind() {
		return blind;
	}

	public void setBlind(int blind) {
		this.blind = blind;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}

	public int getTheme() {
		return theme;
	}

	public void setTheme(int theme) {
		this.theme = theme;
	}

	@Override
	public String toString() {
		return "RegMapVO [idx=" + idx + ", s_date=" + s_date + ", e_date=" + e_date + ", view=" + view + ", like="
				+ like + ", blind=" + blind + ", report=" + report + ", city=" + city + ", theme=" + theme + "]";
	}

}
