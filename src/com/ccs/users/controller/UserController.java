package com.ccs.users.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccs.users.bean.CCSUser;
import com.ccs.users.dao.UserDao;
import com.ccs.users.daoimpl.UserDaoImpl;
import com.ccs.util.ImageCode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;


/**
 * Created by Administrator on 2017/6/28.
 */
@Controller
public class UserController {
    /*@Resource默认按 byName 自动注入,是J2EE提供的， 需导入Package:
            javax.annotation.Resource;
            @Resource有两个中重要的属性：name和type ，而Spring将@Resource注解的name属性解析为bean的
            名字，而type属性则解析为bean的类型。所以如果使用name属性，则使用byName的自动注入策略，而使用
            type属性时则使用 byType自动注入策略。如果既不指定name也不指定type属性，这时将通过反射机制使用by
            Name自动注入策略。*/
    @Resource
    ImageCode imageCode;
    //校验验证码是否正确
    @RequestMapping(value = "/checkCode", produces = "application/json;charset=UTF-8")
    public @ResponseBody
    String checkNameValidMethod1(HttpServletRequest request,@RequestParam String input_checkCode) {
        String code=(String)request.getSession().getAttribute(imageCode.getSessionKey());
        boolean result = false;
        if(code.equals(input_checkCode)){
            result=true;
        }
            Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        ObjectMapper mapper = new ObjectMapper();
        String resultString = "";
        try {
            resultString = mapper.writeValueAsString(map);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return resultString;
    }
    //校验昵称是否被用过
    @RequestMapping(value="checkSname")
    public @ResponseBody
    String checkNameValidMethod2(HttpServletRequest request,@RequestParam String input_sname) {
        boolean result = false;
        UserDao userDao=new UserDaoImpl();
        if(userDao.selectSname(input_sname)){
            result=true;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        ObjectMapper mapper = new ObjectMapper();
        String resultString = "";
        try {
            resultString = mapper.writeValueAsString(map);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return resultString;
    }


    //获取验证码图片
    @RequestMapping(value = "/getImage")
    public void getImage(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        response.setContentType("image/jpeg");
        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(imageCode.getImage(request), "jpeg", sos);
        sos.close();
    }

    //用户注册
    @RequestMapping(value="/register",method = RequestMethod.POST)
    public ModelAndView register(HttpServletRequest request){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String sname=request.getParameter("input_sname");
        String birthday=request.getParameter("input_birthday");
        String password=request.getParameter("input_pass");
        String qname=request.getParameter("input_qname");
        String sex=request.getParameter("sex");
        String telephone=request.getParameter("input_telephone");
        String email=request.getParameter("input_email");
        CCSUser user=new CCSUser(sname,birthday,password,qname,sex,telephone,email);
        UserDao userDao=new UserDaoImpl();
        userDao.insertCCSUser(user);
        ModelAndView mav=new ModelAndView("login");
        mav.addObject("msg","success");
        return mav;
    }



    //用户登录
    @RequestMapping(value="/login")
    public ModelAndView login(HttpServletRequest request){
        String sname=request.getParameter("usercode");
        String password=request.getParameter("userpwd");
        UserDao userDao=new UserDaoImpl();
        CCSUser user=userDao.selectCCSUser(sname,password);
        if(user!=null){
            //用户信息存储在session中
            WebUtils.setSessionAttribute(request,"user",user);
            ModelAndView mav=new ModelAndView("views/index");
            mav.addObject("msg","loginsuccess");
            return mav;
        }else {
            ModelAndView mav=new ModelAndView("login");
            mav.addObject("msg","loginfail");
            return mav;
        }
    }

}
