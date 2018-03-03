package com.sharebook.biz;


import java.util.List;

import com.sharebook.entity.Book;
import com.sharebook.entity.BookBaseInfo;
import com.sharebook.entity.BookCondiction;
import com.sharebook.entity.BookImgDealTypeVo;
import com.sharebook.entity.BookUserCategoryVo;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.Remark;
import com.sharebook.pager.PageBean;
/**
 * 图书业务逻辑
 * @author 陈菲菊
 * @version1.0
 */
public interface BookBiz {
	/**
	 * 用户添加图书
	 * @param book 图书实体对象
	 * @return 1添加成功 0 添加失败
	 */
	int addBook(Book book);
	/**
	 * 根据用户id分页查询图书
	 * @param usid 用户id
	 * @param pc 当前页码
	 * @return
	 */
	PageBean<Book> findUserBooks(Long usid, int pc);
	/**
	 * 根据图书id查找图书
	 * @param bid
	 * @return
	 */
	Book findBookById(Long bid);
	/**
	 * 根据图书id修改图书
	 * @param book 图书实体对象
	 * @return 1修改成功 0 修改失败
	 */
	int modifyBook(Book book);
	/**
	 * 批量删除或单个删除
	 * @param bids 存放book的id的数组
	 * @return 影响的记录数
	 */
	int delSomeBook(Long[] bids);
	/**
	 * 后台分页
	 * 查找所有有效图书
	 * @return	Book的集合
	 */
	PageBean<BookVo> findAllBooks(int pc);
	/**
	 * 分页
	 * 查找待审核的书
	 * @return Book的集合
	 */
	PageBean<BookVo> findNotAgreeBook(int pc);
	/**
	 * 审核通过，发送通知邮件
	 * @param bid
	 * @param email
	 * @return
	 */
	int agreeAddBook(Long bid, String email,String bookName);
	/**
	 * 管理员删除图书
	 * @param bid
	 * @return 影响条数
	 */
	int delAdminBook(Long bid);
	/**
	 * 查找所有书的图片和交易类型
	 * @return BookImgDealTypeVo的集合
	 */
	List<BookImgDealTypeVo> findAllBookImgs();
	/**
	 * 分页显示所有图书
	 * @param pc 当前页
	 * @return PageBean
	 */
	PageBean<BookImgDealTypeVo> findAllUserBooks(int pc);
	/**
	 * 根据cid查找图书并分页显示
	 * @param cid 图书类别id
	 * @param pc 当前页
	 * @return PageBean
	 */
	PageBean<BookImgDealTypeVo> findBooksByCid(Long cid, int pc);
	/**
	 * 根据图书id查找详情
	 * @param bid 图书id
	 * @return BookUserCategoryVo
	 */
	BookUserCategoryVo findBooksBybid(Long bid);
	/**
	 * 根据书名模糊查询并分页
	 * @param bookName 书名
	 * @param pc 当前页
	 * @return
	 */
	PageBean<BookImgDealTypeVo> findBookByLikeName(String bookName, int pc);
	/**
	 * 多条件查询
	 * @param bc 条件对象
	 * @param pc 当前页数
	 * @return PageBean
	 */
	PageBean<BookImgDealTypeVo> findBookByManyCrial(BookCondiction bc, int pc);
	/**
	 * 查找最新书籍
	 * @return List
	 */
	List<BookBaseInfo> findLastNewBook();
	/**
	 * 根据页码查找数据
	 * @param pageNum
	 * @return List
	 */
	List<BookBaseInfo> findSomeNewBook(int pageNum);
	/**
	 * 异步请求总页数
	 * @return int
	 */
	int totalPagesBook();
	/**
	 * 拒绝加入书库，通知主人
	 * @param bid
	 * @param email
	 * @param bookName
	 * @return
	 */
	int notAgreeAddBook(Long bid, String email, String bookName);
	/**
	 * 根据id修改交易状态
	 * @param bid
	 * @param dealState
	 * @return
	 */
	int changDealState(Long bid, String dealState);
	
	
	
}
