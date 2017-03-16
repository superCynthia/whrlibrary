package com.whrlibrary.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whrlibraray.dao.impl.BookDbJdbcImpl;
import com.whrlibrary.dao.BookDAO;
import com.whrlibrary.obj.Book;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BookDAO bookDAO = new BookDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String bookName = request.getParameter("aName");
		System.out.println(bookName);
		String writer = request.getParameter("awriter");
		String pblm = request.getParameter("apblm");
		Date dt = Date.valueOf(request.getParameter("atime"));
		System.out.println(dt);
		int count = Integer.valueOf(request.getParameter("count"));
		for(int i = 1;i<=count;i++){
			Book book = new Book(bookName,pblm,writer,dt,i);
			bookDAO.addBook(book);
		}
		request.getRequestDispatcher("/management.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
