package com.sharebook.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sharebook.action.AdminAction;
import com.sharebook.action.BookAction;
import com.sharebook.action.CategoryAction;
import com.sharebook.action.RemarkAction;
import com.sharebook.action.UserAction;

/**
 * Servlet implementation class ServletController
 */
@WebServlet("/ServletController")
public class ServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		if("/adminLogin.action".equals(path)){
			AdminAction aa = new AdminAction();
			aa.login(request,response);
		}else if("/checkUserLoginName.action".equals(path)){
			UserAction ua = new UserAction();
			ua.checkUserLoginName(request,response);
		}else if("/regist.action".equals(path)){
			UserAction ua = new UserAction();
			ua.regist(request,response);
		}else if("/userActive.action".equals(path)){
			UserAction ua = new UserAction();
			ua.userActive(request,response);
		}else if("/userLogin.action".equals(path)){
			UserAction ua = new UserAction();
			ua.userLogin(request,response);
		}else if("/updatePassword.action".equals(path)){
			UserAction ua = new UserAction();
			ua.updatePassword(request,response);
		}else if("/updatePerson.action".equals(path)){
			UserAction ua = new UserAction();
			ua.updatePerson(request,response);
		}else if("/upLoadHeadImg.action".equals(path)){
			UserAction ua = new UserAction();
			ua.upLoadHeadImg(request,response);
		}else if("/addBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.addBook(request,response);
		}else if("/findUserBooks.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findUserBooks(request,response);
		}else if("/modifyBookPage.action".equals(path)){
			BookAction ba = new BookAction();
			ba.modifyBookPage(request,response);
		} else if("/modifyBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.modifyBook(request,response);
		}else if("/findBookPage.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findBookPage(request,response);
		}else if("/findMyBookRemarks.action".equals(path)){
			RemarkAction ra = new RemarkAction();
			ra.findMyBookRemarks(request,response);
		}else if("/addRemarks.action".equals(path)){
			RemarkAction ra = new RemarkAction();
			ra.addRemarks(request,response);
		}else if("/delSomeBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.delSomeBook(request,response);
		}else if("/addCategory.action".equals(path)){
			CategoryAction ga = new CategoryAction();
			ga.addCategory(request,response);
		}else if("/findAllCategory.action".equals(path)){
			CategoryAction ga = new CategoryAction();
			ga.findAllCategory(request,response);
		}else if("/ajaxFindAllCategory.action".equals(path)){
			CategoryAction ga = new CategoryAction();
			ga.ajaxFindAllCategory(request,response);
		}else if("/findCategoryById.action".equals(path)){
			CategoryAction ga = new CategoryAction();
			ga.findCategoryById(request,response);
		} else if("/modifyCategory.action".equals(path)){
			CategoryAction ga = new CategoryAction();
			ga.modifyCategory(request,response);
		}else if("/findAllBooks.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findAllBooks(request,response);
		}else if("/findNotAgreeBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findNotAgreeBook(request,response);
		}else if("/agreeAddBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.agreeAddBook(request,response);
		}else if("/notAgreeAddBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.notAgreeAddBook(request,response);
		}else if("/delAdminBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.delAdminBook(request,response);
		}else if("/findAllRemarks.action".equals(path)){
			RemarkAction ra = new RemarkAction();
			ra.findAllRemarks(request,response);
		}else if("/delRemark.action".equals(path)){
			RemarkAction ra = new RemarkAction();
			ra.delRemark(request,response);
		}else if("/findAllUsers.action".equals(path)){
			UserAction ua = new UserAction();
			ua.findAllUsers(request,response);
		}else if("/delUser.action".equals(path)){
			UserAction ua = new UserAction();
			ua.delUser(request,response);
		}else if("/findBooksByCategory.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findBooksByCid(request,response);
		}else if("/findAllUserBooks.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findAllUserBooks(request,response);
		}else if("/findBooksBybid.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findBooksBybid(request,response);
		}else if("/findBookByLikeName.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findBookByLikeName(request,response);
		}else if("/findBookByManyCrial.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findBookByManyCrial(request,response);
		}else if("/quit.action".equals(path)){
			UserAction ua = new UserAction();
			ua.quit(request,response);
		}else if("/findLastNewBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findLastNewBook(request,response);
		}else if("/findGreatRemark.action".equals(path)){
			RemarkAction ra = new RemarkAction();
			ra.findGreatRemark(request,response);
		}else if("/findNewUser.action".equals(path)){
			UserAction ua = new UserAction();
			ua.findNewUser(request,response);
		}else if("/findSomeNewBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.findSomeNewBook(request,response);
		}else if("/totalPagesBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.totalPagesBook(request,response);
		}else if("/nextPageBook.action".equals(path)){
			BookAction ba = new BookAction();
			ba.nextPageBook(request,response);
		}else if("/findSomeNewRemark.action".equals(path)){
			RemarkAction ra = new RemarkAction();
			ra.findSomeNewRemark(request,response);
		}else if("/nextPageRemark.action".equals(path)){
			RemarkAction ra = new RemarkAction();
			ra.nextPageRemark(request,response);
		}else if("/exitAdmin.action".equals(path)){
			AdminAction aa = new AdminAction();
			aa.exitAdmin(request,response);
		}else if("/changDealState.action".equals(path)){
			BookAction ba = new BookAction();
			ba.changDealState(request,response);
		}
	}

}
