package com.sharebook.biz.impl;

import com.sharebook.biz.AdminBiz;
import com.sharebook.dao.AdminDao;
import com.sharebook.dao.impl.AdminDaoImpl;
import com.sharebook.entity.Admin;

public class AdminBizImpl implements AdminBiz{
	private AdminDao adminDao = new AdminDaoImpl();
	@Override
	public int login(Admin admin) {
		Admin adm = adminDao.login(admin.getLoginName());
		if(adm==null){
			return 0;
		}else if(!adm.getPassword().equals(admin.getPassword())){
			return 1;
		}else{
			return 2;
		}
		
	}

}
