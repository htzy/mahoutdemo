package com.huangshihe.mahoutdemo.controller;

import com.huangshihe.mahoutdemo.interceptor.ManagerInterceptor;
import com.huangshihe.mahoutdemo.model.Movie;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * Created by huang.shihe on 9/28/16.
 */
@Before(ManagerInterceptor.class)
public class ManageController extends Controller {
    public void index() {
        render("index.jsp");
    }

    public void evaluate() {
        render("evaluate.jsp");
    }

    public void movie() {
        int pageNum = getParaToInt("pageNum", 1);
        setAttr("moviePage", Movie.getMovies(pageNum));
        render("movie.jsp");
    }

    public void updateBackground() {
        Movie movie = getModel(Movie.class);
        renderJson("result", movie.update());
    }
}
