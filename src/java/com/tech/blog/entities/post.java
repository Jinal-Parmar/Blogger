
package com.tech.blog.entities;

import java.sql.Timestamp;


public class post {
    private int id;
    private String ptitle,pcontent,pcode,ppic;
    private Timestamp pdate;
    private int catid,userid;

    public post(int id, String ptitle, String pcontent, String pcode,  String ppic,Timestamp pdate, int catid,int userid) {
        this.id = id;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic=ppic;
        this.pdate = pdate;
        this.catid = catid;
        this.userid=userid;
    }

    public post() {
    }

    public post(String ptitle, String pcontent, String pcode,String ppic, Timestamp pdate, int catid,int userid) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
         this.ppic=ppic;
        this.pdate = pdate;
        this.catid = catid;
        this.userid=userid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
    
    
}
