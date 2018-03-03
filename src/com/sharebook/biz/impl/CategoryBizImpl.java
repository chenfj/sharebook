package com.sharebook.biz.impl;

import java.util.List;

import com.sharebook.biz.CategoryBiz;
import com.sharebook.dao.CategoryDao;
import com.sharebook.dao.impl.CategoryDaoImpl;
import com.sharebook.entity.Category;

public class CategoryBizImpl implements CategoryBiz{
	private CategoryDao  categoryDao = new CategoryDaoImpl();
	@Override
	public int addCategory(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.addCategory(category);
	}
	@Override
	public List<Category> findAllCategory() {
		// TODO Auto-generated method stub
		return categoryDao.findAllCategory();
	}
	@Override
	public Category findCategoryById(Long cid) {
		// TODO Auto-generated method stub
		return categoryDao.findCategoryById(cid);
	}
	@Override
	public int modifyCategory(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.modifyCategory(category);
	}
}
