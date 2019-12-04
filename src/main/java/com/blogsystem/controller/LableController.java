package com.blogsystem.controller;

import com.blogsystem.entity.Board;
import com.blogsystem.entity.Lable;
import com.blogsystem.entity.Msg;
import com.blogsystem.service.BoardService;
import com.blogsystem.service.LableService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
public class LableController {

    @Autowired
    private LableService lableService;

    @Autowired
    private BoardService boardService;

    /**
     * 标签管理 分页
     * @param model
     * @return
     */
    @RequestMapping("/lable_manager")
    public String link_manager(
            @RequestParam(value = "pn",defaultValue = "1") Integer pn,
            Model model) {
        List<Lable> la = lableService.selectAllLable();
        PageHelper.startPage(pn, 5);
        PageInfo page = new PageInfo(la,5);
        model.addAttribute("pageInfo",page);
        /*
        model.addAttribute("lables",lable);*/

        //查询未审核的 数量
        int boardCount = boardService.selectCountByStatus();
        model.addAttribute("boardCount",boardCount);


        List<Board> boardNotCheck = boardService.getBoardNotCheck();
        model.addAttribute("bock",boardNotCheck);

        return "/admin/lable_manager";
    }

    /**
     * 处理添加
     * @param lable
     * @return
     */
    @RequestMapping("/doAddLable")
    public String doAddLink(Lable lable) {
        int i = lableService.insertLable(lable);
        return "redirect:/lable_manager";
    }


    /**
     * 来到 修改
     * @param id
     * @return
     */
    @RequestMapping("/editLablePage")
    @ResponseBody
    public Msg editPage(@RequestParam("id") Integer id) {
        Lable lable = lableService.getLableById(id);
        return Msg.success("成功").add("lables",lable);
    }

    /**
     * 处理 修改
     * @param lable
     * @return
     */
    @RequestMapping("/doEditLable")
    public String doEditLink(Lable lable) {
        int i = lableService.updateLable(lable);
        if(i>0) {
            return "redirect:/lable_manager";
        }else{
            return "redirect:/lable_manager";
        }
    }


    /**
     * 处理 删除 JSON
     * @param id
     * @return
     */
    @RequestMapping("/delLable")
    @ResponseBody
    public Msg delLable(@RequestParam("id") Integer id ) {
        int i = lableService.delete(id);
        if(i>0) {
            return Msg.success("成功");
        }else{
            return Msg.fail("失败");
        }
    }
}
