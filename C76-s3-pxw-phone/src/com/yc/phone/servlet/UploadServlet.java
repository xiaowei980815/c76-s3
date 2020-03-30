package com.yc.phone.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part =request.getPart("file");
		String filename=part.getSubmittedFileName();
		
		/*
		 * 上传图片到展示目录下
		 */
		String webpath="/image/fulls";
		//获取应用上下文对象
		ServletContext application=this.getServletContext();
		//将web目录转化为磁盘路径
		String diskpath=application.getRealPath(webpath);
		part.write(diskpath+"/"+filename);
		response.getWriter().append("success");
		
	}

}
