package com.chenlm.jpa.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by chenlm on 15-8-25.
 */
@Entity
public class Tag {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinTable(name = "company_tag", joinColumns = {
            @JoinColumn(name = "tag_id")
    }, inverseJoinColumns = {
            @JoinColumn(name = "company_id")
    })
    private Set<Company> companies;

    private String type; // 分类

    private String name; // 名称

    @Column
    private Long pid; // 父标签

    @Column
    private Long sort; // 排序

    @ManyToOne
    @JoinColumn(name = "pid", insertable = false, updatable = false)
    private Tag parent;

    @OneToMany(mappedBy = "parent", fetch = FetchType.EAGER)
    @OrderBy("id")
    private List<Tag> children;

    @OneToMany(mappedBy = "tag", cascade = CascadeType.REFRESH,
            targetEntity = Vote.class, fetch = FetchType.EAGER)
    private List<Vote> votes;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<Company> getCompanies() {
        return companies;
    }

    public void setCompanies(Set<Company> companies) {
        this.companies = companies;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getSort() {
        return sort;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }

    public Tag getParent() {
        return parent;
    }

    public void setParent(Tag parent) {
        this.parent = parent;
    }

    public List<Tag> getChildren() {
        return children;
    }

    public void setChildren(List<Tag> children) {
        this.children = children;
    }

    public List<Vote> getVotes() {
        return votes;
    }

    public void setVotes(List<Vote> votes) {
        this.votes = votes;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "id=" + id +
//                ", company=" + company.getId() +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tag tag = (Tag) o;

        return id.equals(tag.id);

    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    public void addCompany(Company company) {
        if (companies == null) {
            companies = new HashSet<>();
        }
        companies.add(company);
    }
}
