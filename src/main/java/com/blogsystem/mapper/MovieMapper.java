package com.blogsystem.mapper;

import com.blogsystem.entity.Movie;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:13
 */
public interface MovieMapper {


    List<Movie> queryMovies();

    List<Movie> queryMoviesByCategoryId(Integer categoryId);

    Movie getMovieById(Integer id);

    int insertMovie(Movie movie);

    int updateByPrimaryKeySelective(Movie movie);

    int delMovie(Integer id);
}
