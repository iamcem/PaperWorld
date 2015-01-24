package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionAgent {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    
    // for smartnova
    
    /*private static final String URL = "jdbc:mysql://localhost:3306/cem";
    private static final String USERNAME = "cem";
    private static final String PASSWORD = "Nakin";*/
    
    
    // for in-house dev.
    private static final String URL = "jdbc:mysql://localhost:8889/paperworld";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    
    private static Connection instance = null;
    
    public static synchronized Connection getInstance() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        instance = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        return instance;
    }
}
