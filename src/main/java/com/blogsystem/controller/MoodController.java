package com.blogsystem.controller;

import com.blogsystem.entity.UpdateBlogInfo;
import com.blogsystem.service.UpdateBlogInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:49
 */
@Controller
public class MoodController {


    @Autowired
    private UpdateBlogInfoService updateBlogInfoService;

    /**
     * 碎言碎语 跳转页面 (携带数据)
     * @return
     */
    @RequestMapping("/mood")
    public String mood(Model model){

        List<UpdateBlogInfo> updateBlogInfos = updateBlogInfoService.queryAll();

        model.addAttribute("blogInfos",updateBlogInfos);

        return "mood";
    }
}
