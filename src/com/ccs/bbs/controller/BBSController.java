package com.ccs.bbs.controller;

import com.ccs.bbs.dao.BBSDao;
import com.ccs.util.SysResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/6/30.
 */
@Controller
@RequestMapping(value = "/bbs")
public class BBSController {

    @Resource
    BBSDao bbsDao;

    @RequestMapping(value = "/getMainArticle")
    @ResponseBody
    public SysResult getArticle(HttpServletRequest request){
        int pageNumber=Integer.parseInt(request.getParameter("pNumber"));
        int pageSize=Integer.parseInt(request.getParameter("pSize"));
        //System.out.println("pageNumber="+pageNumber);
        //System.out.println("pageSize="+pageSize);
        SysResult sysResult=bbsDao.selectMainArticle(pageNumber,pageSize);
        //System.out.println(sysResult.getRows().toString());
        return sysResult;
    }


}
