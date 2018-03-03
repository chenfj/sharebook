package com.sharebook.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sharebook.biz.AdminBiz;
import com.sharebook.biz.impl.AdminBizImpl;
import com.sharebook.entity.Admin;


public class AdminAction {
	private AdminBiz adminBiz = new AdminBizImpl();
	public void login(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		String loginName = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			if(loginName.trim().length()==0||!loginName.matches("^[\\da-zA-Z_\u4e00-\u9fa5]{2,16}$")){
				request.getSession().setAttribute("mes", "请输入正确的用户名格式");
				response.sendRedirect("/ShareBook/adminjsps/login.jsp");
				return;
			}
			if(password.trim().length() == 0 || !password.matches("^[\\@A-Za-z0-9\\!\\#\\$\\%\\^\\&\\*\\.\\~]{6,15}$")){
				request.getSession().setAttribute("mes", "请输入正确的密码格式");
				response.sendRedirect("/ShareBook/adminjsps/login.jsp");
				return;
			}
			Admin admin = new Admin();
			admin.setLoginName(loginName);
			admin.setPassword(password);
			int res = adminBiz.login(admin);
			if(res==0){
				request.getSession().setAttribute("error","用户名错误");
				response.sendRedirect("/ShareBook/adminjsps/login.jsp");
			}else if(res==1){
				request.getSession().setAttribute("error", "密码错误");
				response.sendRedirect("/ShareBook/adminjsps/login.jsp");
			}else if(res==2){
				request.getSession().setAttribute("admin", admin);
				response.sendRedirect("/ShareBook/findAllUsers.action");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void exitAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		request.getSession().invalidate();
		try {
			request.getRequestDispatcher("/adminjsps/login.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
