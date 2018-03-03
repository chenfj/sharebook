package com.sharebook.biz;

import java.util.List;

import com.sharebook.entity.Category;
/**
 * 后台图书类别的业务逻辑层
 * @author 陈菲菊
 *@version 1.0
 */
public interface CategoryBiz {
	/**
	 * 添加图书类别
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
	 * 根据图书类别id查找
	 * @param cid 类别id
	 * @return Category
	 */
	Category findCategoryById(Long cid);
	/**
	 * 修改类别名称
	 * @param category
	 * @return 影响记录数
	 */
	int modifyCategory(Category category);

}
