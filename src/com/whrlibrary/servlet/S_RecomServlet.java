package com.whrlibrary.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whrlibraray.dao.impl.BookDbJdbcImpl;
import com.whrlibraray.dao.impl.ReBookDbJdbcImpl;
import com.whrlibrary.dao.BookDAO;
import com.whrlibrary.dao.ReBookDAO;
import com.whrlibrary.obj.Book;

/**
 * Servlet implementation class S_RecomServlet
 */
@WebServlet("/S_RecomServlet")
public class S_RecomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReBookDAO reBookDAO = new ReBookDbJdbcImpl();
	private BookDAO bookDAO = new BookDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public S_RecomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String[] list = request.getParameterValues("rcheckbox");
		for(String s : list){
			String[] s1 = s.split(" ");
			String bookName = s1[0];
			String publishment = s1[4];
			String writer = s1[2];
			Date dt = Date.valueOf(s1[6]);
			Book newBook = new Book(bookName,publishment,writer,dt,1);
			bookDAO.addBook(newBook);
			reBookDAO.solveReBook(bookName);
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
