package com.whrlibrary.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whrlibraray.dao.impl.ReBookDbJdbcImpl;
import com.whrlibrary.dao.ReBookDAO;
import com.whrlibrary.obj.ReBook;

/**
 * Servlet implementation class GetReOpServlet
 */
@WebServlet("/GetReOpServlet")
public class GetReOpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReBookDAO reBookDAO = new ReBookDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReOpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("choosea_b");
		if(op.equals("before")){
			List<ReBook> b_list = reBookDAO.getBeReBook();
			for(ReBook book : b_list){
				System.out.println(book.getPublishment());
			}
			request.setAttribute("bbooks", b_list);
			request.setAttribute("abooks", null);
		}else if(op.equals("after")){
			List<ReBook> a_list = reBookDAO.getAfReBook();
			request.setAttribute("abooks", a_list);
			request.setAttribute("bbooks", null);
		}
		request.getRequestDispatcher("/management.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
