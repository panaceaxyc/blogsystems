package com.blogsystem.utils;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/8/29 9:55
 */
public class ResultUtil {
    public static Result success(String[] object) {
        Result result = new Result();
        result.setErrno(0);
        result.setData(object);
        return result;
    }

    public static Result success() {
        return success(null);
    }
}
