package com.blogsystem.service.impl;

import com.blogsystem.entity.Movie;
import com.blogsystem.mapper.MovieMapper;
import com.blogsystem.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Yuyunkuo
 * @Description:
 * @date 2019/11/30 23:16
 */
@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieMapper movieMapper;

    @Override
    public List<Movie> queryMovies() {
        return movieMapper.queryMovies();
    }

    @Override
    public List<Movie> queryMoviesByCategoryId(Integer categoryId) {
        return movieMapper.queryMoviesByCategoryId(categoryId);
    }

    @Override
    public Movie getMovieById(Integer id) {
        return movieMapper.getMovieById(id);
    }

    @Override
    public int insertMovie(Movie movie) {
        return movieMapper.insertMovie(movie);
    }

    @Override
    public int updateByPrimaryKeySelective(Movie movie) {
        return movieMapper.updateByPrimaryKeySelective(movie);
    }

    @Override
    public int delMovie(Integer id) {
        return movieMapper.delMovie(id);
    }
}
