package com.sharebook.entity;

import java.util.Date;
import java.util.List;
/**
 * 图书实体类
 * @author 陈菲菊
 *@version 1.0
 */
public class Book {

	private Long bid;//图书编号
	private String bookName;//书名
	private String author;//作者
	private String press;//出版社
	private Date publishTime;//出版时间
	private Date uploadTime;//上传时间
	private Integer edition;//版次
	private String bookImg;//书图片
	private Integer dealType;//交易类型
	private Integer bookState;//审核状态
	private User user;//用户
	private Category category;//图书类别
	private List<Remark>remarkList;
	private String dealState;//图书交易状态
	
	public String getDealState() {
		return dealState;
	}
	public void setDealState(String dealState) {
		this.dealState = dealState;
	}
	public List<Remark> getRemarkList() {
		return remarkList;
	}
	public void setRemarkList(List<Remark> remarkList) {
		this.remarkList = remarkList;
	}
	public Long getBid() {
		return bid;
	}
	public void setBid(Long bid) {
		this.bid = bid;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public Integer getEdition() {
		return edition;
	}
	public void setEdition(Integer edition) {
		this.edition = edition;
	}
	public String getBookImg() {
		return bookImg;
	}
	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}
	public Integer getDealType() {
		return dealType;
	}
	public void setDealType(Integer dealType) {
		this.dealType = dealType;
	}
	public Integer getBookState() {
		return bookState;
	}
	public void setBookState(Integer bookState) {
		this.bookState = bookState;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
}
