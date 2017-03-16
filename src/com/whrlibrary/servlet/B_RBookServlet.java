package com.whrlibrary.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whrlibraray.dao.impl.BookDbJdbcImpl;
import com.whrlibrary.dao.BookDAO;

/**
 * Servlet implementation class B_RBookServlet
 */
@WebServlet("/B_RBookServlet")
public class B_RBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BookDAO bookDAO = new BookDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public B_RBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("operation");
		int bookID = Integer.valueOf(request.getParameter("b_id"));
		if(op.equals("borrow")){
			int readerID = Integer.valueOf(request.getParameter("r_id"));
			bookDAO.borrowBook(readerID, bookID);
		}else if(op.equals("return")){
			bookDAO.returnBook(bookID);
		}
		request.getRequestDispatcher("/management.jsp").forward(request,
                response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
