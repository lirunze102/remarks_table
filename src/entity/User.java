package entity;

import java.sql.Date;

public class User {
    private int uId;
    private String uName;
    private String uPassword;
    private Boolean uSex;
    private String uFace;
    private Date uRegtime;
    private int uType;

    public User(int uId,String uName, String uPassword, Boolean uSex, Date uRegtime, int uType) {
        this.uId=uId;
        this.uName = uName;
        this.uPassword = uPassword;
        this.uSex = uSex;
        this.uRegtime = uRegtime;
        this.uType = uType;
    }

    public User() {
    }

    public User(int uId, String uName, String uPassword, Boolean uSex, String uFace,Date uRegtime) {
        this.uId = uId;
        this.uName = uName;
        this.uPassword = uPassword;
        this.uSex = uSex;
        this.uFace = uFace;
        this.uRegtime=uRegtime;
    }

    public User(int uId, String uName, String uPassword, Boolean uSex, String uFace) {
        this.uId = uId;
        this.uName = uName;
        this.uPassword = uPassword;
        this.uSex = uSex;
        this.uFace = uFace;
    }

    public User(String uName, String uPassword, Boolean uSex, String uFace) {
        this.uName = uName;
        this.uPassword = uPassword;
        this.uSex = uSex;
        this.uFace = uFace;

    }

    public User(int uId, String uName, String uPassword, Boolean uSex, String uFace, Date uRegtime, int uType) {
        this.uId = uId;
        this.uName = uName;
        this.uPassword = uPassword;
        this.uSex = uSex;
        this.uFace = uFace;
        this.uRegtime = uRegtime;
        this.uType = uType;
    }

    public User(String uName, String uPassword, Boolean uSex, String uFace, Date uRegtime, int uType) {
        this.uName = uName;
        this.uPassword = uPassword;
        this.uSex = uSex;
        this.uFace = uFace;
        this.uRegtime = uRegtime;
        this.uType = uType;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public Boolean getuSex() {
        return uSex;
    }

    public void setuSex(Boolean uSex) {
        this.uSex = uSex;
    }

    public String getuFace() {
        return uFace;
    }

    public void setuFace(String uFace) {
        this.uFace = uFace;
    }

    public Date getuRegtime() {
        return uRegtime;
    }

    public void setuRegtime(Date uRegtime) {
        this.uRegtime = uRegtime;
    }

    public int getuType() {
        return uType;
    }

    public void setuType(int uType) {
        this.uType = uType;
    }

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uName='" + uName + '\'' +
                ", uPassword='" + uPassword + '\'' +
                ", uSex='" + uSex + '\'' +
                ", uFace='" + uFace + '\'' +
                ", uRegtime=" + uRegtime +
                ", uType=" + uType +
                '}';
    }
}
