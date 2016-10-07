package com.huangshihe.mahoutdemo.util;

/**
 * Created by huang.shihe on 10/7/16.
 */
public class SqlUtil {
    public static boolean appendWhereIfNeed(StringBuffer sql, boolean hasWhere) {
        if (!hasWhere) {
            sql.append(" where ");
        } else {
            sql.append(" and ");
        }
        return true;
    }
}
