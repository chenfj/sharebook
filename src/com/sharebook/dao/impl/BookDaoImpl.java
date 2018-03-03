package com.sharebook.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import org.junit.Test;

import com.sharebook.dao.BookDao;
import com.sharebook.dao.MybatisBaseDao;
import com.sharebook.entity.Book;
import com.sharebook.entity.BookBaseInfo;
import com.sharebook.entity.BookCondiction;
import com.sharebook.entity.BookImgDealTypeVo;
import com.sharebook.entity.BookUserCategoryVo;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.Remark;
import com.sharebook.pager.PageBean;

public class BookDaoImpl implements BookDao{

	@Override
	public int addBook(Book book) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.insert("com.sharebook.dao.BookDao.addBook", book);
		session.commit();
		session.close();
		return res;
	}

	@Override
	public PageBean<Book> findUserBooks(Long usid, int pc) {
		// TODO Auto-generated method stub
		/*
		 * 1. 得到ps 每页记录数
		 * 2. 得到tr总记录数
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.MYBOOK_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countMyBooks(usid);//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("usid", usid);
		map.put("ps", ps);
		map.put("pc", pc);
		List<Book> bookList = session.selectList("com.sharebook.dao.BookDao.findUserBooks", map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Book> pb = new PageBean<Book>();
		pb.setBeanList(bookList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}

	private int countMyBooks(Long usid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.BookDao.countMyBooks", usid);
		session.close();
		return count;
	}
	
	@Override
	public Book findBookById(Long bid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		Book book = session.selectOne("com.sharebook.dao.BookDao.findBookById", bid);
		session.close();
		return book;
	}

	@Override
	public int modifyBook(Book book) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.BookDao.modifyBook", book);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public int delSomeBook(Long[] bids) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bids", bids);
		int res = session.update("com.sharebook.dao.BookDao.delSomeBook", map);
		session.commit();
		session.close();
		return res;
	}
	/*public static void main(String[] args) {
		BookDaoImpl b = new BookDaoImpl();
		Long bids[] = new Long[]{1l,3l};
		int c =b.delSomeBook(bids);
		System.out.println(c);
	}*/
	@Test
	@Override
	public PageBean<BookVo> findAllBooks(int pc) {
		// TODO Auto-generated method stub
		/*
		 * 1. 得到ps 每页记录数
		 * 2. 得到tr总记录数
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.ADMIN_BOOK_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countAllUserBooks();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ps", ps);
		map.put("pc", pc);
		List<BookVo> bookList = session.selectList("com.sharebook.dao.BookDao.findAllBooks",map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<BookVo> pb = new PageBean<BookVo>();
		pb.setBeanList(bookList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}
	@Override
	public PageBean<BookVo> findNotAgreeBook(int pc) {
		/*
		 * 1. 得到ps 每页记录数
		 * 2. 得到tr总记录数
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.ADMIN_BOOK_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countNotAgreeBook();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ps", ps);
		map.put("pc", pc);
		List<BookVo> bookList = session.selectList("com.sharebook.dao.BookDao.findNotAgreeBook",map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<BookVo> pb = new PageBean<BookVo>();
		pb.setBeanList(bookList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}
	private int countNotAgreeBook() {
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.BookDao.countNotAgreeBook");
		session.close();
		return count;
	}

	@Override
	public int agreeAddBook(Long bid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.BookDao.agreeAddBook",bid);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public int delAdminBook(Long bid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.BookDao.delAdminBook", bid);
		session.commit();
		session.close();
		return res;
	}
	@Override
	public List<BookImgDealTypeVo> findAllBookImgs() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<BookImgDealTypeVo> findSomeBookImgs() {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<BookImgDealTypeVo> bidtvList = session.selectList("com.sharebook.dao.BookDao.findSomeBookImgs");
		session.close();
		return bidtvList;
	}
	@Override
	public PageBean<BookImgDealTypeVo> findAllUserBooks(int pc) {
		// TODO Auto-generated method stub
		/*
		 * 1. 得到ps 每页记录数
		 * 2. 得到tr总记录数
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.BOOKS_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countAllUserBooks();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ps", ps);
		map.put("pc", pc);
		List<BookImgDealTypeVo> bookList = session.selectList("com.sharebook.dao.BookDao.findAllUserBooks", map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<BookImgDealTypeVo> pb = new PageBean<BookImgDealTypeVo>();
		pb.setBeanList(bookList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}
	public int countAllUserBooks() {
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.BookDao.countAllUserBooks");
		session.close();
		return count;
	}
	@Override
	public PageBean<BookImgDealTypeVo> findBooksByCid(Long cid, int pc) {
		// TODO Auto-generated method stub
		/*
		 * 1. 得到ps 每页记录数
		 * 2. 得到tr总记录数
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.BOOKS_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countBooksByCid(cid);//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("cid",cid);
		map.put("ps", ps);
		map.put("pc", pc);
		List<BookImgDealTypeVo> bookList = session.selectList("com.sharebook.dao.BookDao.findBooksByCid", map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<BookImgDealTypeVo> pb = new PageBean<BookImgDealTypeVo>();
		pb.setBeanList(bookList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}
	
	public int countBooksByCid(Long cid) {
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.BookDao.countBooksByCid", cid);
		session.close();
		return count;
	}
	@Override
	public BookUserCategoryVo findBooksBybid(Long bid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		BookUserCategoryVo bucv = session.selectOne("com.sharebook.dao.BookDao.findBooksBybid", bid);
		return bucv;
	}
	@Override
	public PageBean<BookImgDealTypeVo> findBookByLikeName(String bookName,
			int pc) {
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.BOOKS_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countBooksByLikeName(bookName);//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bookName",bookName);
		map.put("ps", ps);
		map.put("pc", pc);
		List<BookImgDealTypeVo> bookList = session.selectList("com.sharebook.dao.BookDao.findBookByLikeName", map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<BookImgDealTypeVo> pb = new PageBean<BookImgDealTypeVo>();
		pb.setBeanList(bookList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}

	private int countBooksByLikeName(String bookName) {
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.BookDao.countBooksByLikeName",bookName);
		session.close();
		return count;
	}
	@Override
	public PageBean<BookImgDealTypeVo> findBookByManyCrial(BookCondiction bc,int pc) {
		 //1. 得到ps
		int ps = com.sharebook.pager.PageConstants.BOOKS_PAGE_SIZE;//每页记录数
		
		// 2. 总记录数 
		int tr = countBookByManyCrial(bc);//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		SqlSession session = MybatisBaseDao.getSqlSession(); 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bc",bc);
		map.put("ps", ps);
		map.put("pc", pc);
		List<BookImgDealTypeVo> bookList = session.selectList("com.sharebook.dao.BookDao.findBookByManyCrial", map);
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<BookImgDealTypeVo> pb = new PageBean<BookImgDealTypeVo>();
		pb.setBeanList(bookList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		session.close();
		return pb;
	}

	private int countBookByManyCrial(BookCondiction bc) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int count = session.selectOne("com.sharebook.dao.BookDao.countBookByManyCrial",bc);
		session.close();
		return count;
	}
	@Override
	public List<BookBaseInfo> findLastNewBook() {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<BookBaseInfo> bbiList = session.selectList("com.sharebook.dao.BookDao.findLastNewBook");
		session.close();
		return bbiList;
	}
	@Override
	public List<BookBaseInfo> findSomeNewBook(int pageNum) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		List<BookBaseInfo> bbiList = session.selectList("com.sharebook.dao.BookDao.findSomeNewBook",pageNum);
		session.close();
		return bbiList;
	}
	@Override
	public int notAgreeAddBook(Long bid) {
		// TODO Auto-generated method stub
		SqlSession session = MybatisBaseDao.getSqlSession();
		int res = session.update("com.sharebook.dao.BookDao.notAgreeAddBook",bid);
		session.commit();
		session.close();
		return res;
	}
	
	@Override
	public int totalPagesBook() {
		// TODO Auto-generated method stub
		return countAllUserBooks();
	}
	@Override
	public int changDealState(Long bid, String dealState) {
		// TODO Auto-generated method stub
		SqlSession session= MybatisBaseDao.getSqlSession();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bid",bid);
		map.put("dealState", dealState);
		int res = session.update("com.sharebook.dao.BookDao.changDealState",map);
		session.commit();
		session.close();
		
		return res;
	}
	
}
