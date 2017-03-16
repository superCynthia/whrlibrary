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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReaderDAO readerDAO = new ReaderDbJdbcImpl();
    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
        String pwd = request.getParameter("pwd");
        Reader reader = readerDAO.getReader(id, pwd);
        if (reader == null) {
            request.setAttribute("id", id);
            request.setAttribute("pwd",pwd);
            request.getRequestDispatcher("/mainpage.jsp").forward(request,
                    response);
        } else {
            HttpSession session= request.getSession();
            session.setAttribute("currentUser", reader);
            session.setAttribute("currentMUser", null);
            if (request.getParameter("remember")=="0") {
            	Cookie username_Cookie =new Cookie("id",String.valueOf(id));
            	username_Cookie.setMaxAge(60*60*24*7);
            	response.addCookie(username_Cookie);
            	Cookie userPassword_Cookie=new Cookie("pwd", pwd);
            	userPassword_Cookie.setMaxAge(60*60*24*7);
            	response.addCookie(userPassword_Cookie);
			}
            
            request.getRequestDispatcher("NewFile.jsp").forward(request,response);
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
