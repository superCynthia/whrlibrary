package com.whrlibrary.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whrlibraray.dao.impl.BookDbJdbcImpl;
import com.whrlibraray.dao.impl.ElecsrcDbJdbcImpl;
import com.whrlibrary.dao.BookDAO;
import com.whrlibrary.dao.ElecsrcDAO;
import com.whrlibrary.obj.Book;
import com.whrlibrary.obj.Elecsrc;

/**
 * Servlet implementation class MSearchBookServlet
 */
@WebServlet("/MSearchBookServlet")
public class MSearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BookDAO bookDAO = new BookDbJdbcImpl();
	private ElecsrcDAO elecsrcDAO = new ElecsrcDbJdbcImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MSearchBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("keyword");
		String type1 = request.getParameter("exampleSelect1");
		String type2 = request.getParameter("exampleSelect2");
		System.out.println(type1);
		Search(request,response,key,type1,type2);
	}

	private void Search(HttpServletRequest request, HttpServletResponse response, String key, String type1, String type2) {
		List<Book> books;
		List<Elecsrc> elecsrcs;
		if(type2.equals("图书检索")){
			switch (type1) {
			case "书名":
				books = bookDAO.getBookforName(key);
				request.setAttribute("books", books);
				break;
			case "作者":
				books = bookDAO.getBookforWriter(key);
				request.setAttribute("books", books);
				break;
			case "出版社":
				books = bookDAO.getBookforPbm(key);
				request.setAttribute("books", books);
				break;
			default:
				break;
			}
		}else {
			elecsrcs = elecsrcDAO.getSrcForName(key);
			request.setAttribute("elecsrcs", elecsrcs);
		}
		
		try {
			request.getRequestDispatcher("/management.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
