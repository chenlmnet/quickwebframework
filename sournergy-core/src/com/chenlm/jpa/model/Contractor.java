package com.chenlm.jpa.model;

import javax.persistence.*;

/**
 * Created by chenlm on 15-11-29.
 */
@Entity
public class Contractor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    /*@JoinTable(name = "company_contractors", joinColumns = {
            @JoinColumn(name = "contractor_id")
    }, inverseJoinColumns = {
            @JoinColumn(name = "company_id")
    })*/
    @JoinColumn(name = "company_id")
    private Company company;

    private String name; // 姓名
    private String position;// 职位
    private String phone; // 电话
    private String email; // 邮箱

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Contractor{" +
                "id=" + id +
                ", company=" + company.getId() +
                ", name='" + name + '\'' +
                ", position='" + position + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
