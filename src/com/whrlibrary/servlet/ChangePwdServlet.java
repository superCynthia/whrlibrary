package com.whrlibrary.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.whrlibraray.dao.impl.ReaderDbJdbcImpl;
import com.whrlibrary.dao.ReaderDAO;
import com.whrlibrary.obj.Reader;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet("/ChangePwdServlet")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReaderDAO readerDAO = new ReaderDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldpwd = request.getParameter("change1");
		System.out.println(oldpwd);
		String newpwd2 = request.getParameter("change2");
		System.out.println(newpwd2);
		String newpwd = request.getParameter("change3");
		HttpSession session2 = request.getSession();
		Reader reader = (Reader) session2.getAttribute("currentUser");
		System.out.println(reader.getPwd());
		if(newpwd.equals(newpwd2) && reader.getPwd().equals(oldpwd)){
			reader.setPwd(newpwd);
			readerDAO.changePassword(reader);
			session2.setAttribute("currentUser", reader);
			System.out.println(reader.getPwd());
		}else{
			System.out.println("else");
			reader = null;
			session2.setAttribute("currentUser", reader);
		}
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
