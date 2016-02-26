package com.chenlm.comm;

/**
 * Created by chenlm on 15-11-30.
 */
public class SendMail {
    public static synchronized boolean sendRegMail(String email, String regcode) {
        Mail m = new Mail();
        m.setDisplayName("索即Sournergy");
        m.setFrom("chenlmncut@163.com");
        m.setIfAuth(true);
        m.setUserName("chenlmncut");
        m.setPassword("874128523M");
        m.setSmtpServer("smtp.163.com");
        m.setSubject("激活用户 - 索即Sournergy");
        m.setTo(email);
        m.setContent(regcode);

        try {
            m.send();
        } catch (Exception e) {
        }
        return true;
    }
}
