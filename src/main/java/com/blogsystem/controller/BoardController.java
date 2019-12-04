package com.blogsystem.controller;
import com.blogsystem.entity.Board;
import com.blogsystem.entity.Msg;
import com.blogsystem.service.BoardService;
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
 * @date 2019/12/1 13:03
 */
@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    /**
     * 点击留言板 来到留言板页面 (携带数据)
     *
     * @param model
     * @return
     */
    @RequestMapping("/board")
    public String toBoardPage(Model model) {
        List<Board> boards = boardService.queryAll();
        System.out.println(boards);
        model.addAttribute("boards", boards);
        return "board";
    }

    /**
     * 给我留言
     *
     * @param board
     * @return
     */
    @RequestMapping("/insertBoard")
    @ResponseBody
    public Msg insertBoard(Board board) {
        int i = boardService.insertBoard(board);
        if (i > 0) {
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

    /**
     * 返回最大的楼层
     *
     * @return
     */
    @RequestMapping("/selectMaxLc")
    @ResponseBody
    public Msg selectMaxLc() {
        int i = boardService.selMaxLc();
        return Msg.success("成功").add("lc", i);
    }

    /**
     * 点击查看  来到这!
     *
     * @param id
     * @return
     */
    @RequestMapping("/getBoardById")
    @ResponseBody
    public Msg getBoardById(Integer id) {
        Board board = boardService.getBoardById(id);
        return Msg.success("成功").add("board", board);
    }



    /**
     * 查询留言 进行增删改查操作 (分页)
     *
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/boardCheck")
    public String boardCheck(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                             Model model) {
        PageHelper.startPage(pn, 5);
        List<Board> list = boardService.getBoardNotCheck();
        PageInfo page = new PageInfo(list, 5);


        //查询未审核的 数量
        int boardCount = boardService.selectCountByStatus();
        model.addAttribute("boardCount",boardCount);


        List<Board> boardNotCheck = boardService.getBoardNotCheck();
        model.addAttribute("bock",boardNotCheck);



        model.addAttribute("pageInfo", page);
        return "/admin/board_manager";
    }

    /**
     * 审核
     *
     * @param id
     * @param status
     * @return
     */
    @RequestMapping("/checkBoard")
    @ResponseBody
    public Msg checkBoard(@RequestParam("id") Integer id,
                          @RequestParam("status") Integer status) {
        int i = boardService.updateBoard(id, status);
        if (i > 0) {
            return Msg.success("成功");
        } else {
            return Msg.fail("失败");
        }
    }


    /**
     * 删除留言
     * @param id
     * @return
     */
    @RequestMapping("/deleteBoard")
    @ResponseBody
    public Msg deleteBoard(@RequestParam("id") Integer id) {
        int i = boardService.deleteBoard(id);
        if (i > 0) {
            return Msg.success("成功");
        } else {
            return Msg.fail("失败");
        }
    }

}
