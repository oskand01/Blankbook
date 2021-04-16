package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.MessageBean;


public class SQLMessageCon {
	
	static Connection conn = null;
	static PreparedStatement stmt = null; // skyddar bättre
	static ResultSet rs = null;

	public static boolean connectSQL() {

		try {

			// driver setup
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception ex) {
			// handle the error
			System.out.println("Exception Driver: " + ex);
			return false;
		}

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/message?serverTimezone=UTC",
					DatabaseLogin.getuName(), DatabaseLogin.getuPass());
			return true;

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return false;
		}

	}

	public static ArrayList<MessageBean> getMessages() {

		// test a query
		try {
			String requestQuery = "SELECT `userName`, `message`, `datetime`, `tag` FROM `message` ORDER BY messageId DESC";
			ArrayList<MessageBean> messages = new ArrayList<MessageBean>();

			stmt = conn.prepareStatement(requestQuery);
			
			
			/*
			 * stmt.setString(1, bean.getEmail()); stmt.setString(2, bean.getPassword());
			 */

			rs = stmt.executeQuery();
			// ResultSet return
			while (rs.next()) {
				MessageBean bean = new MessageBean();

				// print them
				//System.out.println(rs.getInt(1) + "  " + rs.getInt(2) + "  " + rs.getString(3) + "  " + rs.getString(4) + "  " + rs.getString(5));

				bean.setMessage(rs.getString("message"));
				bean.setDate(rs.getString("datetime"));
				bean.setUserName(rs.getString("userName"));
				bean.setTag(rs.getString("tag"));
				messages.add(bean);
				

			}
			conn.endRequest();
			conn.close();

			
			System.out.println("== GOT MESSAGES ==");
			return messages;
			

		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());

		}
		return null;

	}
	
	public static ArrayList<MessageBean> getMessagesByTag(String tag) {

		// test a query
		try {
			String requestQuery = "SELECT * FROM message WHERE tag = ? ORDER BY messageId DESC";
			ArrayList<MessageBean> messages = new ArrayList<MessageBean>();
			
			
			
			System.out.println(tag);

			
			stmt = conn.prepareStatement(requestQuery);
			stmt.setString(1, tag);
			/*
			 * stmt.setString(1, bean.getEmail()); stmt.setString(2, bean.getPassword());
			 */

			rs = stmt.executeQuery();
			// ResultSet return
			while (rs.next()) {
				MessageBean bean = new MessageBean();

				// print them
				System.out.println(rs.getString("tag"));

				bean.setMessage(rs.getString("message"));
				bean.setDate(rs.getString("datetime"));
				bean.setUserName(rs.getString("userName"));
				bean.setTag(rs.getString("tag"));
				messages.add(bean);
				

			}
			conn.endRequest();
			conn.close();
			rs=null;
			return messages;
			

		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());

		}
		return null;

	}

	public static void addMsg(MessageBean bean) {

			// test a query
			try {
				String requestQuery = "INSERT INTO `message`(`userName`, `message`,`tag`) VALUES (?,?,?)";

				stmt = conn.prepareStatement(requestQuery);
				
				stmt.setString(1, bean.getUserName());
				stmt.setString(2, bean.getMessage());
				stmt.setString(3, bean.getTag());

				/*
				 * stmt.setString(1, bean.getEmail()); stmt.setString(2, bean.getPassword());
				 */

				stmt.executeUpdate();
				// ResultSet return

				conn.endRequest();
				
	
				

			} catch (SQLException ex) {
				// TODO Auto-generated catch block
				System.out.println("SQLException: " + ex.getMessage());
				System.out.println("SQLState: " + ex.getSQLState());
				System.out.println("VendorError: " + ex.getErrorCode());

			}


		}
		
	}



