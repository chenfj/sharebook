package com.sharebook.dao;

import java.util.List;

import com.sharebook.entity.User;
import com.sharebook.entity.UserVo;
import com.sharebook.pager.PageBean;

/**
 * 用户持久层接口
 * @author 陈菲菊
 *@version 1.0
 */
public interface UserDao {
	/**
	 * 根据登录名检查登录名是否存在
	 * @param loginName 登录名
	 * @return User实体对象
	 */
	User checkUserLoginName(String loginName);
	/**
	 * 用户注册
	 * @param user 用户实体对象
	 * @return 0注册失败，1注册成功
	 */
	int regist(User user);
	/**
	 * 根据激活码查找用户
	 * @param code激活码
	 * @return User实体对象
	 */
	User findUserByCode(String code);
	/**
	 * 激活成功后修改用户状态为1，激活码为null
	 * @param existUser
	 */
	void update(User existUser);
	/**
	 * 根据用户数据查找用户
	 * @param user 用户实体对象
	 * @return User用户实体对象
	 */
	User getUserByLoginUser(User user);
	/**
	 * 修改用户密码
	 * @param user用户实体对象
	 * @return 1修改密码成功 0 修改失败
	 */
	int updatePassword(User user);
	/**
	 * 修改用户信息
	 * @param user用户实体对象
	 * @return 1修改失败，0修改成功
	 */
	int updatePerson(User user);
	/**
	 * 用户上传头像
	 * @param user
	 * @return 0上传失败，1上传成功
	 */
	int upLoadHeadImg(User user);
	/**
	 * 分页查看
	 * 查看所有用户
	 * @return User的集合
	 */
	PageBean<User> findAllUsers(int pc);
	/**
	 * 根据用户id删除用户
	 * @return 影响记录数
	 */
	int delUser(Long usid);
	/**
	 * 查找最新用户
	 * @return
	 */
	List<UserVo> findNewUser();
	
	

}



