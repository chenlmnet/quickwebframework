package com.chenlm.jpa.model;

import javax.persistence.*;

/**
 * User实体类
 *
 * @author liuyt
 * @date 2014-10-30 下午2:27:37
 */
@Entity
public class User {

    @SequenceGenerator(name = "MY_SUQUENCE", sequenceName = "DEFAULT_SUQUENCE")
    @Id
    @GeneratedValue(generator = "MY_SUQUENCE")
    private Long id;

    @Column
    private String userName;

    @Column
    private String passWord;

    @Column
    private String email;

    @Column
    private String companyEmail;

    private String inviteCode; // 邀请码

    private String regCode; // 注册激活码

    @ManyToOne
    @JoinTable(name = "role_users", joinColumns = {
            @JoinColumn(name = "user_id")
    }, inverseJoinColumns = {
            @JoinColumn(name = "role_id")
    })
    private Role role;// 类型：0 管理员， 1 未激活用户， 2 注册用户， 3 专业用户

    private Long score; // 积分

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }

    public String getRegCode() {
        return regCode;
    }

    public void setRegCode(String regCode) {
        this.regCode = regCode;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", email='" + email + '\'' +
                ", companyEmail='" + companyEmail + '\'' +
                '}';
    }

    public void reg() {
        setScore(0l);
        setInviteCode(genRandomStr(6));
        setRegCode(genRandomStr(36));
    }

    public String genRandomStr(int num) {
        char[] chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
        char[] strings = new char[num];
        for (int i = 0; i < num; i++) {
            strings[i] = chars[(int) (Math.random() * chars.length)];
        }
        return new String(strings);
    }

    public static void main(String[] args) {
        String s = new User().genRandomStr(36);
        System.out.println("s = " + s);
    }
}