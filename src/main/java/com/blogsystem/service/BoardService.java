package com.blogsystem.service;

import com.blogsystem.entity.Board;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/1 13:14
 */
public interface BoardService {


    List<Board> queryAll();

    int insertBoard(Board board);
    //查询最大的浏览楼层
    int selMaxLc();

    //查询未审核的留言
    List<Board> getBoardNotCheck();

    //根据ID来查询
    Board getBoardById(Integer id );

    //审核留言
    int updateBoard(Integer id,Integer status);

    //删除留言
    int deleteBoard(Integer id);

    //统计 未审核的留言数量
    int selectCountByStatus();
}
