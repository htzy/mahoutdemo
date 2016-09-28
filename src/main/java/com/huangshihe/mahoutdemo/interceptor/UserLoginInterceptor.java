package com.huangshihe.mahoutdemo.interceptor;

/**
 * Created by 黄诗鹤 on 2016/9/27.
 */

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 如果用户没有登录，则访问登录界面
 * @author Sherlock
 *
 */
public class UserLoginInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        if (inv.getController().getSessionAttr("userInfo") == null){
            inv.getController().redirect("/login");
        }else {
            inv.invoke();
        }
    }
}