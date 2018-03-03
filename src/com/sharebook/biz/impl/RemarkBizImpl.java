package com.sharebook.biz.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import sun.text.resources.FormatData;

import com.sharebook.biz.RemarkBiz;
import com.sharebook.dao.RemarkDao;
import com.sharebook.dao.impl.RemarkDaoImpl;
import com.sharebook.entity.Remark;
import com.sharebook.entity.RemarkBookUserVo;
import com.sharebook.entity.RemarkVo;
import com.sharebook.pager.PageBean;

public class RemarkBizImpl implements RemarkBiz{
	private RemarkDao remarkDao = new RemarkDaoImpl();
	
	@Override
	public List<RemarkVo> findMyBookRemarks(Long bid) {
		// TODO Auto-generated method stub
		List<RemarkVo> rlist = remarkDao.findMyBookRemarks(bid);
		for(RemarkVo rv:rlist){
			Date d = rv.getRemarkTime();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			String formalTime = df.format(d);
			rv.setFormalTime(formalTime);
		}
		return rlist;
	}
	@Override
	public int addRemark(Remark remark) {
		// TODO Auto-generated method stub
		return remarkDao.addRemark(remark);
	}
	@Override
	
	public PageBean<RemarkBookUserVo> findAllRemarks(int pc) {
		// TODO Auto-generated method stub
		return remarkDao.findAllRemarks(pc);
	}
	@Override
	public int delRemark(Long rid) {
		// TODO Auto-generated method stub
		return remarkDao.delRemark(rid);
	}
	@Override
	public List<RemarkBookUserVo> findGreatRemark() {
		// TODO Auto-generated method stub
		List<RemarkBookUserVo> rbList = remarkDao.findGreatRemark();
		for(RemarkBookUserVo rv:rbList){
			Date d = rv.getRemarkTime();
			DateFormat df = new SimpleDateFormat("MM-dd hh:mm");
			String formalTime = df.format(d);
			rv.setFormalTime(formalTime);
		}
		return rbList;
	}
	@Override
	public List<RemarkBookUserVo> findSomeNewRemark(int pageNum) {
		// TODO Auto-generated method stub
		List<RemarkBookUserVo> rbList = remarkDao.findSomeNewRemark(pageNum);
		for(RemarkBookUserVo rv:rbList){
			Date d = rv.getRemarkTime();
			DateFormat df = new SimpleDateFormat("MM-dd hh:mm");
			String formalTime = df.format(d);
			rv.setFormalTime(formalTime);
		}
		return rbList;
	}
}
