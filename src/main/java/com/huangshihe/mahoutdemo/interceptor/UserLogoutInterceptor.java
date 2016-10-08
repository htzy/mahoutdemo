package com.huangshihe.mahoutdemo.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 如果用户已经登录，则直接访问主页面
 * Created by 黄诗鹤 on 2016/9/27.
 */

public class UserLogoutInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        if (inv.getController().getSessionAttr("userInfo") == null) {
            inv.invoke();
        } else {
            inv.getController().redirect("/");
        }
    }
}

