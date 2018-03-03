package com.sharebook.biz;

import java.util.List;

import com.sharebook.entity.Remark;
import com.sharebook.entity.RemarkBookUserVo;
import com.sharebook.entity.RemarkVo;
import com.sharebook.pager.PageBean;
/**
 * 评论业务层
 * @author 陈菲菊
 *@version 1.0
 */
public interface RemarkBiz {
	/**
	 * 异步请求查看用户书的评论
	 * @param bid 图书id
	 * @return list集合
	 */
	List<RemarkVo> findMyBookRemarks(Long bid);
	
	/**
	 * 异步请求添加评论
	 * @param remark
	 * @return 0添加成功 1添加失败
	 */
	int addRemark(Remark remark);
	/**
	 * 分页查看
	 * 查看所有评论列表
	 * @return
	 */
	PageBean<RemarkBookUserVo> findAllRemarks(int pc);
	/**
	 * 删除一条记录
	 * @param rid
	 * @return 影响记录条数
	 */
	int delRemark(Long rid);
	/**
	 * 查找内容多的评论
	 * @return
	 */
	List<RemarkBookUserVo> findGreatRemark();
	/**
	 * 根据页码查找评论
	 * @param pageNum 页码号
	 * @return List
	 */
	List<RemarkBookUserVo> findSomeNewRemark(int pageNum);

	
	
}
