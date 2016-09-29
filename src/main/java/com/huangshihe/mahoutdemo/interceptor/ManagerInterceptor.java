package com.huangshihe.mahoutdemo.interceptor;

/**
 * Created by 黄诗鹤 on 2016/9/27.
 */

import com.huangshihe.mahoutdemo.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * manage
 * @author Sherlock
 *
 */
public class ManagerInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        User user = inv.getController().getSessionAttr("userInfo");
        if (user == null || user.getId() != 1){
            inv.getController().redirect("/");
        }else {
            inv.invoke();
        }
    }
}