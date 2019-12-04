package com.blogsystem.utils;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/8/29 9:54
 */
@Data
public class Result implements Serializable {
    /** 错误码. */
    private Integer errno;
    /** 具体的内容. */
    private String [] data;
}
