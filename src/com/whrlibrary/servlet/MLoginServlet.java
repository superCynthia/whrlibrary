package com.whrlibrary.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.whrlibraray.dao.impl.ManagerDbJdbcImpl;
import com.whrlibrary.dao.ManagerDAO;
import com.whrlibrary.obj.Manager;

/**
 * Servlet implementation class MLoginServlet
 */
@WebServlet("/MLoginServlet")
public class MLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ManagerDAO managerDAO = new ManagerDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("mid"));
        String pwd = request.getParameter("mpwd");
        Manager manager = managerDAO.getManager(id, pwd);
        if (manager == null) {
            request.setAttribute("mid", id);
            request.setAttribute("mpwd",pwd);
            request.getRequestDispatcher("/mainpage.jsp").forward(request,
                    response);
        } else {
            HttpSession session= request.getSession();
            session.setAttribute("currentMUser", manager);
            session.setAttribute("currentUser", null);
            if (request.getParameter("remember")=="0") {
            	Cookie username_Cookie =new Cookie("mid",String.valueOf(id));
            	username_Cookie.setMaxAge(60*60*24*7);
            	response.addCookie(username_Cookie);
            	Cookie userPassword_Cookie=new Cookie("mpwd", pwd);
            	userPassword_Cookie.setMaxAge(60*60*24*7);
            	response.addCookie(userPassword_Cookie);
			}
            
            request.getRequestDispatcher("management.jsp").forward(request,response);
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
