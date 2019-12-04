package com.blogsystem.service;

import com.blogsystem.entity.AdminLoginLog;

import java.util.List;

public interface AdminLoginLogService {

    List<AdminLoginLog> selectRencent(Integer adminId);

    int insert(AdminLoginLog adminLoginLog);

    int selectCountByAdminId(int adminId);
}
