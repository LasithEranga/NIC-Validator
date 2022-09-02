package com.mobios.assestment.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_db";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException{
        
        Connection connection = null;
        connection = DriverManager.getConnection(DB_URL,USER_NAME,PASSWORD);
        return connection;
        
    }
}
