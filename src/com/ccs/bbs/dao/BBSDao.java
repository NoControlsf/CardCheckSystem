package com.ccs.bbs.dao;

import com.ccs.util.SysResult;

/**
 * Created by Administrator on 2017/7/4.
 */
public interface BBSDao {
    /**
     * 查询所有主贴
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public SysResult selectMainArticle(int pageNumber,int pageSize);

}
