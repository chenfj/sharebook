package com.sharebook.dao;

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
 * 图书持久层接口
 * @author 陈菲菊
 *@version 1.0
 */
public interface BookDao {
	/**
	 * 用户添加图书
	 * @param book 图书实体对象
	 * @return 1添加成功 0添加失败
	 */
	int addBook(Book book);
	/**
	 * 根据用户id和当前页码查找图书
	 * @param usid 用户id
	 * @param pc 当前页码
	 * @return	当前页对象
	 */
	PageBean<Book> findUserBooks(Long usid, int pc);
	/**
	 * 根据id查找图书信息
	 * @param bid图书id
	 * @return 返回图书对象
	 */
	Book findBookById(Long bid);
	/**
	 * 修改图书信息
	 * @param Book
	 * @return 1修改成功，0修改失败
	 */
	int modifyBook(Book book);
	/**
	 * 批量或单个删除图书
	 * @param bids
	 * @return 影响记录数
	 */
	int delSomeBook(Long[] bids);
	/**
	 * 后台分页
	 * 查找所有有效的图书
	 * @return Book的集合
	 */
	PageBean<BookVo> findAllBooks(int pc);
	/**
	 * 分页查询
	 * 查找待审核的图书
	 * @return
	 */
	PageBean<BookVo> findNotAgreeBook(int pc);
	/**
	 * 根据图书id修改图书状态
	 * @param bid
	 * @return 影响记录数
	 */
	int agreeAddBook(Long bid);
	/**
	 * 删除图书，即修改图书状态
	 * @param bid
	 * @return 影响记录数
	 */
	int delAdminBook(Long bid);
	/**
	 * 查找所有图书的图片和交易类型
	 * @return BookImgDealTypeVo的集合
	 */
	List<BookImgDealTypeVo> findAllBookImgs();
	/**
	 * 查找图书的前8条记录
	 * @return List
	 */
	List<BookImgDealTypeVo> findSomeBookImgs();
	/**
	 * 根据当前页码查找图书
	 * @param pc 当前页码
	 * @return PageBean
	 */
	PageBean<BookImgDealTypeVo> findAllUserBooks(int pc);
	/**
	 * 根据图书类别cid查找所有图书并分页显示
	 * @param cid 图书类别id
	 * @param pc 当前ye
	 * @return PageBean
	 */
	PageBean<BookImgDealTypeVo> findBooksByCid(Long cid, int pc);
	/**
	 * 根据图书id查看图书详情
	 * @param bid 图书id
	 * @return BookUserCategoryVo
	 */
	BookUserCategoryVo findBooksBybid(Long bid);
	/**
	 * 根据书名模糊查询分页显示
	 * @param bookName书名
	 * @param pc 当前
	 * @return
	 */
	PageBean<BookImgDealTypeVo> findBookByLikeName(String bookName, int pc);
	/**
	 * 多条件查询
	 * @param bc 条件对象
	 * @param pc 当前页
	 * @return PageBean
	 */
	PageBean<BookImgDealTypeVo> findBookByManyCrial(BookCondiction bc,int pc);
	/**
	 * 查找最新书籍
	 * @return List
	 */
	List<BookBaseInfo> findLastNewBook();
	/**
	 * 根据页码查询图书
	 * @param pageNum
	 * @return
	 */
	List<BookBaseInfo> findSomeNewBook(int pageNum);
	/**
	 * 查询书的总记录书
	 * @return int
	 */
	int totalPagesBook();
	/**
	 * 修改图书状态
	 * @param bid
	 * @return
	 */
	int notAgreeAddBook(Long bid);
	/**
	 * 修改图书交易状态
	 * @param bid
	 * @param dealState
	 * @return
	 */
	int changDealState(Long bid, String dealState);
	
	

}
