package com.blogsystem.mapper;

import com.blogsystem.entity.Board;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/1 13:12
 */
public interface BoardMapper {



    List<Board> queryAll();

    int insertBoard(Board board);

    //查询最大的浏览楼层
    int selMaxLc();

    //查询未审核的留言
    List<Board> getBoardNotCheck();

    //根据ID来查询
    Board getBoardById(Integer id );

    //审核留言
    int updateBoard(@Param("id") Integer id, @Param("status") Integer status);

    //删除
    int deleteBoard(Integer id);

    //未审核的数量
    int selectCountByStatus();
}
