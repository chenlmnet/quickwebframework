package com.chenlm.jpa.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 评论
 * Created by chenlm on 15-11-29.
 */
@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
//    @JoinTable(name = "company_comments")
    @JoinColumn(name = "company_id")
    private Company company;

    @ManyToOne
//    @JoinTable(name = "user_comments")
    @JoinColumn(name = "user_id")
    private AUser auser;

    @OneToMany(mappedBy = "comment", targetEntity = Vote.class,
            fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    private List<Vote> votes;

    @Column
    private String title;

    @Column
    private String content;

    @Column
    private Date opttime = new Date();

    @Transient
    private int count = 0;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getOpttime() {
        return opttime;
    }

    public void setOpttime(Date opttime) {
        this.opttime = opttime;
    }

    public AUser getAuser() {
        return auser;
    }

    public void setAuser(AUser auser) {
        this.auser = auser;
    }

    public List<Vote> getVotes() {
        return votes;
    }

    public void setVotes(List<Vote> votes) {
        this.votes = votes;
    }

    public int getCount() {
        count = votes == null ? 0 : votes.size();
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment = (Comment) o;

        return !(id != null ? !id.equals(comment.id) : comment.id != null);

    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    public void calcVote() {
        count = votes == null ? 0 : votes.size();
    }
}
