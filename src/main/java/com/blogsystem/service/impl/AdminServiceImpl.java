package com.blogsystem.service.impl;

import com.blogsystem.entity.Admin;
import com.blogsystem.mapper.AdminMapper;
import com.blogsystem.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    public AdminMapper adminMapper;
    public Admin getById(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public int getAdminCount() {
        return adminMapper.getAdminCount();
    }

    @Override
    public Admin selectAllAdmin(Integer id) {
        return adminMapper.selectAllAdmin(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Admin record) {
        return adminMapper.updateByPrimaryKeySelective(record);
    }
}
