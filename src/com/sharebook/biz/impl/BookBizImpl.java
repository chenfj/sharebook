package com.sharebook.biz.impl;

import java.util.List;

import com.sharebook.biz.BookBiz;
import com.sharebook.dao.BookDao;
import com.sharebook.dao.impl.BookDaoImpl;
import com.sharebook.entity.Book;
import com.sharebook.entity.BookBaseInfo;
import com.sharebook.entity.BookCondiction;
import com.sharebook.entity.BookImgDealTypeVo;
import com.sharebook.entity.BookUserCategoryVo;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.Remark;
import com.sharebook.pager.PageBean;
import com.sharebook.util.MailUitls;

public class BookBizImpl implements BookBiz{
	private BookDao bookDao = new BookDaoImpl();
	@Override
	public int addBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.addBook(book);
	}
	@Override
	public PageBean<Book> findUserBooks(Long usid, int pc) {
		// TODO Auto-generated method stub
		return bookDao.findUserBooks(usid,pc);
	}
	@Override
	public Book findBookById(Long bid) {
		// TODO Auto-generated method stub
		return bookDao.findBookById(bid);
	}
	@Override
	public int modifyBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.modifyBook(book);
	}
	@Override
	public int delSomeBook(Long[] bids) {
		// TODO Auto-generated method stub
		return bookDao.delSomeBook(bids);
	}
	@Override
	public PageBean<BookVo> findAllBooks(int pc) {
		// TODO Auto-generated method stub
		return bookDao.findAllBooks(pc);
	}
	@Override
	public PageBean<BookVo> findNotAgreeBook(int pc) {
		// TODO Auto-generated method stub
		return bookDao.findNotAgreeBook(pc);
	}
	@Override
	public int agreeAddBook(Long bid, String email,String bookName) {
		// TODO Auto-generated method stub
		int re = bookDao.agreeAddBook(bid);
		if(re>0){
			MailUitls.sendAgreeMail(email,bookName);
		}
		return re;
	}
	@Override
	public int delAdminBook(Long bid) {
		// TODO Auto-generated method stub
		return bookDao.delAdminBook(bid);
	}
	@Override
	public List<BookImgDealTypeVo> findAllBookImgs() {
		// TODO Auto-generated method stub
		return bookDao.findAllBookImgs();
	}
	@Override
	public PageBean<BookImgDealTypeVo> findAllUserBooks(int pc) {
		// TODO Auto-generated method stub
		return bookDao.findAllUserBooks(pc);
	}
	@Override
	public PageBean<BookImgDealTypeVo> findBooksByCid(Long cid, int pc) {
		// TODO Auto-generated method stub
		return bookDao.findBooksByCid(cid,pc);
	}
	@Override
	public BookUserCategoryVo findBooksBybid(Long bid) {
		// TODO Auto-generated method stub
		return bookDao.findBooksBybid(bid);
	}
	@Override
	public PageBean<BookImgDealTypeVo> findBookByLikeName(String bookName,
			int pc) {
		// TODO Auto-generated method stub
		return bookDao.findBookByLikeName(bookName,pc);
	}
	@Override
	public PageBean<BookImgDealTypeVo> findBookByManyCrial(BookCondiction bc,
			int pc) {
		// TODO Auto-generated method stub
		return bookDao.findBookByManyCrial(bc,pc);
	}
	@Override
	public List<BookBaseInfo> findLastNewBook() {
		// TODO Auto-generated method stub
		return bookDao.findLastNewBook();
	}
	@Override
	public List<BookBaseInfo> findSomeNewBook(int pageNum) {
		// TODO Auto-generated method stub
		return bookDao.findSomeNewBook(pageNum);
	}
	@Override
	public int totalPagesBook() {
		// TODO Auto-generated method stub
		int res = bookDao.totalPagesBook();
		int count = 0;
		if((res%8)==0){
			count = res/8;
		}else{
			count = (res/8)+1;
		}
		return count;
	}
	
	@Override
	public int notAgreeAddBook(Long bid, String email, String bookName) {
		// TODO Auto-generated method stub
		int res = bookDao.notAgreeAddBook(bid);
		if(res>0){
			MailUitls.sendNotAgreeMail(email, bookName);
		}
		return res;
	}
	@Override
	public int changDealState(Long bid, String dealState) {
		// TODO Auto-generated method stub
		return bookDao.changDealState(bid,dealState);
	}
}
