package com.sharebook.dao.impl;


import org.apache.ibatis.session.SqlSession;

import com.sharebook.dao.AdminDao;
import com.sharebook.dao.MybatisBaseDao;
import com.sharebook.entity.Admin;

public class AdminDaoImpl implements AdminDao{

	@Override
	public Admin login(String loginName) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		Admin adm = session.selectOne("com.sharebook.dao.AdminDao.getAdminByLoginName", loginName);
		session.close();
		return adm;
	}
	
}
