package com.yftech.engineeringmode.model;

/* loaded from: /home/user/work/dex/classes2.dex */
public class CheckInfo {
    public static final int CHECK_RESULT_NG = 1;
    public static final int CHECK_RESULT_OK = 0;
    private String key;
    private String name;
    private String realValue;
    private int result;
    private String value;

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKey() {
        return this.key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getRealValue() {
        return this.realValue;
    }

    public void setRealValue(String realValue) {
        this.realValue = realValue;
    }

    public int getResult() {
        return this.result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String toString() {
        return "CheckInfo{name='" + this.name + "', key='" + this.key + "', value='" + this.value + "', realValue='" + this.realValue + "', result=" + this.result + '}';
    }
}
