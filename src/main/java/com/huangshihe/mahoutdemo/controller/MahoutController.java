package com.huangshihe.mahoutdemo.controller;

import com.huangshihe.mahoutdemo.interceptor.UserLoginInterceptor;
import com.huangshihe.mahoutdemo.mahout.MahoutRecommender;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import org.apache.mahout.cf.taste.common.TasteException;

import java.io.IOException;

/**
 * Created by huang.shihe on 9/27/16.
 */
@Before(UserLoginInterceptor.class)
public class MahoutController extends Controller {
    // TODO user can choose search requirements

    public void index(){
        // TODO which way is better?

        MahoutRecommender mahoutRecommender = new MahoutRecommender();
        //TODO  user input neighborhoodCount and howMany

        // TODO huan yi pi
        try {
            setAttr("itemsByUser", mahoutRecommender.getItemsBasedUser(1));
            setAttr("itemsByItem", mahoutRecommender.getItemsBasedItem(1));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TasteException e) {
            e.printStackTrace();
        }
    }
}
