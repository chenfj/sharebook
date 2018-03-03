package com.sharebook.dao;

import java.util.List;

import com.sharebook.entity.Category;
/**
 * 图书类别的持久层接口
 * @author 陈菲菊
 * @version 1.0
 */
public interface CategoryDao {
	/**
	 * 添加图书
	 * @param category
	 * @return 影响记录数
	 */
	int addCategory(Category category);
	/**
	 * 查找所有图书类别
	 * @return Category的集合
	 */
	List<Category> findAllCategory();
	/**
	 * 根据类别id查找
	 * @param cid 类别id
	 * @return Category
	 */
	Category findCategoryById(Long cid);
	/**
	 * 修改图书类别
	 * @param category
	 * @return 影响记录条数
	 */
	int modifyCategory(Category category);

}
