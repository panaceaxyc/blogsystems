package com.blogsystem.service.impl;

import com.blogsystem.entity.Lable;
import com.blogsystem.mapper.LableMapper;
import com.blogsystem.service.LableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 16:46
 */
@Service
public class LableServiceImpl implements LableService {

    @Autowired
    private LableMapper lableMapper;

    @Override
    public List<Lable> selectAllLable() {
        return lableMapper.selectAllLable();
    }

    @Override
    public Lable getLableById(Integer id) {
        return lableMapper.getLableById(id);
    }

    @Override
    public int updateLable(Lable lable) {
        return lableMapper.updateLable(lable);
    }

    @Override
    public int insertLable(Lable lable) {
        return lableMapper.insertLable(lable);
    }

    @Override
    public int delete(Integer id) {
        return lableMapper.delete(id);
    }
}
