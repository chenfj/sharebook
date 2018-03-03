package com.sharebook.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sharebook.dao.MybatisBaseDao;
import com.sharebook.dao.RemarkDao;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.Remark;
import com.sharebook.entity.RemarkBookUserVo;
import com.sharebook.entity.RemarkVo;
import com.sharebook.pager.PageBean;

public class RemarkDaoImpl implements RemarkDao{
	
	@Override
	public List<RemarkVo> findMyBookRemarks(Long bid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<RemarkVo> remarkList = session.selectList("com.sharebook.dao.RemarkDao.findMyBookRemarks", bid);
		session.close();
		return remarkList;
	}
	@Override
	public int addRemark(Remark remark) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.insert("com.sharebook.dao.RemarkDao.addRemark", remark);
		session.commit();
		session.close();
		return res;
	}
	
	@Override
	public int delRemark(Long rid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.RemarkDao.delRemark", rid);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public List<RemarkBookUserVo> findGreatRemark() {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<RemarkBookUserVo> remarkList = session.selectList("com.sharebook.dao.RemarkDao.findGreatRemark");
		session.close();
		return remarkList;
	}
	@Override
	public List<RemarkBookUserVo> findSomeNewRemark(int pageNum) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<RemarkBookUserVo> remarkList = session.selectList("com.sharebook.dao.RemarkDao.findSomeNewRemark",pageNum);
		session.close();
		return remarkList;
	}
	@Override
	public PageBean<RemarkBookUserVo> findAllRemarks(int pc) {
		// TODO Auto-generated method stub
		/*
		 * 1. 得到ps 每页记录数
		 * 2. 得到tr总记录数
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.ADMIN_REMARK_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countAllRemarks();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ps", ps);
		map.put("pc", pc);
		List<RemarkBookUserVo> remarkList = session.selectList("com.sharebook.dao.RemarkDao.findAllRemarks",map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<RemarkBookUserVo> pb = new PageBean<RemarkBookUserVo>();
		pb.setBeanList(remarkList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}
	public int countAllRemarks() {
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.RemarkDao.countAllRemarks");
		return count;
	}
	
	public static void main(String[] args) {
		RemarkDaoImpl rd = new RemarkDaoImpl();
		PageBean<RemarkBookUserVo> rs = rd.findAllRemarks(2);
		//int res = rd.delRemark(1l);
		System.out.println(rs.getBeanList().size());
	}

}
