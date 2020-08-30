package com.stusys.entity;

/**
 * 返回结果状态
 */
public enum StatusCode {

    SUCCESS(1,"success"),
    ERROR(0,"failed")
    ;
    //状态码
    private int status;

    //返回信息
    private String msg;


    StatusCode (int status,String msg){
        this.status=status;
        this.msg=msg;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
