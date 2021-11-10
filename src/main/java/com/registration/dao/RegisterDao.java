package com.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import com.registration.model.Register;
import com.registration.sendemail.SendEmail;

public class RegisterDao {

	public int Registeration(Register register) throws ClassNotFoundException {

		String q1 = "insert into party(partyid,firstname,lastname,address,city,state,country,pincode,phone) values(?,?,?,?,?,?,?,?,?)";
		String q2 = "insert into userlogin(partyid,userLoginId,password) values(?,?,?)";
		int result = 0;
		int partyId=0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection con = DriverManager.getConnection("jdbc:mysql:///advancehotwax", "root", "root");
				PreparedStatement preparedStatement3= con.prepareStatement(q1);
				PreparedStatement preparedStatement1=con.prepareStatement(q2);) {
			PreparedStatement preparedStatement2=con.prepareStatement("select max(partyId) from party");
			ResultSet resultSet=preparedStatement2.executeQuery();
			if(resultSet.next())
			{
				partyId=resultSet.getInt(1);
				partyId++;				
			}
		
			
			String fname=register.getFirstName();
			String lname=register.getLastName();
			String address=register.getAddress();
			String city=register.getCity();
			String state=register.getState();
			String country=register.getCountry();
			String pincode=register.getPincode();
			String phone= register.getPhone();
			
			String email=register.getEmail();
			String password=register.getPassword();
			try {			
				PreparedStatement preparedStatement=con.prepareStatement("select * from userlogin where userLoginId=?");
				preparedStatement.setString(1, register.getEmail());
				ResultSet resultSet2=preparedStatement.executeQuery();
			
				if(resultSet2.next())
				{
				String checkEmail= resultSet.getString("userLoginId");
				if(email.equals(checkEmail))
				{
					System.out.print("Email already");
				}
				}
				else {
			preparedStatement3.setInt(1,partyId);		
			preparedStatement3.setString(2, fname);
			preparedStatement3.setString(3, lname);
			preparedStatement3.setString(4, address);
			preparedStatement3.setString(5, city);
			preparedStatement3.setString(6, state);
			preparedStatement3.setString(7, country);
			preparedStatement3.setString(8, pincode);
			preparedStatement3.setString(9, phone);

			preparedStatement3.executeUpdate();
			
			String q="select max(partyid) from party";
			Statement statement=(Statement)con.createStatement();
			
			ResultSet resultSet1=statement.executeQuery(q);
			
			resultSet1.next();
			int id=resultSet1.getInt(1);
			System.out.println(id);
			 
			preparedStatement1.setInt(1, id);
			preparedStatement1.setString(2,email);
			preparedStatement1.setString(3,password);
			
			
			
			int i=preparedStatement1.executeUpdate();
			
			if(i!=0)
			{
				SendEmail se=new SendEmail(email);
				se.sendEmail();
			}
				}
			
				}catch (Exception e) {
					e.printStackTrace();
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	private void setString(int i, String firstName) {
		// TODO Auto-generated method stub

	}
}
