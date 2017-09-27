package com.databaseconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConn {
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/420market","root","alien@48");
            return con;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
