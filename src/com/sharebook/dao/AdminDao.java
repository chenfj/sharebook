package com.sharebook.dao;

import com.sharebook.entity.Admin;
/**
 * 管理员的持久层接口
 * @author 陈菲菊
 *@version 1.0
 */
public interface AdminDao {
	/**
	 * 管理员登录
	 * @param admin 管理员实体对象
	 * @return Admin 管理员实体对象
	 */
	Admin login(String loginName);

}
