package com.blogsystem.controller;
import com.blogsystem.entity.Admin;
import com.blogsystem.entity.Msg;
import com.blogsystem.entity.Reply;
import com.blogsystem.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/28 22:55
 */
@Controller
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    /**
     * 方法一
     * 用户回复评论
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/api/comment/addReply", method = RequestMethod.POST)
    public @ResponseBody
    Object addReply(HttpServletRequest request) {
        HashMap<String, String> res = new HashMap<>();

        Reply reply = new Reply();

        String commentid = request.getParameter("commentid");

        String replyid = request.getParameter("replyid");

        String content = request.getParameter("content");

        String articleid = request.getParameter("articleid");

        reply.setCommentid(Integer.parseInt(commentid));

        reply.setReplyid(Integer.parseInt(replyid));

        reply.setContent(content);

        reply.setArticleid(Integer.parseInt(articleid));

        reply.setDate(new Date());

        /*if(commentid==null || replyid==null){
            res.put("stateCode","2");//没有登录
            return res;
        }*/

        Admin admin = (Admin) request.getSession().getAttribute("admin");//获取用户信息
        if (admin == null) {  //未登录
            res.put("stateCode", "2");
            return res;
        }
        int i = replyService.insert(reply);

        if (i > 0) {
            res.put("stateCode", "0"); //成功!
        } else {
            res.put("stateCode", "1");
        }
        return res;
    }
    //方法二
    /*
        @RequestMapping(value = "/api/comment/addReply", method = RequestMethod.POST)
        public @ResponseBody Object addReply(Reply reply,HttpServletRequest request){
            HashMap<String, String> res = new HashMap<>();
            *//*if(commentid==null || replyid==null){
                res.put("stateCode","2");//没有登录
                return res;
            }*//*

            Admin admin = (Admin) request.getSession().getAttribute("admin");//获取用户信息
            if(admin ==null) {  //未登录
                res.put("stateCode","2");
                return res;
            }

            int i = replyService.insert(reply);
            if(i>0) {
                res.put("stateCode","0"); //成功!
            }else{
                res.put("stateCode","1");
            }
            return res;
        }
    */
    /**
     * 查询二级评论 并返回
     * @return
     */
    @RequestMapping(value = "/api/comment/getReplyById",method = RequestMethod.POST)
    @ResponseBody
    public Msg getReplyById(@RequestParam("replyid") Integer replyid){
        List<Reply> replies = replyService.selectReplyByReplyId(replyid);
        if(replies!=null) {
            return Msg.success("成功").add("replies",replies);
        }else{
            return Msg.fail("失败");
        }
    }
}
