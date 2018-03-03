package com.sharebook.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sharebook.biz.UserBiz;
import com.sharebook.dao.BookDao;
import com.sharebook.dao.CategoryDao;
import com.sharebook.dao.UserDao;
import com.sharebook.dao.impl.BookDaoImpl;
import com.sharebook.dao.impl.CategoryDaoImpl;
import com.sharebook.dao.impl.UserDaoImpl;
import com.sharebook.entity.BookImgDealTypeVo;
import com.sharebook.entity.Category;
import com.sharebook.entity.User;
import com.sharebook.entity.UserVo;
import com.sharebook.pager.PageBean;
import com.sharebook.util.MailUitls;
import com.sharebook.util.UUIDUtils;

public class UserBizImpl implements UserBiz{
	private UserDao userDao = new UserDaoImpl();
	@Override
	public int checkUserLoginName(String loginName) {
		User user= userDao.checkUserLoginName(loginName);
		if(user!=null){
			return 1;
		}
		return 0;
	}
	@Override
	public int regist(User user) {
		
		// 将数据存入到数据库
		user.setState(0); // 0:代表用户未激活.  1:代表用户已经激活.
		user.setNofunc(0);//0：代表用户可用 1代表用户已查封
		user.setHeadimg("images/head.jpg");
		String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
		user.setActiveCode(code);//生成64位的激活码
		int res = userDao.regist(user);
		// 发送激活邮件;
		if(res==1){
			MailUitls.sendMail(user.getEmail(), code);
		}
		return res;
	}
	@Override
	public User findUserByCode(String code) {
		
		return userDao.findUserByCode(code);
	}
	@Override
	public void update(User existUser) {
		// TODO Auto-generated method stub
		userDao.update(existUser);
	}
	@Override
	public Map<String,Object> userLogin(User user) {
		// TODO Auto-generated method stub
		User userExist = userDao.getUserByLoginUser(user);
		Map<String,Object> map = new HashMap<String, Object>();
		if(userExist!=null){
			if(userExist.getNofunc()==0){
				//验证成功
				//调用类别的Dao层，查找所有类别
				CategoryDao categoryDao = new CategoryDaoImpl();
				List<Category> categoryList = categoryDao.findAllCategory();
				//调用图书的Dao层，查找8条记录图书
				BookDao bookDao = new BookDaoImpl();
				List<BookImgDealTypeVo> bidtvList = bookDao.findSomeBookImgs();
				//放入map集合
				map.put("login", "success");
				map.put("categoryList", categoryList);
				map.put("bidtvList", bidtvList);
				map.put("user", userExist);
			}else{
				//账号被封
				map.put("login", "nofunc");
			}
		}else{
			//用户名或密码或邮箱未激活错误
			map.put("login","errorMes");
		}
		return map;
	}
	@Override
	public Map<String, Object> refresh() {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		BookDao bookDao = new BookDaoImpl();
		List<BookImgDealTypeVo> bidtvList = bookDao.findSomeBookImgs();
		map.put("bidtvList", bidtvList);
		return map;
	}
	@Override
	public int updatePassword(User user) {
		// TODO Auto-generated method stub
		return userDao.updatePassword(user);
	}
	@Override
	public int updatePerson(User user) {
		// TODO Auto-generated method stub
		return userDao.updatePerson(user);
	}
	@Override
	public int upLoadHeadImg(User user) {
		// TODO Auto-generated method stub
		return userDao.upLoadHeadImg(user);
	}
	@Override
	public PageBean<User> findAllUsers(int pc) {
		// TODO Auto-generated method stub
		return userDao.findAllUsers(pc);
	}
	@Override
	public int delUser(Long usid) {
		// TODO Auto-generated method stub
		return userDao.delUser(usid);
	}
	@Override
	public List<UserVo> findNewUser() {
		// TODO Auto-generated method stub
		return userDao.findNewUser();
	}
}

