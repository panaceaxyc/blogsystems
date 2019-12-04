package com.blogsystem.service;

import com.blogsystem.entity.Lable;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 16:45
 */
public interface LableService {

    List<Lable> selectAllLable();


    Lable getLableById(Integer id);

    int updateLable(Lable lable);

    int insertLable(Lable lable);

    int delete(Integer id);
}
