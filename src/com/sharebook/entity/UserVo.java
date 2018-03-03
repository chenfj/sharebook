package com.sharebook.entity;

public class UserVo {
	//包装类
	private Long usid;
	private String nickName;
	private String headimg;
	private String address;
	private int upNum;
	
	public int getUpNum() {
		return upNum;
	}
	public void setUpNum(int upNum) {
		this.upNum = upNum;
	}
	public Long getUsid() {
		return usid;
	}
	public void setUsid(Long usid) {
		this.usid = usid;
	}
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHeadimg() {
		return headimg;
	}
	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
