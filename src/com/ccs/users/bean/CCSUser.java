package com.ccs.users.bean;

/**
 * Created by Administrator on 2017/6/28.
 */
public class CCSUser {
    private int FID;
    private String sname;
    private String birthday;
    private String password;
    private String qname;
    private String sex;
    private String telephone;
    private String email;
    public CCSUser(String sname, String birthday, String password, String qname, String sex, String telephone, String email) {
        this.sname = sname;
        this.birthday = birthday;
        this.password = password;
        this.qname = qname;
        this.sex = sex;
        this.telephone = telephone;
        this.email = email;
    }

    public CCSUser() {
    }

    public int getFID() {
        return FID;
    }

    public String getSname() {
        return sname;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getPassword() {
        return password;
    }

    public String getQname() {
        return qname;
    }

    public String getSex() {
        return sex;
    }

    public String getTelephone() {
        return telephone;
    }

    public String getEmail() {
        return email;
    }
    public void setFID(int FID) {
        this.FID = FID;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setQname(String qname) {
        this.qname = qname;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
