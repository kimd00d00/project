package com.sist.vo;

public class ReviewLikeVO {
	
	private int no,review_3_no,like_check;
	private String member_id;
	
	
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getReview_3_no() {
		return review_3_no;
	}
	public void setReview_3_no(int review_3_no) {
		this.review_3_no = review_3_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
