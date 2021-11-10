package com.registration.sendemail;

import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.Authenticator;
import javax.mail.internet.*;

public class SendEmail {

	private String userEmail;
	
	public SendEmail(String userEmail)
	{
		super();
		this.userEmail=userEmail;
	}

	public void sendEmail()
	{
		//Here provide the email id and password from which you want to send the mail.
	String email="";
	String password="";
	
	Properties properties = System.getProperties();
	System.out.println("Properties" + properties);

	properties.put("mail.smtp.host", "smtp.gmail.com");
	properties.put("mail.smtp.port", "465");
	properties.put("mail.smtp.ssl.enable", "true");
	properties.put("mail.smtp.auth", "true");
	
	Session session = Session.getInstance(properties, new Authenticator() {

		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(email,password);
		}
	});
	session.setDebug(true);
	MimeMessage mimeMessage = new MimeMessage(session);
	try {
		mimeMessage.setFrom(new InternetAddress(email));
		mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
		mimeMessage.setSubject("verification Confermation");
		mimeMessage.setText("Successfully Rgister....");

		Transport.send(mimeMessage);
	} catch (Exception e) {
System.out.println("email error");
	}
	}
}
