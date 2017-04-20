package kr.co.foot.follow;

public class FollowVO {
	private int idx;
	private String followId;
	private String followedId;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getFollowId() {
		return followId;
	}

	public void setFollowId(String followId) {
		this.followId = followId;
	}

	public String getFollowedId() {
		return followedId;
	}

	public void setFollowedId(String followedId) {
		this.followedId = followedId;
	}

	@Override
	public String toString() {
		return "FollowVO [idx=" + idx + ", followId=" + followId + ", followedId=" + followedId + "]";
	}

}
