package com.huangshihe.mahoutdemo.controller;

import com.huangshihe.mahoutdemo.interceptor.UserLoginInterceptor;
import com.huangshihe.mahoutdemo.interceptor.UserLogoutInterceptor;
import com.huangshihe.mahoutdemo.mahout.MahoutRecommender;
import com.huangshihe.mahoutdemo.model.User;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import org.apache.mahout.cf.taste.common.TasteException;

import java.io.IOException;

/**
 * Created by huang.shihe on 9/26/16.
 */
public class MainController extends Controller {

    // visitor can see the page, but visitor must login before operate
    public void index() {
        // TODO main page, show website info
        render("index.jsp");
    }

    @Before(UserLogoutInterceptor.class)
    public void login() {
        render("login.jsp");
    }

    public void checkLogin() {
        User loginUser = User.verify(getModel(User.class));
        if (loginUser == null) {
            setSessionAttr("info", "yonghubucunzaihuomimacuowu!");
            redirect("/login");
        } else {
            removeSessionAttr("info");
            setSessionAttr("userInfo", loginUser);
            redirect("/");
        }
    }

    @Before(UserLoginInterceptor.class)
    public void logout() {
        removeSessionAttr("userInfo");
        redirect("/login");
    }
}
