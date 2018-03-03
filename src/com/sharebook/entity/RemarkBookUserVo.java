package com.sharebook.entity;

import java.util.Date;

public class RemarkBookUserVo {
	private Long rid;
	private String loginName;
	private String content;
	private String bookName;
	private Date remarkTime;
	private String nickName;
	private String formalTime;
	private String headimg;
	
	public String getHeadimg() {
		return headimg;
	}
	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
	public String getFormalTime() {
		return formalTime;
	}
	public void setFormalTime(String formalTime) {
		this.formalTime = formalTime;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Long getRid() {
		return rid;
	}
	public void setRid(Long rid) {
		this.rid = rid;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Date getRemarkTime() {
		return remarkTime;
	}
	public void setRemarkTime(Date remarkTime) {
		this.remarkTime = remarkTime;
	}
	
}
