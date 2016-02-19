package com.chenlm.jpa.model;

import javax.persistence.*;

/**
 * 点评类
 * Created by chenlm on 16-1-10.
 */
@Entity
public class Vote {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @ManyToOne
    @JoinColumn(name = "user_id")
    public AUser auser;

    @ManyToOne
    @JoinColumn(name = "tag_id")
    private Tag tag;

    @ManyToOne
    @JoinColumn(name = "comment_id")
    private Comment comment;

    @Column
    private boolean updown; // 点赞、反对

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

    public AUser getAuser() {
        return auser;
    }

    public void setAuser(AUser auser) {
        this.auser = auser;
    }

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public boolean isUpdown() {
        return updown;
    }

    public void setUpdown(boolean updown) {
        this.updown = updown;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Vote vote = (Vote) o;

        return id.equals(vote.id);

    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    @Override
    public String toString() {
        return "Vote{" +
                "id=" + id +
                ", company=" + company +
                ", auser=" + auser +
                ", tag=" + tag +
                ", comment=" + comment +
                ", updown=" + updown +
                '}';
    }
}
