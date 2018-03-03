package com.sharebook.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.sharebook.biz.BookBiz;
import com.sharebook.biz.CategoryBiz;
import com.sharebook.biz.UserBiz;
import com.sharebook.biz.impl.BookBizImpl;
import com.sharebook.biz.impl.CategoryBizImpl;
import com.sharebook.biz.impl.UserBizImpl;
import com.sharebook.dao.BookDao;
import com.sharebook.dao.impl.BookDaoImpl;
import com.sharebook.entity.Book;
import com.sharebook.entity.BookBaseInfo;
import com.sharebook.entity.BookImgDealTypeVo;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.Category;
import com.sharebook.entity.User;
import com.sharebook.entity.UserVo;
import com.sharebook.pager.PageBean;

public class UserAction {
	private UserBiz userBiz = new UserBizImpl();
	
	// 异步请求检验注册名是否存在
	public void checkUserLoginName(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loginName = request.getParameter("loginName");
		int res = userBiz.checkUserLoginName(loginName);
		request.setAttribute("json", res);
		request.getRequestDispatcher("/public/json.jsp").forward(request,
				response);
	}

	// 用户注册
	public void regist(HttpServletRequest request, HttpServletResponse response) {

		// 获取页面数据并进行数据验证
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("rePassword");
		String nickName = request.getParameter("nickName");
		String address = request.getParameter("province");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		// 封装数据
		User user = new User();
		user.setLoginName(loginName);
		user.setAddress(address);
		user.setEmail(email);
		user.setNickName(nickName);
		user.setPassword(password);
		user.setPhone(phone);

		// 数据验证
		try {
			// 登录名验证
			if (user.getLoginName() == null || user.getLoginName().trim() == "") {
				request.setAttribute("lnError", "用户名不能为空");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 密码验证
			if (user.getPassword() == null || user.getPassword().trim() == "") {
				request.setAttribute("paError", "密码不能为空");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 确认密码验证
			if (rePassword == null || rePassword.trim() == "") {
				request.setAttribute("reError", "确认密码不能为空");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 密码相等验证
			if (!user.getPassword().equals(rePassword)) {
				request.setAttribute("eqError", "两次密码不一致");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 昵称验证
			if (user.getNickName().trim() == "" || user.getNickName() == null) {
				request.setAttribute("niError", "昵称不能为空");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 地址验证
			if (user.getAddress() == null || user.getAddress().trim() == "") {
				request.setAttribute("adError", "地址不能为空");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 手机号验证
			String phoneReg = "^1[3-9][0-9]{9}$";
			if (user.getPhone().trim() == "" || user.getPhone() == null
					|| !user.getPhone().matches(phoneReg)) {
				request.setAttribute("phErro", "请输入邮箱的手机号");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 邮箱校验
			String emailReg = "^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$";
			if (user.getEmail().trim() == "" || user.getEmail() == null
					|| !user.getEmail().matches(emailReg)) {
				request.setAttribute("emErro", "邮箱格式不正确");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}
			// 通过以上校验后，准备存入数据库
			int res = userBiz.regist(user);
			if (res == 0) {
				// 注册失败，跳到注册页面
				request.setAttribute("registFail", "对不起，由于系统原因导致失败，请重新注册");
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			} else if (res == 1) {
				// 注册成功，提醒用户激活邮箱
				request.setAttribute("registSuccess", 1);
				request.getRequestDispatcher("/userjsps/regist.jsp").forward(
						request, response);
				return;
			}

		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void userActive(HttpServletRequest request,
			HttpServletResponse response) {
		/**
		 * 用户激活的方法
		 */
		String code = request.getParameter("code");
		// 根据激活码查询用户:
		User existUser = userBiz.findUserByCode(code);
		// 判断
		if (existUser == null) {
			// 激活码错误的
			request.getSession().setAttribute("activeError",2);
		} else {
			// 激活成功
			// 修改用户的状态
			existUser.setState(1);
			existUser.setActiveCode("null");
			userBiz.update(existUser);
			request.setAttribute("activeError", 1);
		}
		try {
			request.getRequestDispatcher("/public/active.jsp").forward(request,
					response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 用户登录
	public void userLogin(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
			// 获取页面数据并验证
			String loginName = request.getParameter("loginname");
			String password = request.getParameter("loginpass");
			String verifyCode = request.getParameter("verifyCode");

			try {
				if (loginName == null||loginName.trim() == "") {
					request.setAttribute("loginMsg", "用户名不能为空");
					request.getRequestDispatcher("/userjsps/login.jsp").forward(
							request, response);
					return;
				}
				if ( password == null || password.trim() == "") {
					request.setAttribute("pasError", "密码不能为空");
					request.getRequestDispatcher("/userjsps/login.jsp").forward(
							request, response);
					return;
				}
				if (verifyCode == null||verifyCode.trim() == "") {
					request.setAttribute("verError", "验证码不能为空");
					request.getRequestDispatcher("/userjsps/login.jsp").forward(
							request, response);
					return;
				}
				// 获取session中自动生成的验证码
				String sessionCheckcode = (String) request.getSession()
						.getAttribute("random");
				// 判断验证码是否正确
				if (!sessionCheckcode.equals(verifyCode)) {
					// 将用户的登录传回页面保留输入状态
					request.setAttribute("loginName", loginName);
					request.setAttribute("verError", "对不起验证码数据错误");
					request.getRequestDispatcher("/userjsps/login.jsp").forward(
							request, response);
					return;
				}

				// 校验通过后，封装数据
				User user = new User();
				user.setLoginName(loginName);
				user.setPassword(password);
				// 查看用户名是否存在
				Map<String,Object> map = userBiz.userLogin(user);
				User userExist = (User)map.get("user");
				request.getSession().setAttribute("user", userExist);
				if(map.get("login").equals("success")){
					//验证成功
					request.setAttribute("map", map);
					List<BookImgDealTypeVo> bidtvlist = (List<BookImgDealTypeVo>) map.get("bidtvList");
					request.setAttribute("record",bidtvlist.size());
					
					List<Category> categoryList = (List<Category>) map.get("categoryList");
					request.getSession().setAttribute("categoryList", categoryList);
					response.sendRedirect("/ShareBook/userjsps/myIndexHome.jsp");
					return;
				}else if(map.get("login").equals("nofunc")){
					//账号被封,返回登录页面
					request.setAttribute("loginMsg", "对不起，您的账号已被封");
					request.getRequestDispatcher("/userjsps/login.jsp").forward(request, response);
					return;
				}else if(map.get("login").equals("errorMes")){
					//登录名或密码或邮箱为被激活
					request.setAttribute("loginMsg", "登录名或密码或邮箱未激活");
					request.getRequestDispatcher("/userjsps/login.jsp").forward(request, response);
					return;
				}
				
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}

	// 用户修改密码
	public void updatePassword(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 获取页面数据
		User user = (User) request.getSession().getAttribute("user");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String newRepassword = request.getParameter("newRepassword");
		// 数据校验
		try {
			if (oldPassword.trim() == "" || oldPassword == null) {
				request.setAttribute("oldError", "原密码不能为空");
				request.getRequestDispatcher("/userjsps/updatePassword.jsp")
						.forward(request, response);
				return;
			}
			if (!oldPassword.trim().equals(user.getPassword())) {
				request.setAttribute("oldError", "原密码填写错误");
				request.getRequestDispatcher("/userjsps/updatePassword.jsp")
						.forward(request, response);
				return;

			}
			if (newPassword.trim() == "" || newPassword == null) {
				request.setAttribute("newError", "新密码不能为空");
				request.getRequestDispatcher("/userjsps/updatePassword.jsp")
						.forward(request, response);
				return;
			}
			if (newRepassword.trim() == "" || newRepassword == null) {
				request.setAttribute("newError", "确认密码不能为空");
				request.getRequestDispatcher("/userjsps/updatePassword.jsp")
						.forward(request, response);
				return;
			}
			if (!newPassword.equals(newRepassword)) {
				request.setAttribute("equError", "两次密码不一致");
				request.getRequestDispatcher("/userjsps/updatePassword.jsp")
						.forward(request, response);
				return;
			}
			// 修改数据密码
			user.setPassword(newRepassword);
			int res = userBiz.updatePassword(user);
			if (res == 1) {
				request.getSession().setAttribute("user", user);
				request.setAttribute("uppassMes", "密码修改成功");
				request.getRequestDispatcher("/userjsps/updatePassword.jsp")
						.forward(request, response);
			} else {
				request.setAttribute("uppassMes", "密码修改成功");
				request.getRequestDispatcher("/userjsps/updatePassword.jsp")
						.forward(request, response);
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//
	public void updatePerson(HttpServletRequest request,
			HttpServletResponse response) {
		// 获取页面数据并进行数据验证
		String nickName = request.getParameter("nickName");
		String address = request.getParameter("province");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		// 从session中获取user
		User user = (User) request.getSession().getAttribute("user");
		// 封装数据
		user.setAddress(address);
		user.setEmail(email);
		user.setNickName(nickName);
		user.setPhone(phone);

		// 数据验证

		try {
			// 昵称验证
			if (user.getNickName().trim() == "" || user.getNickName() == null) {
				request.setAttribute("niError", "昵称不能为空");
				request.getRequestDispatcher("/userjsps/updatePerson.jsp").forward(
						request, response);
				return;
			}
			// 手机号验证
			String phoneReg = "^1[3-9][0-9]{9}$";
			if (user.getPhone().trim() == "" || user.getPhone() == null
					|| !user.getPhone().matches(phoneReg)) {
				request.setAttribute("phError", "请输入正确的手机号");
				request.getRequestDispatcher("/userjsps/updatePerson.jsp").forward(
						request, response);
				return;
			}
			// 邮箱校验
			String emailReg = "^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$";
			if (user.getEmail().trim() == "" || user.getEmail() == null
					|| !user.getEmail().matches(emailReg)) {
				request.setAttribute("emError", "邮箱格式不正确");
				request.getRequestDispatcher("/userjsps/updatePerson.jsp").forward(
						request, response);
				return;
			}
			// 通过以上校验后，准备存入数据库
			int res = userBiz.updatePerson(user);
			if(res==1){
				request.getSession().setAttribute("user",user);
				request.setAttribute("upPeoError", "修改成功");
				request.getRequestDispatcher("/userjsps/updatePerson.jsp").forward(
						request, response);
			}else{
				request.setAttribute("upPeoError", "修改失败");
				request.getRequestDispatcher("/userjsps/updatePerson.jsp").forward(
						request, response);
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

	public void upLoadHeadImg(HttpServletRequest request,
			HttpServletResponse response) {
		//先删除用户原先的头像（磁盘上的头像）
		//1.得到用户
		User user = (User) request.getSession().getAttribute("user");
		//2.查找旧的头像在数据库中存放的文件名
		String oldHeadimg = user.getHeadimg();
		//3.旧的图片存放的路径
		String savePath = request.getServletContext()
				.getRealPath("\\");
		//4.绝对路径
		String realAllPath=savePath+"\\"+oldHeadimg;
		File oldfile = new File(realAllPath);
		if(oldfile.exists()){
			oldfile.delete();
		}
		
		// 判断表单是否以流的形式提交数据enctype="multipart/form-data"
		try {
			String dbPath = "";
			if (ServletFileUpload.isMultipartContent(request)) {
				// 定义编码解析工厂对象用于设置缓冲大小
				DiskFileItemFactory dff = new DiskFileItemFactory();
				dff.setSizeThreshold(1024000);// 设定内存缓冲文件的大小
				// 创建文件上传对象
				ServletFileUpload sf = new ServletFileUpload(dff);
				sf.setFileSizeMax(1 * 1024 * 1024);// 允许上传的单个文件的大小
				sf.setSizeMax(1 * 1024 * 1024);// 设置表单中所有文件的总大小上限的
				// 解析request请求并获取请求的封装集合 集合中存放的是fileItem对象为表中的元素
				List<FileItem> list = null;
				list = sf.parseRequest(request);
				// 循环集合
				for (FileItem fi : list) {
					// 判断当前的FileItem封装的是否是文件对象并且文件是否有效
					// isFormField是否是普通表单元素
					if (!fi.isFormField() && fi.getName() != null
							&& fi.getName().length() > 0 && fi.getSize() > 0) {
						// 获取文件的输入流对象
						InputStream is = fi.getInputStream();
						// 定义文件名与文件的保存路径c:/user/ fi.getName
						// 获取文件名且根据浏览器的不同可能会取出文件的绝对路径
						String fileName = fi.getName();
						if (fileName.lastIndexOf("\\") > 0) {
							fileName = fi.getName().substring(
									fi.getName().lastIndexOf("\\") + 1);
						}
						// newFileName 磁盘中的文件以确保相同的文件可以写入磁盘
						// fileName旧的文件名字用于设置下载时的默认路径
						String newFileName = new Date().getTime() + fileName;
						// 获取服务器路径 获取web工程在服务器中的根路径
						// boolean flag = fileName.endsWith("jpg");

						 savePath = request.getServletContext()
								.getRealPath("\\headImg");

						// 创建File对象用于确定文件需要保存在什么样的位置上 文件名为什么
						String realPath = savePath + "\\" + newFileName;
						File file = new File(realPath);
						// 定义输出流对象
						OutputStream os = new FileOutputStream(file);
						// 将文件写入磁盘 参数3是否自动关闭流
						Streams.copy(is, os, true);
						String fileType = fi.getContentType();// 文件类型
						/*if (!"image/jpeg".equals(fileType)) {
							request.setAttribute("fileError", "上传的文件只支持jpg格式的");
							request.getRequestDispatcher("/userjsps/personinfo.jsp").forward(request, response);
							return;
						}*/
						long fileSize = fi.getSize();// 文件大小
						if (fileSize > 4 * 1024 * 1024&&fileSize < 30 * 1024 * 1024) {
							request.setAttribute("fileSizeError", "上传的图片大小在5KB-30KB之间");
							request.getRequestDispatcher("/userjsps/personinfo.jsp").forward(request, response);
							return;
						}
						/**
						 * 封装文件的实体对象将需要保存到数据库中的数据保存到实体类中准备写入数据库
						 * 根据文件的数量封装成实体对象或集合
						 */
						// 存入数据库是dbPath
					   dbPath = "headImg" + "/" + newFileName;
					} else {
						// 获取普通表单元素的数据并进行封装和准备数据库的插入
					}
				}

				
				user.setHeadimg(dbPath);
				// 调用后台方法完成对封装对象数据访问操作
				int flag = userBiz.upLoadHeadImg(user);

				if (flag > 0) {
					request.setAttribute("upImgMess", "上传成功");
					 request.getRequestDispatcher("/userjsps/personinfo.jsp").forward(request, response);;
				} else {
					request.setAttribute("upImgMess", "上传失败");
					 request.getRequestDispatcher("/userjsps/personinfo.jsp").forward(request, response);
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void findAllUsers(HttpServletRequest request,
			HttpServletResponse response) {
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
		PageBean<User> pb = userBiz.findAllUsers(pc);// 通过bid得到book对象
		// 保存到req中
		pb.setUrl(url);
		request.getSession().setAttribute("pb", pb);
		// 给PageBean设置url，保存PageBean，转发到/adminjsps/BookManager_be.jsp
		try {
			request.getRequestDispatcher("/adminjsps/Index_be.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//异步冻结用户
	public void delUser(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long usid = Long.parseLong(request.getParameter("usid"));
		int res = userBiz.delUser(usid);
		request.setAttribute("json", res);
		try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void quit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		request.getSession().invalidate();
		try {
			response.sendRedirect("/ShareBook/index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void findNewUser(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<UserVo> uvList = userBiz.findNewUser();
		//转化json 
		JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
		 jsonConfig.setIgnoreDefaultExcludes(false); //
		 //jsonConfig.setExcludes(new String[]{"order"});//定义过滤的属性
		jsonConfig.setCycleDetectionStrategy (CycleDetectionStrategy.LENIENT);// 自动过滤 JSONObject json =
		 JSONArray json = JSONArray.fromObject(uvList, jsonConfig); 
		 request.setAttribute("json", json); // 将json发送到页面中
		 try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
