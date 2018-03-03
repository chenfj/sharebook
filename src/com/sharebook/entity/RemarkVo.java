package com.sharebook.entity;

import java.util.Date;

/**
 * 包装类
 * @author 陈菲菊
 *
 */
public class RemarkVo{
	
	private String headimg;
	private String nickName;
	private Long bid;
	private Long usid;
	private Long rid;
	private Date remarkTime;
	private String content;
	private Integer remarkState;
	private String formalTime;
	
	public String getFormalTime() {
		return formalTime;
	}
	public void setFormalTime(String formalTime) {
		this.formalTime = formalTime;
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
	public Long getBid() {
		return bid;
	}
	public void setBid(Long bid) {
		this.bid = bid;
	}
	public Long getUsid() {
		return usid;
	}
	public void setUsid(Long usid) {
		this.usid = usid;
	}
	public String getHeadimg() {
		return headimg;
	}
	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
}
