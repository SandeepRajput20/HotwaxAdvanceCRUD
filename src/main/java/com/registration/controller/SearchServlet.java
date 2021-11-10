package com.registration.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * implementation class Search
 */
@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String fname = request.getParameter("first_Name");
		String lname = request.getParameter("last_Name");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql:///advancehotwax", "root", "root");

			ArrayList al = null;
			ArrayList userDetail = new ArrayList(18);
			String query = "select * from party where firstname=? and lastname=?";
			PreparedStatement preparedStatement = con.prepareStatement(query);

			preparedStatement.setString(1, fname);
			preparedStatement.setString(2, lname);
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

//			String nextJSP = "viewSearch.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewSearch.jsp");
			dispatcher.forward(request, response);

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
