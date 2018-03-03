package com.sharebook.biz;

import java.util.List;
import java.util.Map;

import com.sharebook.entity.User;
import com.sharebook.entity.UserVo;
import com.sharebook.pager.PageBean;

/**
 * 用户业务逻辑层
 * @author 陈菲菊
 *@version 1.0
 */
public interface UserBiz {
	/**
	 * 根据登录名查找用户
	 * @param loginName 登录名
	 * @return 0用户名可以使用，1用户名已存在
	 */
	int checkUserLoginName(String loginName);
	/**
	 * 用户注册
	 * @param user 用户实体对象
	 * @return 0注册失败，1注册成功
	 */
	int regist(User user);
	/**
	 * 根据激活码查询用户
	 * @param code 激活码
	 * @return User 实体对象
	 */
	User findUserByCode(String code);
	/**
	 * 激活成功修改用户状态为1，激活码为code
	 * @param existUser
	 */
	void update(User existUser);
	/**
	 * 根据用户数据查找用户
	 * @param user 用户实体对象
	 * @return Map 
	 */
	Map<String,Object> userLogin(User user);
	/**
	 * 修改用户密码
	 * @param user 用户实体对象
	 * @return	1修改成功，0修改失败
	 */
	int updatePassword(User user);
	/**
	 * 修改用户信息
	 * @param user 用户实体对象
	 * @return 1修改失败，0修改成功
	 */
	int updatePerson(User user);
	/**
	 * 上传头像
	 * @param user 用户实体对象
	 * @return 0上传成功，1上传失败
	 */
	int upLoadHeadImg(User user);
	/**
	 * 分页查看
	 * 查看所有用户
	 * @return User的集合
	 */
	PageBean<User> findAllUsers(int pc);
	/**
	 * 根据用户id删除某个用户
	 * @param usid 
	 * @return 影响记录条数
	 */
	int delUser(Long usid);
	/**
	 * 查找最新用户
	 * @return
	 */
	List<UserVo> findNewUser();
	/**
	 * 用户刷新获取数据
	 * @return
	 */
	Map<String, Object> refresh();
	

}
