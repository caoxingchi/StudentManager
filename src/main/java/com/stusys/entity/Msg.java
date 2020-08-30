package com.stusys.entity;

/**
 * 响应类返回结果到前端
 * @param <T>
 */
public class Msg<T> {
    private int status;
    private String message;
    private T data;

    private Msg(int status) {
        this.status = status;
    }

    private Msg(int status, T data) {
        this.status = status;
        this.data = data;
    }

    private Msg(int status, String message) {
        this.status = status;
        this.message = message;
    }

    private Msg(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    /**
     * Create by success server response.
     *
     * @param <T> the type parameter
     * @return the server response
     */
    public static <T> Msg<T> success() {
        return new Msg<T>(StatusCode.SUCCESS.getStatus());
    }

    /**
     * Create by success message server response.
     *
     * @param <T> the type parameter
     * @param msg the msg
     * @return the server response
     */
    public static <T> Msg<T> successMessage(String msg) {
        return new Msg<T>(StatusCode.SUCCESS.getStatus(), msg);
    }

    /**
     * Create by success server response.
     *
     * @param <T>  the type parameter
     * @param data the data
     * @return the server response
     */
    public static <T> Msg<T> success(T data) {
        return new Msg<T>(StatusCode.SUCCESS.getStatus(), data);
    }

    /**
     * Create by success server response.
     *
     * @param <T>  the type parameter
     * @param msg  the msg
     * @param data the data
     * @return the server response
     */
    public static <T> Msg<T> success(String msg, T data) {
        return new Msg<T>(StatusCode.SUCCESS.getStatus(), msg, data);
    }


    /**
     * Create by error server response.
     *
     * @param <T> the type parameter
     * @return the server response
     */
    public static <T> Msg<T> error() {
        return new Msg<T>(StatusCode.ERROR.getStatus(), StatusCode.ERROR.getMsg());
    }

    public static <T> Msg<T> error(int errorCode, String errorMessage) {
        return new Msg<T>(errorCode, errorMessage);
    }


    /**
     * Create by error message server response.
     *
     * @param <T>          the type parameter
     * @param errorMessage the error message
     * @return the server response
     */
    public static <T> Msg<T> errorMessage(String errorMessage) {
        return new Msg<T>(StatusCode.ERROR.getStatus(), errorMessage);
    }

    /**
     * Create by error code message server response.
     *
     * @param <T>          the type parameter
     * @param errorCode    the error code
     * @param errorMessage the error message
     * @return the server response
     */
    public static <T> Msg<T> errorCodeMessage(int errorCode, String errorMessage) {
        return new Msg<T>(errorCode, errorMessage);
    }

    /**
     * Create by error server response.
     *
     * @param <T>          the type parameter
     * @param errorMessage the error message
     * @param data         the data
     * @return the server response
     */
    public static <T> Msg<T> error(String errorMessage, T data) {
        return new Msg<T>(StatusCode.ERROR.getStatus(), errorMessage, data);
    }

    /**
     * 返回系统状态码以及相应说明
     *
     * @param StatusCode
     * @param <T>
     * @return
     */
    public static <T> Msg<T> response(StatusCode StatusCode) {
        return new Msg<T>(StatusCode.getStatus(), StatusCode.getMsg());
    }

}
