package com.blogsystem.controller;

import com.blogsystem.entity.Admin;
import com.blogsystem.entity.AdminLoginLog;
import com.blogsystem.entity.Board;
import com.blogsystem.service.AdminService;
import com.blogsystem.service.BoardService;
import com.blogsystem.service.impl.AdminLoginLogServiceImpl;
import com.blogsystem.service.impl.ArticleServiceImpl;
import com.blogsystem.service.impl.CommentServiceImpl;
import com.blogsystem.utils.Result;
import com.blogsystem.utils.ResultUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/8/28 22:21
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    public AdminLoginLogServiceImpl adminLoginLogService;

    @Autowired
    public ArticleServiceImpl articleService;

    @Autowired
    public CommentServiceImpl commentService;

    @Autowired
    private BoardService boardService;

    /**
     * 后台首页 index
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/main")
    public String toMain(HttpServletRequest request, Model model) {
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

/*
            Admin adminId = (Admin) request.getSession().getAttribute("admin");
            Admin adminPhoto = adminService.getById(adminId.getId());
            request.setAttribute("adminPhoto",adminPhoto.getPhoto());*/


            //查询未审核的 数量
            int boardCount = boardService.selectCountByStatus();
            model.addAttribute("boardCount",boardCount);


            List<Board> boardNotCheck = boardService.getBoardNotCheck();
            model.addAttribute("bock",boardNotCheck);

            return "admin/index";
            //return "admin/main";
        }
    }

    /**
     * @deprecated 上传图片并返回图片路径(json格式)
     * 接收的图片名和wangEditor定义的图片名保持一致
     * @param myFileName
     * @param session
     * @param request
     * @return
     * @throws Exception
     */
    @PostMapping("/uploadImg")
    @ResponseBody
    public Result uploadImg(@RequestParam("myFileName") MultipartFile myFileName,
                            HttpSession session,
                            HttpServletRequest request) throws Exception {
        String realName = "";
        if (myFileName != null) {
            String fileName = myFileName.getOriginalFilename();
            String fileNameExtension = fileName.substring(fileName.indexOf("."), fileName.length() - 1);
            // 生成实际存储的真实文件名
            realName = UUID.randomUUID().toString().substring(0,8) + fileNameExtension;
            // "/upload"是你自己定义的上传目录
            String realPath = session.getServletContext().getRealPath("/upload");
            File uploadFile = new File(realPath, realName);
            myFileName.transferTo(uploadFile);
        }
        String [] str = {request.getContextPath() + "/upload/" + realName};
        return ResultUtil.success(str);
    }


    /**
     * 跳转到 用户页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/adminManager")
    public String toAdminManager(HttpServletRequest request,Model model){
        Admin user = (Admin) request.getSession().getAttribute("admin");
        Integer id = user.getId();
        Admin admin = adminService.selectAllAdmin(id);
        model.addAttribute("admins",admin);
        return "admin/admin_manager";
    }

    /**
     * 在线更新 我的资料
     * @param admin
     * @return
     */
    @RequestMapping("/updateAdmin")
    public String updateAdmin(Admin admin) {
        int i = adminService.updateByPrimaryKeySelective(admin);
        return "redirect:/admin/adminManager";
    }

    /**
     * 更新头像
     * @return
     */
    @RequestMapping("/updatePhoto")
    public String updatePhoto(Admin admin, HttpServletRequest request) {
        Admin adminId = (Admin) request.getSession().getAttribute("admin");
        String fileName = UUID.randomUUID().toString() + admin.getFile().getOriginalFilename()
                .substring(admin.getFile().getOriginalFilename().lastIndexOf("."));
        String returnUrl =request.getContextPath()+"upload/";
        System.out.println("--------------------"+returnUrl+"----------------------------");

        String path = request.getSession().getServletContext().getRealPath("upload") +"\\"+fileName;
        System.out.println("--------------------"+path+"----------------------------");
        try {
            FileUtils.copyInputStreamToFile(admin.getFile().getInputStream(), new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        admin.setPhoto(returnUrl+fileName);
        admin.setId(adminId.getId());
        int i = adminService.updateByPrimaryKeySelective(admin);
        return "redirect:/admin/adminManager";
    }
}
