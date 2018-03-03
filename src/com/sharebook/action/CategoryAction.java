package com.sharebook.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import com.sharebook.biz.BookBiz;
import com.sharebook.biz.CategoryBiz;
import com.sharebook.biz.impl.CategoryBizImpl;
import com.sharebook.entity.Category;

public class CategoryAction {
	private CategoryBiz categoryBiz = new CategoryBizImpl();
	
	//添加类别分类
	public void addCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		//获取页面数据
		String categoryName = request.getParameter("category");
		try {
			if(categoryName.trim()==""||categoryName==null){
				request.setAttribute("cateMsg", "类别名称不能为空");
				request.getRequestDispatcher("/adminjsps/addCategory.jsp").forward(request, response);
				return;
			}
			Category category = new Category();
			category.setCategoryName(categoryName);
			int res = categoryBiz.addCategory(category);
			if(res==0){
				request.setAttribute("cateMsg", "添加失败");
			}
			request.setAttribute("cateMsg", "添加成功");
			request.getRequestDispatcher("/adminjsps/addCategory.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//查找所有图书类别
	public void findAllCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<Category> categoryList = categoryBiz.findAllCategory();
		request.setAttribute("categoryList", categoryList);
		try {
			request.getRequestDispatcher("/adminjsps/CategoryManager_be.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//修改图书类别
	public void modifyCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long cid = Long.parseLong(request.getParameter("cid"));
		String categoryName = request.getParameter("category");
		try {
			if(categoryName.trim()==""||categoryName==null){
				request.setAttribute("cateMsg", "类别名称不能为空");
				request.getRequestDispatcher("/adminjsps/modifyCategory.jsp").forward(request, response);
				return;
			}
			Category category = new Category();
			category.setCategoryName(categoryName);
			category.setCid(cid);
			int res = categoryBiz.modifyCategory(category);
			if(res==0){
				request.setAttribute("cateMsg", "修改失败");
			}
			request.setAttribute("cateMsg", "修改成功");
			response.sendRedirect("/ShareBook/findAllCategory.action");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//根据类别id查找类别
	public void findCategoryById(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long cid = Long.parseLong(request.getParameter("cid"));
		Category category = categoryBiz.findCategoryById(cid);
		try {
			request.setAttribute("category", category);
			request.getRequestDispatcher("/adminjsps/modifyCategory.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void ajaxFindAllCategory(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		List<Category> categoryList = categoryBiz.findAllCategory();
		
		//转化json
		JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
		jsonConfig.setIgnoreDefaultExcludes(false);
		//jsonConfig.setExcludes(new String[]{"order"});//定义过滤的属性
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);//自动过滤
		JSONArray json = JSONArray.fromObject(categoryList,jsonConfig);
		request.setAttribute("json", json);
		//将json发送到页面中
		try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
