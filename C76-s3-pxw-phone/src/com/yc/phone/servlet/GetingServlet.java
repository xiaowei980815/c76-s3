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
   * Ӧ�������Ķ���
   * 1�������
   * 2.�������ڳ�
   */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.��ȡ���е�ͼƬ�ļ�
		 * 2.ѭ������HTML����
		 */
		String webpath="/images/fulls";
		//��ȡӦ�������¶���
		ServletContext application=this.getServletContext();
		//��web·��ת��Ϊ����·��
		String dispath=application.getRealPath(webpath);
		//�����ļ�����
		File dir=new File(dispath);
		System.out.println(dir);
		String [] filenameArray=dir.list();
		String s=
			"<article class=\"thumb\">\n"+
				"<a href=\"images/fulls/%s\" class=\"image\">\n"+
					"<img src=\"mages/fulls/%s\" alt=\"\" />\n"+
				"</a>\n"+
				"<h2>��Ƭ��</h2>\n"+
				"<p>��Ƭ����</p>\n"+
			"</article>\n";
		//�ַ�����ƴ��   1.StringBuilder ���߳�Ч�ʸ�   2.StringBuffer 
		for(String filename:filenameArray){
			String ss=String.format(s, filename,filename);
			response.getWriter().append(ss);
			
		}
	}

}
