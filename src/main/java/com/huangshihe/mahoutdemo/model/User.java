package com.huangshihe.mahoutdemo.model;

import com.huangshihe.mahoutdemo.model.base.BaseUser;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class User extends BaseUser<User> {

    public static final User dao = new User();

    public static User verify(User toVerify) {
        return dao.findFirst("select * from t_user where username=? and password=?", toVerify.getUsername(), toVerify.getPassword());
    }

    public static User getUser(int userId){
        return User.dao.findFirstByCache("userList", "user" + userId,
                "select * from t_user where id=?", userId);
    }
}
