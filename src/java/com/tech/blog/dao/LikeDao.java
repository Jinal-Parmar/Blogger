package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertlike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into liked(pid,uid) values(?,?)";
            PreparedStatement pst = this.con.prepareStatement(q);
            //values set

            pst.setInt(1, pid);
            pst.setInt(2, uid);

            pst.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int countlikeonpost(int pid) {
        int n = 0;
        try {
            // no. of rows of pid 
            String q = "select count(*) from liked where pid=? ";
            PreparedStatement pst = this.con.prepareStatement(q);// iske vaje se exception aata h
            pst.setInt(1, pid);
            ResultSet set = pst.executeQuery();
            if (set.next()) {
                n = set.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return n;
    }

    public boolean islikedbyuser(int pid, int uid) {
        boolean f = false;
        try {

            PreparedStatement p = this.con.prepareStatement("select * from liked where pid=? and uid=? ");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if (set.next()) {

                f = true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deletelike( int pid,int uid)
    { boolean f=false;
        try {
            PreparedStatement p=this.con.prepareStatement("delete from liked where pid=? and uid=?");
            p.setInt(1,pid);
            p.setInt(2, uid);
            p.executeUpdate();
            
            f=true;
            
        } catch (Exception e) {
        e.printStackTrace();}
    return f;
    }
}
