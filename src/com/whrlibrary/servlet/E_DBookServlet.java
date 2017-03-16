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
 * Servlet implementation class E_DBookServlet
 */
@WebServlet("/E_DBookServlet")
public class E_DBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDAO bookDAO = new BookDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public E_DBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("action");
		if(act.equals("edit")){
			int bookID = Integer.valueOf(request.getParameter("id"));
			String bookName = request.getParameter("bookName");
			System.out.println(bookName);
			String writer = request.getParameter("writer");
			String pblm = request.getParameter("pblm");
			Date dt = Date.valueOf(request.getParameter("coTime"));
			System.out.println(dt);
			Book book = new Book(bookID,bookName, pblm, writer, dt);
			bookDAO.editBook(book);
			request.getRequestDispatcher("/management.jsp").forward(request,
                    response);
		}else if(act.equals("del")){
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			bookDAO.deleteBook(id);
			request.getRequestDispatcher("/management.jsp").forward(request,
                    response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
