package com.blogsystem.mapper;

import com.blogsystem.entity.AdminLoginLog;

import java.util.List;

public interface AdminLoginLogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AdminLoginLog record);

    int insertSelective(AdminLoginLog record);

    AdminLoginLog selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AdminLoginLog record);

    int updateByPrimaryKey(AdminLoginLog record);

    List<AdminLoginLog> queryAll();

    List<AdminLoginLog> selectRencent(Integer adminId);

    int selectCountByAdminId(Integer adminId);
}