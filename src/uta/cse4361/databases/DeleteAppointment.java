/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import javax.ejb.Stateless;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import uta.cse4361.businessobjects.Appointment;

import java.sql.SQLException;

/**
 *
 * @author Han
 */
public class DeleteAppointment extends RDBImplCommand{
    
    private int id;
    private String sqlQuery = "DELETE FROM APPOINTMENT WHERE ApptID = ?";
    
    public DeleteAppointment(int apptID) {
        super(); 
     this.id = apptID;
        DatabaseManager dm = new DatabaseManager();
         Appointment appt = dm.getAppointment(this.id);
         String semail=appt.getStudentEmail();
         sendCancelNotification(semail);
        
    }

    @Override
    public void queryDB() throws SQLException {
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, id);
            statement.executeUpdate();
            processResult();
        }
        catch (SQLException e){
            System.out.println("DeleteAppointment query failed");
            conn.close();
        } finally {
            statement.close();
        }
    }

    @Override
    public void processResult() {
        result = "";
    }
      public static void sendCancelNotification(String studentEmail) {
		try {
			String to = studentEmail;
			String subject = "Appointment is canceled";
			String body = "Your Mav Appointment with Advisor is canceled. Please login to make new appointment.";
			String from = "mavnotification2017@gmail.com";
			String pw = "mavnotification2018";
			String host = "smtp.gmail.com";
			String port = "465";
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.user", from);
			properties.put("mail.smtp.password", pw);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.socketFactory.port", "465");
			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

			Session session = Session.getDefaultInstance(properties,null);

			javax.mail.Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setText(body);
			message.setSubject(subject);
                        Transport transport = session.getTransport("smtps");
        transport.connect("smtp.gmail.com",465,from,pw);
        transport.sendMessage(message,message.getAllRecipients());
        transport.close();
			Transport.send(message);
			System.out.println("Message sent successfully.");
		} catch (Exception mex) {
			mex.printStackTrace();
		}
	}
}
