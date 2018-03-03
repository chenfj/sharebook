package com.sharebook.entity;

import java.util.Date;

/**
 * 评论实体类
 * @author Administrator
 *@version
 */
public class Remark {
	//rid ,remark_time,content,usid,bid
	private Long rid;//评论编号
	private Date remarkTime;//评论日期
	private String content;//评论内容
	private Integer remarkState;//评论状态
	private User user;//用户
	private Book book;//图书
	private String formal;
	
	public String getFormal() {
		return formal;
	}
	public void setFormal(String formal) {
		this.formal = formal;
	}
	public Integer getRemarkState() {
		return remarkState;
	}
	public void setRemarkState(Integer remarkState) {
		this.remarkState = remarkState;
	}
	public Long getRid() {
		return rid;
	}
	public void setRid(Long rid) {
		this.rid = rid;
	}
	public Date getRemarkTime() {
		return remarkTime;
	}
	public void setRemarkTime(Date remarkTime) {
		this.remarkTime = remarkTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
}
