package com.ccs.users.daoimpl;

import com.ccs.users.bean.CCSUser;
import com.ccs.users.dao.UserDao;
import com.ccs.util.JdbcUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Administrator on 2017/6/28.
 */
public class UserDaoImpl implements UserDao {
    //是否被注册过
    @Override
    public boolean selectSname(String sname) {
        boolean flag=true;
        JdbcUtil jdbcUtil=new JdbcUtil();
        Connection conn=jdbcUtil.getConnection();
        String sql="SELECT * FROM CCSUSER WHERE SNAME = '"+sname+"'";
        try {
            Statement st = conn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            if(rs.next()){
                flag=false;
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    //用户注册
    @Override
    public void insertCCSUser(CCSUser user) {
        JdbcUtil jdbcUtil=new JdbcUtil();
        Connection conn=jdbcUtil.getConnection();
        String sql= " SELECT MAX(FID) FROM CCSUSER ";
        int fid=0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            while(rs.next()) {
                fid = rs.getInt("MAX(FID)")+1;
            }
            StringBuffer sb=new StringBuffer();
            sb.append("INSERT INTO CCSUSER(FID,SNAME,BIRTHDAY,PASSWORD,QNAME,SEX,TELEPHONE,EMAIL) VALUES(");
            sb.append(String.valueOf(fid));
            sb.append(",'");sb.append(user.getSname());
            sb.append("','");sb.append(user.getBirthday());
            sb.append("','");sb.append(user.getPassword());
            sb.append("','");sb.append(user.getQname());
            sb.append("','");sb.append(user.getSex());
            sb.append("','");sb.append(user.getTelephone());
            sb.append("','");sb.append(user.getEmail());
            sb.append("')");
            st.executeUpdate(sb.toString());
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //用户登录
    @Override
    public CCSUser selectCCSUser(String sname, String password) {
        JdbcUtil jdbcUtil=new JdbcUtil();
        Connection conn=jdbcUtil.getConnection();
        String sql="SELECT * FROM CCSUSER WHERE SNAME='"+sname+"' AND PASSWORD='"+password+"' ";
        CCSUser user=null;
        try {
            Statement st = conn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            if(rs.next()){
                String birthday=rs.getString("birthday");
                String qname=rs.getString("qname");
                String sex=rs.getString("sex");
                String telephone=rs.getString("telephone");
                String email=rs.getString("email");
                user=new CCSUser(sname,birthday,password,qname,sex,telephone,email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
