package com.sharebook.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.sharebook.dao.MybatisBaseDao;
import com.sharebook.dao.UserDao;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.User;
import com.sharebook.entity.UserVo;
import com.sharebook.pager.PageBean;

public class UserDaoImpl implements UserDao {

	@Override
	public User checkUserLoginName(String loginName) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		User user = null;
		user = session.selectOne("com.sharebook.dao.UserDao.checkUserLoginName", loginName);
		session.close();
		return user;
	}

	@Override
	public int regist(User user) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.insert("com.sharebook.dao.UserDao.regist", user);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public User findUserByCode(String code) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		User user = null;
	    user = session.selectOne("com.sharebook.dao.UserDao.findUserByCode", code);
		return user;
	}
	@Override
	
	public void update(User existUser) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		session.update("com.sharebook.dao.UserDao.update", existUser);
		session.commit();
		session.close();
	}

	@Override
	public User getUserByLoginUser(User user) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		User userexist=null;
		userexist=session.selectOne("com.sharebook.dao.UserDao.getUserByLoginUser", user);
		session.close();
		return userexist;
	}
	@Override
	public int updatePassword(User user) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.UserDao.updatePassword", user);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public int updatePerson(User user) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.UserDao.updatePerson", user);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public int upLoadHeadImg(User user) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.UserDao.upLoadHeadImg", user);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public PageBean<User> findAllUsers(int pc) {
		/*
		 * 1. 得到ps 每页记录数
		 * 2. 得到tr总记录数
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.ADMIN_BOOK_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countAllUsers();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ps", ps);
		map.put("pc", pc);
		List<User> userList = session.selectList("com.sharebook.dao.UserDao.findAllUsers",map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<User> pb = new PageBean<User>();
		pb.setBeanList(userList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}
	public int countAllUsers() {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.UserDao.countAllUsers");
		session.close();
		return count;
	}

	@Override
	public int delUser(Long usid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.UserDao.delUser", usid);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public List<UserVo> findNewUser() {
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<UserVo> userList = session.selectList("com.sharebook.dao.UserDao.findNewUser");
		session.close();
		return userList;
	}
	public static void main(String[] args) {
		UserDaoImpl us= new UserDaoImpl();
		PageBean<User> uvlist= us.findAllUsers(1);
		System.out.println(uvlist.getBeanList().size());
	}

	
}
