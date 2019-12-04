package com.blogsystem.service.impl;

import com.blogsystem.entity.BoardHf;
import com.blogsystem.mapper.BoardHfMapper;
import com.blogsystem.service.BoardHfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/1 13:55
 */
@Service
public class BoardHfServiceImpl implements BoardHfService {
    @Autowired
    private BoardHfMapper boardHfMapper;

    @Override
    public List<BoardHf> getBoardById(Integer boardid) {
        return boardHfMapper.getBoardById(boardid);
    }
}
