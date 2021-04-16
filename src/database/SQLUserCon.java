package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UserBean;

public class SQLUserCon {

	static Connection conn = null;
	static PreparedStatement stmt = null; // skyddar b�ttre
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
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user?serverTimezone=UTC",
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

	public static boolean stateSQL(UserBean bean) {

		// test a query
		try {
			String requestQuery = "SELECT fullname FROM user WHERE email = ? and password = ?";

			stmt = conn.prepareStatement(requestQuery);

			stmt.setString(1, bean.getEmail());
			stmt.setString(2, bean.getPassword());

			rs = stmt.executeQuery();
			
			// ResultSet return
			while (rs.next()) {

				bean.setName(rs.getString("fullname"));
				return true;

			}
			conn.endRequest();
			conn.close();

		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());

		}
		return false;

	}
}
