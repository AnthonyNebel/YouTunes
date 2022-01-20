package youtunes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcManager {

	private String jdbcUrl;
	private String jdbcUserName;
	private String jdbcPassword;
	
	public JdbcManager() {
		
		jdbcUrl = "jdbc:mysql://localhost:3306/youtunes?useSSL=false";
		jdbcUserName = "root";
		jdbcPassword = "root";
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (ClassNotFoundException e) {
			
			System.out.println(e.toString());
		}
	}
	
	public Connection getConnection() {
		
		Connection connection = null;
		//System.out.println("jdbcUrl: " + jdbcUrl + "; jdbcUserName: " + jdbcUserName + "; jdbcPassword: " + jdbcPassword);
		try {
			
			connection = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
		}
		catch (SQLException e) {
			
			System.out.println("Could not connect to DB: " + e.getMessage());
		}
		return connection;
	}
	public void closeConnection(Connection connection) {
		
		if (connection != null) {
			
			try {
				
				connection.close();
			}
			catch (SQLException e) {
				
				System.out.println("Could not close connection: " + e.getMessage());
			}
		}
	}
}
