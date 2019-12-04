package com.blogsystem.controller;

import com.blogsystem.entity.AdminLoginLog;
import com.blogsystem.service.AdminLoginLogService;
import com.blogsystem.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/8/28 22:00
 */
@Controller
public class LoginController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminLoginLogService adminLoginLogService;

    // 0:用户不存在  1:密码错误 2:验证码错误 3：登陆成功
    @RequestMapping(value = "/api/loginCheck", method = RequestMethod.POST)
    public @ResponseBody
    Object loginCheck(HttpServletRequest request, HttpServletResponse httpServletResponse) {
        int id=Integer.parseInt(request.getParameter("id"));
        String passwd = request.getParameter("password");

        String confirmlogo = request.getParameter("confirmlogo");

        String code = (String) request.getSession().getAttribute("certCode");

        HashMap<String, String> res = new HashMap<>();
        if(adminService.getById(id)==null){
            res.put("stateCode", "0");
        }
        else if(!adminService.getById(id).getPassword().equals(passwd)){
            res.put("stateCode", "1");
        }else if(!code.equals(confirmlogo)){
            res.put("stateCode", "2");
        }else {
            String ip=request.getRemoteAddr();
            AdminLoginLog adminLoginLog=new AdminLoginLog();
            adminLoginLog.setAdminId(id);
            adminLoginLog.setDate(new Date());
            adminLoginLog.setIp(ip);
            int log=adminLoginLogService.insert(adminLoginLog);
            Cookie cookie = new Cookie("userId",""+id);
            cookie.setMaxAge(3600*24);
            httpServletResponse.addCookie(cookie);
            request.getSession().setAttribute("admin",adminService.getById(id));
            res.put("stateCode", "3");
        }
        return res;
    }

    @RequestMapping(value = {"/admin/logout"})
    public String logout(HttpServletRequest request,HttpServletResponse response) {
        request.getSession().removeAttribute("admin");
        return "redirect:/index";

    }
}
