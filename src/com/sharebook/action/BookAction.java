package com.sharebook.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.sharebook.biz.BookBiz;
import com.sharebook.biz.impl.BookBizImpl;
import com.sharebook.entity.Book;
import com.sharebook.entity.BookBaseInfo;
import com.sharebook.entity.BookCondiction;
import com.sharebook.entity.BookImgDealTypeVo;
import com.sharebook.entity.BookUserCategoryVo;
import com.sharebook.entity.BookVo;
import com.sharebook.entity.Category;
import com.sharebook.entity.Remark;
import com.sharebook.entity.User;
import com.sharebook.pager.PageBean;
import com.sharebook.util.MailUitls;

public class BookAction {
	private BookBiz bookBiz = new BookBizImpl();

	public void addBook(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 1获取页面数据
		// 2数据校验
		// 3校验通过，从session中获取user

		// 判断表单是否以流的形式提交数据enctype="multipart/form-data"
		String dbPath = "";
		Book book = new Book();
		Category category = new Category();
		try {
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

						String savePath = request.getServletContext()
								.getRealPath("\\book_image");

						// 创建File对象用于确定文件需要保存在什么样的位置上 文件名为什么
						String realPath = savePath + "\\" + newFileName;
						File file = new File(realPath);
						// 定义输出流对象
						OutputStream os = new FileOutputStream(file);
						// 将文件写入磁盘 参数3是否自动关闭流
						Streams.copy(is, os, true);
						String fileType = fi.getContentType();// 文件类型
						if (!("image/jpeg".equals(fileType)||"image/png".equals(fileType))) {
							request.setAttribute("fileError", "上传的文件只支持jpg和png格式的");
							request.getRequestDispatcher(
									"/userjsps/addBook.jsp").forward(
									request, response);
							return;
						}
						long fileSize = fi.getSize();// 文件大小
						if (fileSize<1024*5||fileSize > 1 * 1024 *30 ) {
							request.setAttribute("fileSizeError", "上传的图片要在5KB-30KB");
							request.getRequestDispatcher(
									"/userjsps/addBook.jsp").forward(
									request, response);
							return;
						}
						/**
						 * 封装文件的实体对象将需要保存到数据库中的数据保存到实体类中准备写入数据库
						 * 根据文件的数量封装成实体对象或集合
						 */
						// 存入数据库是dbPath
						dbPath = "book_image" + "/" + newFileName;

					} else {
						// //对数据进行校验
						// 获取普通表单元素的数据并进行封装和准备数据库的插入
						if ("bookName".equals(fi.getFieldName())) {
							if (fi.getString("utf-8").trim() == "") {
								request.setAttribute("booError", "书名不能为空");
								request.getRequestDispatcher(
										"/userjsps/addBook.jsp").forward(
										request, response);
								return;
							} else {
								book.setBookName(fi.getString("utf-8"));
							}
						}
						if ("author".equals(fi.getFieldName())) {
							if (fi.getString("utf-8").trim() == "") {
								request.setAttribute("autError", "作者不能为空");
								request.getRequestDispatcher(
										"/userjsps/addBook.jsp").forward(
										request, response);
								return;
							} else {
								book.setAuthor(fi.getString("utf-8"));
							}
						}
						if ("publishTime".equals(fi.getFieldName())) {
							if (fi.getString("utf-8").trim() == "") {
								request.setAttribute("pubError", "出版时间不能为空");
								request.getRequestDispatcher(
										"/userjsps/addBook.jsp").forward(
										request, response);
								return;
							} else {
								String pt = fi.getString("utf-8");
								DateFormat df = new SimpleDateFormat(
										"yyyy-MM-dd");
								Date publishTime = df.parse(pt);
								book.setPublishTime(publishTime);
							}

						}
						if ("press".equals(fi.getFieldName())) {
							if (fi.getString("utf-8").trim() == "") {
								request.setAttribute("preError", "出版社不能为空");
								request.getRequestDispatcher(
										"/userjsps/addBook.jsp").forward(
										request, response);
								return;
							} else {
								book.setPress(fi.getString("utf-8"));
							}
						}
						if ("edition".equals(fi.getFieldName())) {
							if (fi.getString("utf-8").trim() == ""
									|| !fi.getString("utf-8").matches(
											"^[1-9]$")) {
								request.setAttribute("ediError", "版次为一位数字");
								request.getRequestDispatcher(
										"/userjsps/addBook.jsp").forward(
										request, response);
								return;
							} else {
								book.setEdition(Integer.parseInt(fi
										.getString("utf-8")));
							}
						}
						if ("category".equals(fi.getFieldName())) {
							if (fi.getString("utf-8").trim() == "0") {
								request.setAttribute("catError", "请选择类别");
								request.getRequestDispatcher(
										"/userjsps/addBook.jsp").forward(
										request, response);
								return;
							} else {
								category.setCid(Long.parseLong(fi
										.getString("utf-8")));
								book.setCategory(category);
							}
						}
						if ("dealType".equals(fi.getFieldName())) {
							if (fi.getString("utf-8").trim() == "2") {
								request.setAttribute("deaError", "请选择交易类型");
								request.getRequestDispatcher(
										"/userjsps/addBook.jsp").forward(
										request, response);
								return;
							} else {
								book.setDealType(Integer.parseInt(fi
										.getString("utf-8")));
							}
						}
					}
				}
			}

			// 调用后台方法完成对封装对象数据访问操作
			// 设置上传日期
			Date date = new Date();
			book.setUploadTime(date);
			// 设置书主
			User user = (User) request.getSession().getAttribute("user");
			book.setUser(user);
			// 设置图片路径
			book.setBookImg(dbPath);
			// 设置审核状态
			book.setBookState(0);
			//设置图书交易状态状态
			book.setDealState("待交换");
			int flag = bookBiz.addBook(book);

			if (flag > 0) {
				request.setAttribute("uploadMsg", 2);
				request.getRequestDispatcher("/public/addBookMsg.jsp").forward(
						request, response);
			} else {
				request.setAttribute("uploadMsg", 1);
				request.getRequestDispatcher("/public/addBookMsg.jsp").forward(
						request, response);
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
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 分页显示所有用户图书
	public void findUserBooks(HttpServletRequest request,
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
		User user = (User) request.getSession().getAttribute("user");
		// 根据用户查询图书
		PageBean<Book> pb = bookBiz.findUserBooks(user.getUsid(), pc);// 通过bid得到book对象
		// 保存到req中
		pb.setUrl(url);
		request.getSession().setAttribute("pb", pb);
		// 给PageBean设置url，保存PageBean，转发到/userjsps/mybooks.jsp
		try {
			request.getRequestDispatcher("/userjsps/mybooks.jsp").forward(
					request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 分页显示所有图书

	// 用户修改图书
	public void modifyBook(HttpServletRequest request,
			HttpServletResponse response) {
		// 获取页面数据
		String bookName = request.getParameter("bookName");
		String author = request.getParameter("author");
		String publishTime = request.getParameter("publishTime");
		String press = request.getParameter("press");
		String edition = request.getParameter("edition");
		String dealType = request.getParameter("dealType");

		try {
			if (bookName.trim() == "" || bookName == null) {
				request.setAttribute("booError", "书名不能为空");
				request.getRequestDispatcher("/userjsps/modifyBook.jsp")
						.forward(request, response);
				return;
			}
			if (author.trim() == "" || author == null) {
				request.setAttribute("autError", "作者不能为空");
				request.getRequestDispatcher("/userjsps/modifyBook.jsp")
						.forward(request, response);
				return;
			}
			if (publishTime.trim() == "" || publishTime == null) {
				request.setAttribute("pubError", "出版时间不能为空");
				request.getRequestDispatcher("/userjsps/modifyBook.jsp")
						.forward(request, response);
				return;
			}
			if (press.trim() == "" || press == null) {
				request.setAttribute("preError", "出版社不能为空");
				request.getRequestDispatcher("/userjsps/modifyBook.jsp")
						.forward(request, response);
				return;
			}
			if (edition.trim() == "" || edition == null
					|| !edition.matches("^[1-9]{1,2}$")) {
				request.setAttribute("deiError", "版次为数字");
				request.getRequestDispatcher("/userjsps/modifyBook.jsp")
						.forward(request, response);
				return;
			}
			Long bid = Long.parseLong(request.getParameter("bid"));
			// 封装数据
			Book book = new Book();
			book.setBookName(bookName);
			book.setAuthor(author);
			book.setBid(bid);
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date publishdate = df.parse(publishTime);
			book.setPublishTime(publishdate);
			book.setEdition(Integer.parseInt(edition));
			book.setPress(press);
			book.setDealType(Integer.parseInt(dealType));

			// 从session中获取user
			User user = (User) request.getSession().getAttribute("user");
			book.setUser(user);

			// 保存数据
			int res = bookBiz.modifyBook(book);
			if (res == 1) {
				request.setAttribute("modifyMess", 1);
				request.getRequestDispatcher("/public/modifyBookMsg.jsp").forward(
						request, response);
				return;
			} else {
				request.setAttribute("modifyMess", 0);
				request.getRequestDispatcher("/userjsps/mybooks.jsp").forward(
						request, response);
				return;
			}

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 页面跳转到修改图书页面
	public void modifyBookPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String params = request.getParameter("params");
		try {
			Long bid = Long.parseLong(params);
			// 根据图书id查找图书
			Book book = bookBiz.findBookById(bid);
			if (book == null) {
				request.setAttribute("findno", "对不起此书不存在");
				request.getRequestDispatcher("/userjsps/mybooks.jsp").forward(
						request, response);
			}
			request.setAttribute("book", book);
			request.getRequestDispatcher("/userjsps/modifyBook.jsp").forward(
					request, response);

		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void findBookPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String params = request.getParameter("params");
		try {
			/*if (params.length() > 5) {
				request.setAttribute("mbox", "请选择一条记录");
				request.getRequestDispatcher("/userjsps/mybooks.jsp").forward(
						request, response);
				return;
			}*/
			Long bid = Long.parseLong(params);
			// 根据图书id查找图书
			Book book = bookBiz.findBookById(bid);
			if (book == null) {
				request.setAttribute("findno", "对不起此书不存在");
				request.getRequestDispatcher("/userjsps/mybooks.jsp").forward(
						request, response);
			}
			request.setAttribute("book", book);
			request.getRequestDispatcher("/userjsps/bookdetail.jsp").forward(
					request, response);

		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delSomeBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String params = request.getParameter("params");

		try {
			if (params.trim() == "" || params == null) {
				request.setAttribute("delError", "请选择要删除的记录");
				request.getRequestDispatcher("/userjsps/mybooks.jsp").forward(
						request, response);
				;
			}

			String[] str = params.split(",");
			Long[] bids = new Long[str.length];
			for (int i = 0; i < bids.length; i++) {
				bids[i] = Long.parseLong(str[i]);
			}
			int res = bookBiz.delSomeBook(bids);
			if (res > 0) {
				response.sendRedirect("/ShareBook/findUserBooks.action");
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查找所有有效的图书
	public void findAllBooks(HttpServletRequest request,
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
				PageBean<BookVo> pb = bookBiz.findAllBooks(pc);// 通过bid得到book对象
				// 保存到req中
				pb.setUrl(url);
				request.getSession().setAttribute("pb", pb);
				// 给PageBean设置url，保存PageBean，转发到/adminjsps/BookManager_be.jsp
				try {
					request.getRequestDispatcher("/adminjsps/BookManager_be.jsp")
					.forward(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	}

	// 查找待审核的图书
	public void findNotAgreeBook(HttpServletRequest request,
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
		PageBean<BookVo> pb = bookBiz.findNotAgreeBook(pc);// 通过bid得到book对象
		// 保存到req中
		pb.setUrl(url);
		request.getSession().setAttribute("pb", pb);
		// 给PageBean设置url，保存PageBean，转发到/adminjsps/BookManager_be.jsp
		try {
			request.getRequestDispatcher("/adminjsps/ToCheckBookManager_be.jsp")
			.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	// 图书审核通过
	public void agreeAddBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long bid = Long.parseLong(request.getParameter("bid"));
		String email = request.getParameter("email");
		String bookName = request.getParameter("bookName");
		int re = bookBiz.agreeAddBook(bid, email, bookName);
		if (re > 0) {
			try {
				response.sendRedirect("findNotAgreeBook.action");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
			
		}
	}

	// 发送不同意邮件
	public void notAgreeAddBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long bid = Long.parseLong(request.getParameter("bid"));
		String email = request.getParameter("email");
		String bookName = request.getParameter("bookName");
		
		int re = bookBiz.notAgreeAddBook(bid, email, bookName);
		if (re > 0) {
			try {
				response.sendRedirect("findNotAgreeBook.action");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
			
		}

	}

	public void delAdminBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long bid = Long.parseLong(request.getParameter("bid"));
		int res = bookBiz.delAdminBook(bid);
		if (res > 0) {
			try {
				response.sendRedirect("/ShareBook/findAllBooks.action");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// 异步请求
	public void findAllUserBooks(HttpServletRequest request,
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
		PageBean<BookImgDealTypeVo> pb = bookBiz.findAllUserBooks(pc);// 通过bid得到book对象
		// 给PageBean设置url，保存PageBean，
		pb.setUrl(url);
		/*
		 * 转化json JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
		 * jsonConfig.setIgnoreDefaultExcludes(false); //
		 * jsonConfig.setExcludes(new String[]{"order"});//定义过滤的属性
		 * jsonConfig.setCycleDetectionStrategy
		 * (CycleDetectionStrategy.LENIENT);// 自动过滤 JSONObject json =
		 * JSONObject.fromObject(pb, jsonConfig); request.setAttribute("json",
		 * json); // 将json发送到页面中
		 */
		try {
			request.getRequestDispatcher("/public/myHome.jsp").forward(request,
					response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void findBooksByCid(HttpServletRequest request,
			HttpServletResponse response) {
		 		String cid =request.getParameter("cid");
		 		Long cid1=0l;
				if(cid==null){
					 cid1 = (Long) request.getSession().getAttribute("cid");
				}else{
					cid1=Long.parseLong(request.getParameter("cid"));
					request.getSession().setAttribute("cid", cid1);
				}
			   
				//获取当前页码
				int pc = 1;
				String param = request.getParameter("pc");
				if(param != null && !param.trim().isEmpty()) {
						pc = Integer.parseInt(param);
				}
			 // 截取url，页面中的分页导航中需要使用它做为超链接的目标！
			  //http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
			 //goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
				String url = request.getRequestURI();
				// 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
				int index = url.lastIndexOf("?");
				if(index != -1) {
					url = url.substring(0, index);
				}
				//根据用户查询图书
				PageBean<BookImgDealTypeVo> pb= bookBiz.findBooksByCid(cid1,pc);//通过bid得到book对象
				//保存到req中
				pb.setUrl(url);
				request.setAttribute("pb", pb);
				//给PageBean设置url，保存PageBean，转发到/userjsps/myhome.jsp
				try {
					request.getRequestDispatcher("/userjsps/myHome.jsp").forward(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}

	public void findBooksBybid(HttpServletRequest request,
			HttpServletResponse response) {
		Long bid =Long.parseLong(request.getParameter("bid"));
		Book book = bookBiz.findBookById(bid);
		request.setAttribute("book", book);
		try {
			request.getRequestDispatcher("/userjsps/anybookdetail.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void findBookByLikeName(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String  bookN= request.getParameter("bookName");
		String bookName="";
		if(bookN==null){
			bookName = (String) request.getSession().getAttribute("bookN");
		}else{
			bookName=bookN;
			request.getSession().setAttribute("bookN", bookName);
		}
		
		try {
			bookName = new String(bookName.getBytes("iso-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//获取当前页码
		int pc = 1;
		String param = request.getParameter("pc");
		if(param != null && !param.trim().isEmpty()) {
				pc = Integer.parseInt(param);
		}
	 // 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	  //http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
	 //goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
		String url = request.getRequestURI();
		// 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		int index = url.lastIndexOf("?");
		if(index != -1) {
			url = url.substring(0, index);
		}
		//根据用户查询图书
		PageBean<BookImgDealTypeVo> pb= bookBiz.findBookByLikeName(bookName,pc);//通过bid得到book对象
		//保存到req中
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		//给PageBean设置url，保存PageBean，转发到/userjsps/myhome.jsp
		try {
			request.getRequestDispatcher("/userjsps/myHome.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void findBookByManyCrial(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		//获取当前页码
				int pc = 1;
				String param = request.getParameter("pc");
				if(param != null && !param.trim().isEmpty()) {
						pc = Integer.parseInt(param);
				}
			 // 截取url，页面中的分页导航中需要使用它做为超链接的目标！
			  //http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
			 //goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
				String url = request.getRequestURI();
				// 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
				int index = url.lastIndexOf("?");
				if(index != -1) {
					url = url.substring(0, index);
				}
				//从页面获取查询条件
				String bookName = request.getParameter("bookName");
				String author = request.getParameter("author");
				String press = request.getParameter("press");
				String edition = request.getParameter("edition");
				//封装数据
				BookCondiction bc = new BookCondiction();
				//根据用户查询图书
				bc.setBookName(bookName);
				bc.setAuthor(author);
				bc.setPress(press);
				if(edition == null||edition==""||edition.trim()==""){
					bc.setEdition(0);
				}else{
					bc.setEdition(Integer.parseInt(edition));
				}
				
				PageBean<BookImgDealTypeVo> pb= bookBiz.findBookByManyCrial(bc,pc);//通过bid得到book对象
				//保存到req中
				pb.setUrl(url);
				request.setAttribute("pb", pb);
				//给PageBean设置url，保存PageBean，转发到/userjsps/myhome.jsp
				try {
					request.getRequestDispatcher("/userjsps/myHome.jsp").forward(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	}
	//查找最新的图书
	public void findLastNewBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<BookBaseInfo> bbiList = bookBiz.findLastNewBook();
		//转化json 
		JsonConfig jsonConfig = new JsonConfig();//定义数据过滤对象
		 jsonConfig.setIgnoreDefaultExcludes(false); //
		 //jsonConfig.setExcludes(new String[]{"order"});//定义过滤的属性
		jsonConfig.setCycleDetectionStrategy (CycleDetectionStrategy.LENIENT);// 自动过滤 JSONObject json =
		 JSONArray json = JSONArray.fromObject(bbiList, jsonConfig); 
		 request.setAttribute("json", json); // 将json发送到页面中
		 try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//首页翻页异步请求
	public void findSomeNewBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		request.getSession().setAttribute("curPageNum", pageNum);
		List<BookBaseInfo> someList = bookBiz.findSomeNewBook(pageNum);
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
	//异步请求总页数
	public void totalPagesBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int totalPages = bookBiz.totalPagesBook();
		request.setAttribute("json", totalPages);
		try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void nextPageBook(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Object cpn = request.getSession().getAttribute("curPageNum");
		int total = bookBiz.totalPagesBook();
		int pageNum=0;
		if(cpn==null){
			pageNum=2;
			request.getSession().setAttribute("curPageNum",pageNum);
		}else{
			if((Integer)cpn>total){
				request.setAttribute("json", 0);
				try {
					request.getRequestDispatcher("/public/json.jsp").forward(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}else{
				pageNum=(Integer)cpn+1;
				request.getSession().setAttribute("curPageNum", pageNum);
			}
		}
		
		List<BookBaseInfo> someList=bookBiz.findSomeNewBook(pageNum);
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

	public void changDealState(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Long bid = Long.parseLong(request.getParameter("bid"));
		String dealState = request.getParameter("dealState");
		int re = bookBiz.changDealState(bid,dealState);
		request.setAttribute("json", re);
		try {
			request.getRequestDispatcher("/public/json.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

}
