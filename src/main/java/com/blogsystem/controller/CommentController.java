package com.blogsystem.controller;

import com.blogsystem.entity.Admin;
import com.blogsystem.entity.Comment;
import com.blogsystem.service.impl.CommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/8/28 21:38
 */
@Controller
public class CommentController {
    @Autowired
    public CommentServiceImpl commentService;


    /**
     * 评论博客
     * @param request
     * @return
     */
    @RequestMapping(value = "/api/comment/add", method = RequestMethod.POST)
    public @ResponseBody Object commentAdd(HttpServletRequest request) {
        HashMap<String, String> res = new HashMap<>();
        Comment comment=new Comment();
        comment.setArticleId(Long.parseLong(request.getParameter("articleId")));//评论博客ID
        comment.setContent(request.getParameter("content"));    //评论内容
        comment.setDate(new Date());                                //评论日期 （也就是当前日期）
        Admin admin = (Admin) request.getSession().getAttribute("admin");//获取用户信息
        if(admin ==null) {  //未登录
            res.put("stateCode","2");
            return res;
        }
        comment.setName(admin.getUsername());   //设置用户昵称为 当前评论者昵称
        comment.setUserid(admin.getId());       //设置用户ID为 当前评论者用户ID
        if(commentService.insertComment(comment)>0){
            res.put("stateCode", "1");
        }else {
            res.put("stateCode", "0");
        }
        return res;
    }


    @RequestMapping(value = "/api/comment/del", method = RequestMethod.POST)
    public @ResponseBody Object commentDel(HttpServletRequest request) {
        long id=Long.parseLong(request.getParameter("id"));
        HashMap<String, String> res = new HashMap<>();
        if (commentService.delById(id)){
            res.put("stateCode", "1");
        }else {
            res.put("stateCode", "0");
        }
        return res;
    }
}
