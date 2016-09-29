package com.huangshihe.mahoutdemo.controller;

import com.huangshihe.mahoutdemo.interceptor.ManagerInterceptor;
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
}
