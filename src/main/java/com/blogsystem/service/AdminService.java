package com.blogsystem.service;

import com.blogsystem.entity.Admin;


public interface AdminService {
    Admin getById(Integer id);

    int getAdminCount();

    Admin selectAllAdmin(Integer id);

    int updateByPrimaryKeySelective(Admin record);
}
