package com.whrlibrary.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whrlibraray.dao.impl.ReaderDbJdbcImpl;
import com.whrlibrary.dao.ReaderDAO;

/**
 * Servlet implementation class AddReaderServlet
 */
@WebServlet("/AddReaderServlet")
public class AddReaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReaderDAO readerDAO = new ReaderDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReaderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String readerName = request.getParameter("readerName");
		String pwd = request.getParameter("rpwd");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		readerDAO.addReader(readerName, pwd, sex, tel, "");
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
