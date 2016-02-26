package com.chenlm.web.controller.model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by chenlm on 16-1-23.
 */
public class RetBean {
    private String code;
    private String msg;
    private Gson gson = new GsonBuilder().setPrettyPrinting().create();

    private RetBean(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static final RetBean success() {
        return new RetBean("0", "操作成功");
    }

    public static final RetBean success(String msg) {
        return new RetBean("0", msg);
    }

    public static final RetBean error() {
        return new RetBean("1", "操作失败");
    }

    public static final RetBean error(String code) {
        return new RetBean(code, "操作失败");
    }

    public static final RetBean error(String code, String msg) {
        return new RetBean(code, msg);
    }

    public String toJson() {
        return gson.toJson(this);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "RetBean{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                '}';
    }
}
