package com.registration.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowallServlet
 */
@WebServlet("/ShowallServlet")
public class ShowallServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowallServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
			response.setContentType("text/html");

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql:///advancehotwax", "root", "root");

				ArrayList al = null;
				ArrayList userDetail = new ArrayList(18);
				String query = "select * from party";
				PreparedStatement preparedStatement = con.prepareStatement(query);

				ResultSet ResultSet = preparedStatement.executeQuery();

				while (ResultSet.next()) {
					al = new ArrayList();
					
					
					al.add(ResultSet.getInt(1));
					al.add(ResultSet.getString(2));
					al.add(ResultSet.getString(3));
					al.add(ResultSet.getString(4));
					al.add(ResultSet.getString(5));
					al.add(ResultSet.getString(6));
					al.add(ResultSet.getString(7));
					al.add(ResultSet.getString(8));
					al.add(ResultSet.getString(9));
					
					System.out.println("al :: " + al);
					userDetail.add(al);
				}

				request.setAttribute("userDetail", userDetail);

//				String nextJSP = "viewSearch.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ShowAll.jsp");
				dispatcher.forward(request, response);

				con.close();
			} catch (Exception e) {
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
