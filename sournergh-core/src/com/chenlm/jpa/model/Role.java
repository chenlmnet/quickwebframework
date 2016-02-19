package com.chenlm.jpa.model;

import javax.persistence.*;
import java.util.List;

/**
 * Role 实体类
 * Created by chenlm on 15-11-29.
 */
@Entity
public class Role {

    private static Long adminLevel = 4l;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    // 等级：数值越大，权限等级越高
    @Column
    private Long level;// -1:匿名用户 0:禁用用户(disable) 1:未激活用户(new) 2:普通用户(normal) 3:专业用户(adv) 4:管理员(admin)

    @Column
    private String name;

    @Column
    private String description;

    @OneToMany(mappedBy = "role", targetEntity = AUser.class, fetch = FetchType.EAGER)
    private List<AUser> AUsers;

    @Column
    private boolean isNew = false;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", level=" + level +
                ", name='" + name + '\'' +
                '}';
    }

    public boolean hasPrivilege(Role role) {
        return level >= role.level;
    }

    public boolean isAdmin() {
        return level >= adminLevel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<AUser> getAUsers() {
        return AUsers;
    }

    public void setAUsers(List<AUser> AUsers) {
        this.AUsers = AUsers;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }
}
