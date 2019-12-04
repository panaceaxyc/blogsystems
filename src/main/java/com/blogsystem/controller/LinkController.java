package com.blogsystem.controller;

import com.blogsystem.entity.Board;
import com.blogsystem.entity.Link;
import com.blogsystem.entity.Msg;
import com.blogsystem.service.BoardService;
import com.blogsystem.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/2 21:33
 */
@Controller
public class LinkController {

    @Autowired
    private LinkService linkService;

    @Autowired
    private BoardService boardService;

    /**
     * 友情链接管理
     * @param model
     * @return
     */
    @RequestMapping("/link_manager")
    public String link_manager(Model model) {
        List<Link> links = linkService.selectAllLinks();
        model.addAttribute("links",links);


        //查询未审核的 数量
        int boardCount = boardService.selectCountByStatus();
        model.addAttribute("boardCount",boardCount);


        List<Board> boardNotCheck = boardService.getBoardNotCheck();
        model.addAttribute("bock",boardNotCheck);

        return "admin/link_manager";
    }

    /**
     * 处理添加
     * @param link
     * @return
     */
    @RequestMapping("/doAddLink")
    public String doAddLink(Link link) {
        int i = linkService.insertLink(link);
        return "redirect:/link_manager";
    }


    /**
     * 来到 修改
     * @param id
     * @return
     */
    @RequestMapping("/editLinkPage")
    @ResponseBody
    public Msg editPage(@RequestParam("id") Integer id) {
        Link link = linkService.getLinkById(id);
        return Msg.success("成功").add("links",link);
    }

    /**
     * 处理 修改
     * @param link
     * @return
     */
    @RequestMapping("/doEditLink")
    public String doEditLink(Link link) {
        int i = linkService.updateLink(link);
        if(i>0) {
            return "redirect:/link_manager";
        }else{
            return "redirect:/link_manager";
        }
    }


    /**
     * 处理 删除 JSON
     * @param id
     * @return
     */
    @RequestMapping("/delLink")
    @ResponseBody
    public Msg delLink(@RequestParam("id") Integer id ) {
        int i = linkService.delete(id);
        if(i>0) {
            return Msg.success("成功");
        }else{
            return Msg.fail("失败");
        }
    }
}
