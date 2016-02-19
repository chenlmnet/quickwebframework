package com.chenlm.jpa.model;

import javax.persistence.*;

/**
 * Created by chenlm on 15-8-16.
 */
@Entity
public class Param {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    public String pid; // 参数类别id

    @Column
    private String name; // 参数名

    @Column
    public String value; // 参数值

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Param{" +
                "pid='" + pid + '\'' +
                ", name='" + name + '\'' +
                ", value='" + value + '\'' +
                ", id=" + id +
                '}';
    }

}
