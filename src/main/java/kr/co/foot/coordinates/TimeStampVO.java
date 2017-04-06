package kr.co.foot.coordinates;

public class TimeStampVO {

	private String id;
	private String startTime;
	private String endTime;

	public TimeStampVO(){
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "TimeStampVO [id=" + id + ", startTime=" + startTime + ", endTime=" + endTime + ", toString()="
				+ super.toString() + "]";
	}

	
	
}
