package com.huangshihe.mahoutdemo.config;

import com.huangshihe.mahoutdemo.controller.MahoutController;
import com.huangshihe.mahoutdemo.controller.MainController;
import com.huangshihe.mahoutdemo.interceptor.UserLoginInterceptor;
import com.huangshihe.mahoutdemo.model._MappingKit;
import com.jfinal.config.*;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;

/**
 * Created by huang.shihe on 9/26/16.
 */
public class BaseConfig extends JFinalConfig{
    @Override
    public void configConstant(Constants constants) {
        // 加载少量必要配置，随后可用PropKit.get(...)获取值
        PropKit.use("a_little_config.txt");
        constants.setDevMode(PropKit.getBoolean("devMode", false));
        constants.setViewType(ViewType.JSP);
        constants.setUrlParaSeparator("-");
        constants.setError401View("/WEB-INF/view/error.jsp");
        constants.setError404View("/WEB-INF/view/error.jsp");
    }

    @Override
    public void configRoute(Routes routes) {
        routes.add("/", MainController.class, "/WEB-INF/view/main/");
        routes.add("/mahout", MahoutController.class, "/WEB-INF/view/mahout/");
    }

    @Override
    public void configPlugin(Plugins plugins) {
        // 配置C3p0数据库连接池插件
        C3p0Plugin C3p0Plugin = createC3p0Plugin();
        plugins.add(C3p0Plugin);

        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(C3p0Plugin);
        plugins.add(arp);

        // 所有配置在 MappingKit 中搞定
        _MappingKit.mapping(arp);

        plugins.add(new EhCachePlugin());
    }

    @Override
    public void configInterceptor(Interceptors interceptors) {
    }

    @Override
    public void configHandler(Handlers handlers) {
        //加入路径，在页面中可以使用basePath，其值为/
        handlers.add(new ContextPathHandler("basePath"));
    }

    public static C3p0Plugin createC3p0Plugin() {
        return new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
    }
}
