package com.blogsystem.service;

import com.blogsystem.entity.BoardHf;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/1 13:54
 */
public interface BoardHfService {

    List<BoardHf> getBoardById(Integer boardid);
}
