package com.blogsystem.controller;

import com.blogsystem.entity.Admin;
import com.blogsystem.entity.AdminLoginLog;
import com.blogsystem.service.AdminService;
import com.blogsystem.service.impl.AdminLoginLogServiceImpl;
import com.blogsystem.service.impl.ArticleServiceImpl;
import com.blogsystem.service.impl.CommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/29 16:02
 */
@Controller
public class SystemController {
    @Autowired
    private AdminService adminService;

    @Autowired
    public AdminLoginLogServiceImpl adminLoginLogService;
    @Autowired
    public ArticleServiceImpl articleService;
    @Autowired
    public CommentServiceImpl commentService;

    /**
     * 系统统计
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/systemCount")
    public String toSystemCountPage(HttpServletRequest request, Model model) {
        String clientIp=request.getRemoteAddr();    //获取客户端IP，如：127.0.0.1
        String hostIp=request.getLocalAddr();
        int hostPort=request.getLocalPort();
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");//设置日期格式
        String dates = df.format(date);
        Admin admin=(Admin) request.getSession().getAttribute("admin");
        AdminLoginLog lastLoginLog=null;
        try {
            if (adminLoginLogService.selectRencent(admin.getId())!=null && adminLoginLogService.selectRencent(admin.getId()).size()==2){
                List<AdminLoginLog> adminLoginLogs=adminLoginLogService.selectRencent(admin.getId());
                lastLoginLog=adminLoginLogs.get(1);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            int articleCount=articleService.selectCount();
            int commentCount=commentService.countAllNum();
            int loginNum=adminLoginLogService.selectCountByAdminId(admin.getId());
            //统计用户数量
            int adminCount = adminService.getAdminCount();
            model.addAttribute("adminCount",adminCount);
            model.addAttribute("clientIp",clientIp);
            model.addAttribute("hostIp",hostIp);
            model.addAttribute("hostPort",hostPort);
            model.addAttribute("date",dates);
            if (lastLoginLog!=null){
                model.addAttribute("loginLog",lastLoginLog);
            }
            model.addAttribute("articleCount",articleCount);
            model.addAttribute("commentCount",commentCount);
            model.addAttribute("loginNum",loginNum);


                return "admin/comment/systemCount";

        }
    }

    /**
     * 系统信息
     * @param tip
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/systemInfo")
    public String toSystemInfoPage( HttpServletRequest request, Model model) {
        String clientIp=request.getRemoteAddr();    //获取客户端IP，如：127.0.0.1
        String hostIp=request.getLocalAddr();
        int hostPort=request.getLocalPort();
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");//设置日期格式
        String dates = df.format(date);
        Admin admin=(Admin) request.getSession().getAttribute("admin");
        AdminLoginLog lastLoginLog=null;
        try {
            if (adminLoginLogService.selectRencent(admin.getId())!=null && adminLoginLogService.selectRencent(admin.getId()).size()==2){
                List<AdminLoginLog> adminLoginLogs=adminLoginLogService.selectRencent(admin.getId());
                lastLoginLog=adminLoginLogs.get(1);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            int articleCount=articleService.selectCount();
            int commentCount=commentService.countAllNum();
            int loginNum=adminLoginLogService.selectCountByAdminId(admin.getId());
            //统计用户数量
            int adminCount = adminService.getAdminCount();
            model.addAttribute("adminCount",adminCount);
            model.addAttribute("clientIp",clientIp);
            model.addAttribute("hostIp",hostIp);
            model.addAttribute("hostPort",hostPort);
            model.addAttribute("date",dates);
            if (lastLoginLog!=null){
                model.addAttribute("loginLog",lastLoginLog);
            }
            model.addAttribute("articleCount",articleCount);
            model.addAttribute("commentCount",commentCount);
            model.addAttribute("loginNum",loginNum);

            return "admin/comment/systemInfo";

        }
    }


}
