package com.blogsystem.service.impl;

import com.blogsystem.entity.AdminLoginLog;
import com.blogsystem.mapper.AdminLoginLogMapper;
import com.blogsystem.service.AdminLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminLoginLogServiceImpl implements AdminLoginLogService {

    @Autowired
    public AdminLoginLogMapper adminLoginLogMapper;

    public List<AdminLoginLog> selectRencent(Integer adminId) {
        return adminLoginLogMapper.selectRencent(adminId);
    }

    public int insert(AdminLoginLog adminLoginLog) {
        return adminLoginLogMapper.insert(adminLoginLog);
    }

    public int selectCountByAdminId(int adminId) {
        return adminLoginLogMapper.selectCountByAdminId(adminId);
    }
}
