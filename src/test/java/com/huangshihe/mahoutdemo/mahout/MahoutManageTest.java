package com.huangshihe.mahoutdemo.mahout;

import junit.framework.TestCase;

/**
 * Created by huang.shihe on 9/29/16.
 */
public class MahoutManageTest extends TestCase {

    public void testTest1() throws Exception {
        MahoutManage manage = new MahoutManage();
        // 0.8839017169343092
        manage.averageAbsoluteDifferenceRecommenderEvaluator();
        // 1.1799277421455787
        manage.rMSRecommenderEvaluator();
    }
}