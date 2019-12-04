package com.blogsystem.service.impl;

import com.blogsystem.entity.Board;
import com.blogsystem.mapper.BoardMapper;
import com.blogsystem.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/12/1 13:17
 */
@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<Board> queryAll() {
        return boardMapper.queryAll();
    }

    @Override
    public int insertBoard(Board board) {
        return boardMapper.insertBoard(board);
    }

    @Override
    public int selMaxLc() {
        return boardMapper.selMaxLc();
    }

    @Override
    public List<Board> getBoardNotCheck() {
        return boardMapper.getBoardNotCheck();
    }

    @Override
    public Board getBoardById(Integer id) {
        return boardMapper.getBoardById(id);
    }

    @Override
    public int updateBoard(Integer id, Integer status) {
        return boardMapper.updateBoard(id,status);
    }

    @Override
    public int deleteBoard(Integer id) {
        return boardMapper.deleteBoard(id);
    }

    @Override
    public int selectCountByStatus() {
        return boardMapper.selectCountByStatus();
    }
}
