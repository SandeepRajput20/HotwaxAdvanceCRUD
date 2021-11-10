package com.registration.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.registration.dao.LoginDao;
import com.registration.model.Login;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private LoginDao loginDao=new LoginDao();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("userEmail");
		String password=request.getParameter("userPassword");
		
		Login login=new Login();
		login.setEmail(email);
		login.setPassowrd(password);
		
		try {
			
			if(loginDao.loginValidate(login))
			{
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
	            requestDispatcher.forward(request, response);
			}
			else
			{
				out.println("<h1>Invalid User</h1>");
			}
			
		} catch (Exception e) {
e.printStackTrace();
		}
		
		
	}

}
