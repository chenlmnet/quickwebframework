package com.chenlm.jpa.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * AUser实体类
 *
 * @author liuyt
 * @since 2014-10-30 下午2:27:37
 */
@Entity
public class AUser {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String userName;

    @Column
    private String passWord;

    @Column
    private String email;

    @Column
    private String companyEmail;

    @Column
    private String inviteCode; // 邀请码

    @Column
    private String regCode; // 注册激活码

    @Column
    private boolean enabled = true;// 启用/禁用

    @ManyToOne
    @JoinTable(name = "role_users", joinColumns = {
            @JoinColumn(name = "user_id")
    }, inverseJoinColumns = {
            @JoinColumn(name = "role_id")
    })
    private Role role;// 类型：0 管理员， 1 未激活用户， 2 注册用户， 3 专业用户

    @OneToMany(mappedBy = "auser", targetEntity = Vote.class, fetch = FetchType.EAGER)
    private List<Vote> votes;// 点评

    @OneToMany(mappedBy = "auser", targetEntity = Comment.class, fetch = FetchType.EAGER)
    private Set<Comment> comments;// 点评

    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinTable(name = "company_focus_users", joinColumns = {
            @JoinColumn(name = "user_id")
    }, inverseJoinColumns = {
            @JoinColumn(name = "company_id")
    })
    private Set<Company> companies;// 关注的公司

    @OneToMany(mappedBy = "aUser", targetEntity = Company.class,
            cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Set<Company> createCompanies;// 创建的公司

    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinTable(name = "users_focus_users", joinColumns = {
            @JoinColumn(name = "user_id")
    }, inverseJoinColumns = {
            @JoinColumn(name = "focus_user_id")
    })
    private Set<AUser> focusUsers;// 关注

    @ManyToMany(mappedBy = "focusUsers", cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Set<AUser> bfocusUsers;// 被关注

    @Column
    private Long score; // 积分

    // 基本信息
    @Column
    private String location;
    @Column
    private String companyName;
    @Column
    private String univercity;
    @Column
    private String professional;
    @Column
    private String description;

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

    public List<Vote> getVotes() {
        return votes;
    }

    public void setVotes(List<Vote> votes) {
        this.votes = votes;
    }

    public Set<Company> getCompanies() {
        return companies;
    }

    public void setCompanies(Set<Company> companies) {
        this.companies = companies;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getUnivercity() {
        return univercity;
    }

    public void setUnivercity(String univercity) {
        this.univercity = univercity;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Company> getCreateCompanies() {
        return createCompanies;
    }

    public void setCreateCompanies(Set<Company> createCompanies) {
        this.createCompanies = createCompanies;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Set<AUser> getFocusUsers() {
        return focusUsers;
    }

    public void setFocusUsers(Set<AUser> focusUsers) {
        this.focusUsers = focusUsers;
    }

    public Set<AUser> getBfocusUsers() {
        return bfocusUsers;
    }

    public void setBfocusUsers(Set<AUser> bfocusUsers) {
        this.bfocusUsers = bfocusUsers;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "AUser{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", email='" + email + '\'' +
                ", companyEmail='" + companyEmail + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AUser aUser = (AUser) o;

        return !(id != null ? !id.equals(aUser.id) : aUser.id != null);

    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
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

    public void addCompany(Company company) {
        this.companies.add(company);
    }

    public boolean addFocusUser(AUser user) {
        if (focusUsers == null) {
            focusUsers = new HashSet<>();
        }
        focusUsers.add(user);
        return true;
    }

    public boolean removeFocusUser(AUser user) {
        if (focusUsers == null) {
            focusUsers = new HashSet<>();
        }
        focusUsers.remove(user);
        return true;
    }
}