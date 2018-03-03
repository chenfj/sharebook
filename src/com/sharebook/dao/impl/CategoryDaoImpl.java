package com.sharebook.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sharebook.dao.CategoryDao;
import com.sharebook.dao.MybatisBaseDao;
import com.sharebook.entity.Category;

public class CategoryDaoImpl implements CategoryDao{

	@Override
	public int addCategory(Category category) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.insert("com.sharebook.dao.CategoryDao.addCategory", category);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public List<Category> findAllCategory() {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<Category> categoryList = session.selectList("com.sharebook.dao.CategoryDao.findAllCategory");
		session.commit();
		session.close();
		return categoryList;
	}
	@Override
	public Category findCategoryById(Long cid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		Category category = session.selectOne("com.sharebook.dao.CategoryDao.findCategoryById", cid);
		return category;
	}
	@Override
	public int modifyCategory(Category category) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.CategoryDao.modifyCategory", category);
		session.commit();
		session.close();
		return res;
	}
}
