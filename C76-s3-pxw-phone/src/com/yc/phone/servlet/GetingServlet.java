package com.yc.phone.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetingServlet
 */
@WebServlet("/Geting.do")
public class GetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  /*
   * 应用上下文对象
   * 1作用域广
   * 2.生命周期长
   */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.读取所有的图片文件
		 * 2.循环生成HTML代码
		 */
		String webpath="/images/fulls";
		//获取应用文上下对象
		ServletContext application=this.getServletContext();
		//将web路径转换为磁盘路径
		String dispath=application.getRealPath(webpath);
		//创建文件对象
		File dir=new File(dispath);
		System.out.println(dir);
		String [] filenameArray=dir.list();
		String s=
			"<article class=\"thumb\">\n"+
				"<a href=\"images/fulls/%s\" class=\"image\">\n"+
					"<img src=\"mages/fulls/%s\" alt=\"\" />\n"+
				"</a>\n"+
				"<h2>照片名</h2>\n"+
				"<p>照片介绍</p>\n"+
			"</article>\n";
		//字符串的拼接   1.StringBuilder 单线程效率高   2.StringBuffer 
		for(String filename:filenameArray){
			String ss=String.format(s, filename,filename);
			response.getWriter().append(ss);
			
		}
	}

}
