package com.xyz.xyzhotel;

import java.sql.*;


public class DBcon {

    public Connection getConnectionDB() {

        Connection conn = null;

        try {


            Driver d=new com.mysql.cj.jdbc.Driver();
            conn = DriverManager.getConnection("jdbc:mysql://localhost/xyz","root", "");
            System.out.println("DB connected");


        }
        catch (SQLException ex) {
            System.out.println("Connection failed!");
            ex.printStackTrace();
        }
        finally {
            if(conn != null)
                System.out.println("DB connected");
            return conn;

        }

    }

}