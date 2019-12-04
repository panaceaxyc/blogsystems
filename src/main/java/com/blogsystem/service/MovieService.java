package com.blogsystem.service;

import com.blogsystem.entity.Movie;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:16
 */
public interface MovieService {

    List<Movie> queryMovies();

    List<Movie> queryMoviesByCategoryId(Integer categoryId);

    Movie getMovieById(Integer id);

    int insertMovie(Movie movie);

    int updateByPrimaryKeySelective(Movie movie);

    int delMovie(Integer id);
}
