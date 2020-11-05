/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.category;
import com.tech.blog.entities.post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class postdao {

    Connection con;

    public postdao(Connection con) {
        this.con = con;
    }

    public ArrayList<category> getallcat() {
        ArrayList<category> a = new ArrayList<category>();
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                category c = new category(cid, name, description);
                a.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return a;
    }

    public boolean savpost(post p) {
        boolean f = false;
        try {
            String q = "insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, p.getPtitle());
            pst.setString(2, p.getPcontent());
            pst.setString(3, p.getPcode());
            pst.setString(4, p.getPpic());
            pst.setInt(5, p.getCatid());
            pst.setInt(6, p.getUserid());
            pst.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<post> getallposts() {
        List<post> l = new ArrayList();
        //fetch all posts

        try {
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcode = set.getString("pcode");
                String pcontent = set.getString("pcontent");
                String ppic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate");
                int catid = set.getInt("catid");
                int userid = set.getInt("userid");
                post pt = new post(pid, ptitle, pcontent, pcode, ppic, pdate, catid, userid);
                l.add(pt);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return l;
    }

    // get posts by category wli  id
    public List<post> getpostsbyid(int catid) {
        List<post> l = new ArrayList();
        //fetch all posts by  id

        try {
            PreparedStatement p = con.prepareStatement("select * from posts where catid=?");
            p.setInt(1, catid);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcode = set.getString("pcode");
                String pcontent = set.getString("pcontent");
                String ppic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate");
                //  int catid=set.getInt("catid");
                int userid = set.getInt("userid");
                post pt = new post(pid, ptitle, pcontent, pcode, ppic, pdate, catid, userid);
                l.add(pt);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return l;
    }

// get post by post wli  id
    public post getpostbyid(int id) {
        post p = null;
        try {
            String q = "select * from posts where pid=?";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setInt(1, id);
            ResultSet set = pst.executeQuery();

            if (set.next()) {
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcode = set.getString("pcode");
                String pcontent = set.getString("pcontent");
                String ppic = set.getString("ppic");
                Timestamp pdate = set.getTimestamp("pdate");
                int catid = set.getInt("catid");
                int userid = set.getInt("userid");
                p = new post(pid, ptitle, pcontent, pcode, ppic, pdate, catid, userid);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

}
