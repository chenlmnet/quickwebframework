package com.chenlm.jpa.model;

import javax.persistence.*;

/**
 * Created by chenlm on 15-11-29.
 */
@Entity
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    private String name; // 名称

    private String country; // 国家

    private String puchasing; // 采购金额

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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPuchasing() {
        return puchasing;
    }

    public void setPuchasing(String puchasing) {
        this.puchasing = puchasing;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", company=" + company.getId() +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", puchasing='" + puchasing + '\'' +
                '}';
    }
}
