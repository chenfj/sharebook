package com.sharebook.biz;

import com.sharebook.entity.Admin;
/**
 * 管理员的业务逻辑层
 * @author 陈菲菊
 *@version 1.0
 */
public interface AdminBiz {
	/**
	 * 管理员登录
	 * @param admin 管理员实体对象
	 * @return 0用户名错误，1 密码错误,2登录成功
	 */
	int login(Admin admin);

}
