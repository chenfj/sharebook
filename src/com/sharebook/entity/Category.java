package com.sharebook.entity;

import java.util.List;

/**
 * 图书类别实体类
 * @author 陈菲菊
 *@version 1.0
 */
public class Category {
	private Long cid;//图书类别编号
	private String categoryName;//图书类别名
	private List<Book> bookList;
	public Long getCid() {
		return cid;
	}
	public void setCid(Long cid) {
		this.cid = cid;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	
}
