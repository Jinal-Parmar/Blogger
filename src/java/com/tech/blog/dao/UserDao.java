package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {

            //user--> database
            String q = "insert into user(name,email,password,gender,about)  values(?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(q);

            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAbout());

            pst.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    public User getuseremailandpassword(String email, String password) {
        User user = null;
        try {
            String q = "select * from user where email=? and password=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setString(1, email);
            p.setString(2, password);

            ResultSet set = p.executeQuery();
            if (set.next()) {
                user = new User();
                //data from db
                String name = set.getString("name");
                // set to user object
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateuser(User user) {
        boolean f = false;
        try {
            String q = "update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=? ";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAbout());
            pst.setString(6, user.getProfile());
            pst.setInt(7, user.getId());

            pst.executeUpdate();
            f = true;
        } catch (Exception e) {

            e.printStackTrace();

        }
        return f;

    }

    public User getuserbyuserid(int userid) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, userid);
            ResultSet set = pst.executeQuery();
            if (set.next()) {
                user = new User();
                //data from db
                String name = set.getString("name");
                // set to user object
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
