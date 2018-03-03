package com.sharebook.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import com.sharebook.biz.RemarkBiz;
import com.sharebook.biz.impl.RemarkBizImpl;
import com.sharebook.entity.Book;
import com.sharebook.entity.BookBaseInfo;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.Remark;
import com.sharebook.entity.RemarkBookUserVo;
import com.sharebook.entity.RemarkVo;
import com.sharebook.entity.User;
import com.sharebook.pager.PageBean;


public class RemarkAction {
	private RemarkBiz remarkBiz = new RemarkBizImpl();
	
	//异步请求用户书的评论
		public void findMyBookRemarks(HttpServletRequest request,
				HttpServletResponse response) {
			// TODO Auto-generated method stub
			Long bid = Long.parseLong(request.getParameter("bid"));
			List<RemarkVo> remarkList = remarkBiz.findMyBookRemarks(bid);
			
			/**
			 * 组合json
			 */
			JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
			jsonConfig.setIgnoreDefaultExcludes(false);
			//jsonConfig.setExcludes(new String[]{"order"});//定义过滤的属性
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);//自动过滤
			JSONArray json = JSONArray.fromObject(remarkList,jsonConfig);
			request.setAttribute("json", json);
			//将json发送到页面中
			try {
				request.getRequestDispatcher("/public/json.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	//异步请求添加评论
	public void addRemarks(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
			//获取页面数据
			Long bid = Long.parseLong(request.getParameter("bid"));
			String content = request.getParameter("content");
			try {
				if(content.trim()==""||content==null){
					request.setAttribute("conError","内容不能为空");
					request.getRequestDispatcher("/userjsps/bookdetail.jsp").forward(request, response);
					return;
				}
				User user = (User) request.getSession().getAttribute("user");
				//封装数据
				Remark remark = new Remark();
				remark.setContent(content);
				remark.setRemarkTime(new Date());
				remark.setRemarkState(0);
				remark.setUser(user);
				
				Book book = new Book();
				book.setBid(bid);
				remark.setBook(book);
				int res = remarkBiz.addRemark(remark);
				request.setAttribute("json", res);
				request.getRequestDispatcher("/public/json.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	//查看所有评论
	public void findAllRemarks(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 获取当前页码
		int pc = 1;
		String param = request.getParameter("pc");
		if (param != null && !param.trim().isEmpty()) {
			pc = Integer.parseInt(param);
		}
		// 截取url，页面中的分页导航中需要使用它做为超链接的目标！
		// http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
		// goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
		String url = request.getRequestURI();
		// 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		int index = url.lastIndexOf("?");
		if (index != -1) {
			url = url.substring(0, index);
		}
		// 根据用户查询图书
		PageBean<RemarkBookUserVo> pb = remarkBiz.findAllRemarks(pc);// 通过bid得到book对象
		// 保存到req中
		pb.setUrl(url);
		request.getSession().setAttribute("pb", pb);
		// 给PageBean设置url，保存PageBean，转发到/adminjsps/BookManager_be.jsp
		try {
			request.getRequestDispatcher("/adminjsps/RemarkManager_be.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	//删除一条评论
	public void delRemark(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long rid = Long.parseLong(request.getParameter("rid"));
		int res = remarkBiz.delRemark(rid);
		if(res>0){
			try {
				response.sendRedirect("/ShareBook/findAllRemarks.action");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void findGreatRemark(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<RemarkBookUserVo> rbuList = remarkBiz.findGreatRemark();
		//转化json 
		JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
		 jsonConfig.setIgnoreDefaultExcludes(false); //
		 //jsonConfig.setExcludes(new String[]{"order"});//定义过滤的属性
		jsonConfig.setCycleDetectionStrategy (CycleDetectionStrategy.LENIENT);// 自动过滤 JSONObject json =
		 JSONArray json = JSONArray.fromObject(rbuList, jsonConfig); 
		 request.setAttribute("json", json); // 将json发送到页面中
		 try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//下一页查找评论
	public void nextPageRemark(HttpServletRequest request,
			HttpServletResponse response) {
		Object cpn = request.getSession().getAttribute("curRemarkPageNum");
		int pageNum=0;
		if(cpn==null){
			pageNum=2;
			request.getSession().setAttribute("curRemarkPageNum",pageNum);
		}else{
			if((Integer)cpn>5){
				pageNum=5;
			}else{
				pageNum=(Integer)cpn+1;
				request.getSession().setAttribute("curRemarkPageNum",pageNum);
			}
		}
		List<RemarkBookUserVo> someList=remarkBiz.findSomeNewRemark(pageNum);
		//转化json 
		JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
		 jsonConfig.setIgnoreDefaultExcludes(false); //
		jsonConfig.setCycleDetectionStrategy (CycleDetectionStrategy.LENIENT);// 自动过滤 JSONObject json =
		JSONArray json = JSONArray.fromObject(someList, jsonConfig); 
		request.setAttribute("json", json); // 将json发送到页面中
		 try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//首页异步评论分页显示
	public void findSomeNewRemark(HttpServletRequest request,
			HttpServletResponse response) {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		request.getSession().setAttribute("curRemarkPageNum", pageNum);
		List<RemarkBookUserVo> someList = remarkBiz.findSomeNewRemark(pageNum);
		//转化json 
		JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
		 jsonConfig.setIgnoreDefaultExcludes(false); //
		jsonConfig.setCycleDetectionStrategy (CycleDetectionStrategy.LENIENT);// 自动过滤 JSONObject json =
		 JSONArray json = JSONArray.fromObject(someList, jsonConfig); 
		 request.setAttribute("json", json); // 将json发送到页面中
		 try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}

		


