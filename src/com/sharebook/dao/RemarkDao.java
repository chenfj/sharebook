package com.sharebook.dao;

import java.util.List;

import com.sharebook.entity.Remark;
import com.sharebook.entity.RemarkBookUserVo;
import com.sharebook.entity.RemarkVo;
import com.sharebook.pager.PageBean;
/**
 * 评论的持久层接口
 * @author 陈菲菊
 *@version 1.0
 */
public interface RemarkDao {
	/**
	 * 根据图书id查找相关评论
	 * @param bid
	 * @return remark的集合
	 */
	List<RemarkVo> findMyBookRemarks(Long bid);
	
	/**
	 * 添加评论
	 * @param remark
	 * @return 0添加失败 1 添加成功
	 */
	int addRemark(Remark remark);
	/**
	 * 后台分页查看
	 * 查看所有评论
	 * @return RemarkBookUserVo的list
	 */
	PageBean<RemarkBookUserVo> findAllRemarks(int pc);
	/**
	 * 删除记录条数
	 * @param rid
	 * @return 影响记录数
	 */
	int delRemark(Long rid);
	/**
	 * 查找内容多的评论
	 * @return
	 */
	List<RemarkBookUserVo> findGreatRemark();
	/**
	 * 根据页码查看评论
	 * @param pageNum 页码
	 * @return List
	 */
	List<RemarkBookUserVo> findSomeNewRemark(int pageNum);

	
	
}
