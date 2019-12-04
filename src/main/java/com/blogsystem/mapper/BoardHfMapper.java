package com.blogsystem.mapper;

import com.blogsystem.entity.BoardHf;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/1 13:51
 */
public interface BoardHfMapper {

    List<BoardHf> getBoardById(Integer boardid);
}
