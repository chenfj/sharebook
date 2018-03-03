package com.sharebook.entity;

import java.util.List;

/**
 * 用户实体类
 * @author 陈菲菊
 *@version 1.0
 */
public class User {
	private Long usid;//用户编号
	private String loginName;//登录名
	private String password;//密码
	private String nickName;//昵称
	private String email;//email
	private String phone;//联系方式
	private String address;//地址
	private String activeCode;//激活码
	private Integer state;//用户激活状态
	private String headimg;//图片路径
	private Integer nofunc;//登录名是否有效
	private List<Book> bookList;
	public Long getUsid() {
		return usid;
	}
	public void setUsid(Long usid) {
		this.usid = usid;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getActiveCode() {
		return activeCode;
	}
	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getHeadimg() {
		return headimg;
	}
	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
	public Integer getNofunc() {
		return nofunc;
	}
	public void setNofunc(Integer nofunc) {
		this.nofunc = nofunc;
	}
	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	
	
}

















