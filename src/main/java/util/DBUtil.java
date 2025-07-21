package util;


import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/udayshopping";
    private static final String USER = "root";
    private static final String PASS = "Bighouse$770";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
