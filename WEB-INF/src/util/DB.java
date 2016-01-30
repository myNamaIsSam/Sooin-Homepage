package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
	private static final String JDBC_DRIVER_NAME = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/suin";
	private static final String USER_ID="root";
	private static final String USER_PASSWORD="test123";
    
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_DRIVER_NAME);
        Connection connection = DriverManager.getConnection(DB_URL, USER_ID, USER_PASSWORD);
        return connection;
    }
}