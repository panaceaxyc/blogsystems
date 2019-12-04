package com.blogsystem.controller;

import com.blogsystem.entity.*;
import com.blogsystem.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private LableService lableService;

    @Autowired
    private LinkService linkService;

    @Autowired
    private BlogerService blogerService;

    /**
     * 访问首页跳转 默认访问前6条博客 (携带数据)
     * lable标签展示，博客展示，Link地址展示
     *
     * @return
     */
    @RequestMapping(value = {"/","/index"})
    public String index(@RequestParam(value = "pn",defaultValue = "1") Integer pn,  Model model) {
        //这俩参数 第一个代表页码. 第二个代表大小
        PageHelper.startPage(pn, 5);
        List<Article> articles=articleService.queryAll();
        PageInfo page = new PageInfo(articles,6);
        //查询所有的lable
        List<Lable> lables = lableService.selectAllLable();
        //查询友情链接
        List<Link> links = linkService.selectAllLinks();

        //查询热门推荐 前7条博客
        List<Article> hotArticle = articleService.queryHotArticle(7);
        model.addAttribute("hotArticle",hotArticle);

        model.addAttribute("articles",articles);
        model.addAttribute("pageInfo",page);

        model.addAttribute("lables",lables);//添加lable
        model.addAttribute("links",links);//添加links

        //博主信息

        Bloger bloger = blogerService.getBlogerById();
        model.addAttribute("bloger",bloger);
        return "index";
    }

    /**
     * 关于我   跳转页面 (不携带数据)
     * @return
     */
    @RequestMapping("/about")
    public String about(){
        return "about";
    }



    /**
     * 登录
     * @return
     */
    @RequestMapping("/login")
    public String loing() {
        return "admin/login";
    }

    @RequestMapping("/e")
    public String toEdit() {
        return "edit";
    }

    /**
     * 验证码
     * @return
     */
    @RequestMapping("/verificationcodeimg")
    public ModelAndView verificationcodeimg(){
        ModelAndView verificationcodeimg=new ModelAndView();
        verificationcodeimg.setViewName("verificationcodeimg");
        return verificationcodeimg;
    }
}
