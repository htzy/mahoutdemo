package com.huangshihe.mahoutdemo.controller;

import com.huangshihe.mahoutdemo.interceptor.UserLoginInterceptor;
import com.huangshihe.mahoutdemo.mahout.MahoutManage;
import com.huangshihe.mahoutdemo.mahout.MahoutRecommender;
import com.huangshihe.mahoutdemo.model.User;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import java.io.IOException;
import java.util.List;

/**
 * Created by huang.shihe on 9/27/16.
 */
@Before(UserLoginInterceptor.class)
public class MahoutController extends Controller {

    MahoutManage mahoutManage = new MahoutManage();

    public void index() {
        // TODO which way is better?
        User user = getSessionAttr("userInfo");
        setAttr("items", mahoutManage.getMovieItems(user.getId()));
        render("index.jsp");
    }

    public void nextPage() {
        User user = getSessionAttr("userInfo");
        renderJson("items", mahoutManage.getMovieItems(user.getId()));
    }
}
