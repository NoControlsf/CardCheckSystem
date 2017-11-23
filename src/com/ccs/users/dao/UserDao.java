package com.ccs.users.dao;

import com.ccs.users.bean.CCSUser;

/**
 * Created by Administrator on 2017/6/28.
 */
public interface UserDao {
    /**
     * 判断昵称是否已经被注册
     * @param sname
     * @return
     */
    public boolean selectSname(String sname);
    /**
     * 用户注册
     * @param user
     */
    public void insertCCSUser(CCSUser user);

    public CCSUser selectCCSUser(String sname,String password);
}
