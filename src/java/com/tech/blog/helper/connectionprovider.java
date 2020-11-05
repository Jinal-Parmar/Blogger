package com.tech.blog.helper;

import java.sql.*;

public class connectionprovider {

    private static Connection con;

    public static Connection getconn() {
        try {
            //driver load
            Class.forName("com.mysql.jdbc.Driver");

            if (con == null) { //create a connection
                con = DriverManager.
                          getConnection("jdbc:mysql://localhost:3306/techblog", "root", "");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

}
