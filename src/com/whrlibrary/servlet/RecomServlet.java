package com.whrlibrary.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.whrlibraray.dao.impl.ReBookDbJdbcImpl;
import com.whrlibrary.dao.ReBookDAO;
import com.whrlibrary.obj.ReBook;
import com.whrlibrary.obj.Reader;

/**
 * Servlet implementation class RecomServlet
 */
@WebServlet("/RecomServlet")
public class RecomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReBookDAO reBookDAO = new ReBookDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String rBookName = request.getParameter("recom1");
		String rPblh = request.getParameter("recom2");
		Date dt = Date.valueOf(request.getParameter("recom4"));
		String rwriter = request.getParameter("recom3");
		HttpSession session2 = request.getSession();
		Reader reader = (Reader) session2.getAttribute("currentUser");
		ReBook rbook = new ReBook(rBookName,rPblh,rwriter,dt,reader.getReaderID());
		reBookDAO.AddReBook(rbook);
		request.getRequestDispatcher("NewFile.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
