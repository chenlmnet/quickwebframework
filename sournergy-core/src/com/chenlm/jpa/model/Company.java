package com.chenlm.jpa.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by chenlm on 15-8-16.
 */
@Entity
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    public String top; // 推荐: 1

    @Transient
    private String msg;
    @Transient
    private Integer voteSize;
    @Transient
    private Integer commentSize;
    @Transient
    private Integer focusSize;

    @Column
    private Date opttime = new Date();
    // 基本信息
    @Column
    public String title; // 公司名
    @Column
    public String website;// 公司网址
    @OneToMany(mappedBy = "company", targetEntity = Attachment.class,
            fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    public List<Attachment> logo; // 公司logo
    @Column
    public String country;// 国家
    @Column
    public String province;// 省
    @Column
    public String city;// 城市
    @Column
    public String district;// 区县
    @Column
    public String address; // 公司地址
    @Column
    public String summary; // 公司简介
    // 销售额
    @Column
    public String turnoverTotal;
    @Column
    public String turnoverMedical;
    @Column
    public String turnoverConsumer;
    @Column
    public String turnoverTelecom;
    @Column
    public String turnoverAutomotive;
    @Column
    public String turnoverOther;
    // 市场份额
    @Column
    public String marketInside;
    @Column
    public String marketOutside;
    // 员工
    @Column
    public Integer employeeTotal;
    @Column
    public Integer employeeOperators;
    @Column
    public Integer employeeEng;
    @Column
    public Integer employeeQuality;
    // 生产
    @Column
    public String machineRate;
    @Column
    public String shifts;

    // 质量体系

    /*@Column
    public String report;
    @Column
    public String machines;
    @Column
    public String organisation;
    @Column
    public String quality;
    @Column
    public String testing;
    @Column
    public String manual;
    @Column
    public String certificate;*/

    // 创建者
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "user_id")
    public AUser aUser;

    @ManyToMany(mappedBy = "companies", targetEntity = Tag.class,
            fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    public List<Tag> tags; // 标签

    @ManyToMany(mappedBy = "companies", targetEntity = Tag.class,
            fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    public List<Tag> business; // 行业

    @ManyToMany(mappedBy = "companies", targetEntity = Tag.class,
            fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    public List<Tag> professionals; // 专业能力

    @OneToMany(mappedBy = "company", targetEntity = Comment.class,
            fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    public List<Comment> comments; // 评论

    @OneToMany(mappedBy = "company", targetEntity = Contractor.class,
            fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    public List<Contractor> contractors;// 联系人

    @OneToMany(mappedBy = "company", targetEntity = Customer.class,
            fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    public List<Customer> customers; // 客户

    @OneToMany(mappedBy = "company", targetEntity = Supplier.class,
            fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    public List<Supplier> suppliers; // 供应商

    @ManyToMany(mappedBy = "companies", targetEntity = Tag.class,
            fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    public List<Tag> quality;// 质量证书

    @OneToMany(mappedBy = "company", targetEntity = Attachment.class,
            fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    public Set<Attachment> attachments;// 附件

    // 关注用户
    @ManyToMany(mappedBy = "companies", targetEntity = AUser.class,
            fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    public List<AUser> focusUsers;

    // 关注人数
    //    public String focusNum;

    // 点评
    @OneToMany(mappedBy = "company", targetEntity = Vote.class, fetch = FetchType.EAGER)
    public List<Vote> votes;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public AUser getaUser() {
        return aUser;
    }

    public void setaUser(AUser aUser) {
        this.aUser = aUser;
        addFocusUser(aUser);
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public List<Attachment> getLogo() {
        return logo;
    }

    public void setLogo(List<Attachment> logo) {
        this.logo = logo;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getTurnoverTotal() {
        return turnoverTotal;
    }

    public void setTurnoverTotal(String turnoverTotal) {
        this.turnoverTotal = turnoverTotal;
    }

    public String getTurnoverMedical() {
        return turnoverMedical;
    }

    public void setTurnoverMedical(String turnoverMedical) {
        this.turnoverMedical = turnoverMedical;
    }

    public String getTurnoverConsumer() {
        return turnoverConsumer;
    }

    public void setTurnoverConsumer(String turnoverConsumer) {
        this.turnoverConsumer = turnoverConsumer;
    }

    public String getTurnoverTelecom() {
        return turnoverTelecom;
    }

    public void setTurnoverTelecom(String turnoverTelecom) {
        this.turnoverTelecom = turnoverTelecom;
    }

    public String getTurnoverAutomotive() {
        return turnoverAutomotive;
    }

    public void setTurnoverAutomotive(String turnoverAutomotive) {
        this.turnoverAutomotive = turnoverAutomotive;
    }

    public String getTurnoverOther() {
        return turnoverOther;
    }

    public void setTurnoverOther(String turnoverOther) {
        this.turnoverOther = turnoverOther;
    }

    public String getMarketInside() {
        return marketInside;
    }

    public void setMarketInside(String marketInside) {
        this.marketInside = marketInside;
    }

    public String getMarketOutside() {
        return marketOutside;
    }

    public void setMarketOutside(String marketOutside) {
        this.marketOutside = marketOutside;
    }

    public Date getOpttime() {
        return opttime;
    }

    public void setOpttime(Date opttime) {
        this.opttime = opttime;
    }

    public Integer getEmployeeTotal() {
        return employeeTotal;
    }

    public void setEmployeeTotal(Integer employeeTotal) {
        this.employeeTotal = employeeTotal;
    }

    public Integer getEmployeeOperators() {
        return employeeOperators;
    }

    public void setEmployeeOperators(Integer employeeOperators) {
        this.employeeOperators = employeeOperators;
    }

    public Integer getEmployeeEng() {
        return employeeEng;
    }

    public void setEmployeeEng(Integer employeeEng) {
        this.employeeEng = employeeEng;
    }

    public Integer getEmployeeQuality() {
        return employeeQuality;
    }

    public void setEmployeeQuality(Integer employeeQuality) {
        this.employeeQuality = employeeQuality;
    }

    public List<Vote> getVotes() {
        return votes;
    }

    public void setVotes(List<Vote> votes) {
        this.votes = votes;
    }

    public String getMachineRate() {
        return machineRate;
    }

    public void setMachineRate(String machineRate) {
        this.machineRate = machineRate;
    }

    public String getShifts() {
        return shifts;
    }

    public void setShifts(String shifts) {
        this.shifts = shifts;
    }

    public String getTop() {
        return top;
    }

    public void setTop(String top) {
        this.top = top;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public List<Tag> getBusiness() {
        return business;
    }

    public void setBusiness(List<Tag> business) {
        this.business = business;
    }

    public List<Tag> getProfessionals() {
        return professionals;
    }

    public void setProfessionals(List<Tag> professionals) {
        this.professionals = professionals;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Contractor> getContractors() {
        return contractors;
    }

    public void setContractors(List<Contractor> contractors) {
        this.contractors = contractors;
    }

    public List<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }

    public List<Supplier> getSuppliers() {
        return suppliers;
    }

    public void setSuppliers(List<Supplier> suppliers) {
        this.suppliers = suppliers;
    }

    public List<Tag> getQuality() {
        return quality;
    }

    public void setQuality(List<Tag> quality) {
        this.quality = quality;
    }

    public Set<Attachment> getAttachments() {
        return attachments;
    }

    public void setAttachments(Set<Attachment> attachments) {
        this.attachments = attachments;
    }

    public Integer getVoteSize() {
        return voteSize;
    }

    public void setVoteSize(Integer voteSize) {
        this.voteSize = voteSize;
    }

    public Integer getCommentSize() {
        return commentSize;
    }

    public void setCommentSize(Integer commentSize) {
        this.commentSize = commentSize;
    }

    public Integer getFocusSize() {
        return focusSize;
    }

    public void setFocusSize(Integer focusSize) {
        this.focusSize = focusSize;
    }

    public List<AUser> getFocusUsers() {
        return focusUsers;
    }

    public void setFocusUsers(List<AUser> focusUsers) {
        this.focusUsers = focusUsers;
    }

    public void addFocusUser(AUser user) {
        if (this.focusUsers == null) {
            focusUsers = new ArrayList<>();
        }
        focusUsers.add(user);
    }
    @Override
    public String toString() {
        return "Company{" +
                "top='" + top + '\'' +
                ", msg='" + msg + '\'' +
                ", title='" + title + '\'' +
                ", website='" + website + '\'' +
                ", logo='" + logo + '\'' +
                ", country='" + country + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", address='" + address + '\'' +
                ", summary='" + summary + '\'' +
                ", turnoverTotal='" + turnoverTotal + '\'' +
                ", turnoverMedical='" + turnoverMedical + '\'' +
                ", turnoverConsumer='" + turnoverConsumer + '\'' +
                ", turnoverTelecom='" + turnoverTelecom + '\'' +
                ", turnoverAutomotive='" + turnoverAutomotive + '\'' +
                ", turnoverOther='" + turnoverOther + '\'' +
                ", marketInside='" + marketInside + '\'' +
                ", marketOutside='" + marketOutside + '\'' +
                ", employeeTotal='" + employeeTotal + '\'' +
                ", employeeOperators='" + employeeOperators + '\'' +
                ", employeeEng='" + employeeEng + '\'' +
                ", employeeQuality='" + employeeQuality + '\'' +
                ", machineRate='" + machineRate + '\'' +
                ", shifts='" + shifts + '\'' +
                ", tags=" + tags +
                ", business=" + business +
                ", professionals=" + professionals +
                ", comments=" + comments +
                ", contractors=" + contractors +
                ", customers=" + customers +
                ", suppliers=" + suppliers +
                ", quality=" + quality +
                ", attachments=" + attachments +
                ", id=" + id +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Company company = (Company) o;

        return !(id != null ? !id.equals(company.id) : company.id != null);

    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
