package com.chenlm.web.controller.model;

/**
 * Created by chenlm on 15-11-27.
 */
public class Searcher {
    private String applyFor;

    private String products;
    private String material;
    private String methodology;

    private String country;
    private String province;
    private String city;
    private String district;

    private String employee;

    private String ownership;

    private String keyword;

    private Integer page = 0;
    private Integer pagesize = 10;

    public String getApplyFor() {
        return applyFor;
    }

    public void setApplyFor(String applyFor) {
        this.applyFor = applyFor;
    }

    public String getProducts() {
        return products;
    }

    public void setProducts(String products) {
        this.products = products;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getMethodology() {
        return methodology;
    }

    public void setMethodology(String methodology) {
        this.methodology = methodology;
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

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getEmployee() {
        return employee;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
    }

    public String getOwnership() {
        return ownership;
    }

    public void setOwnership(String ownership) {
        this.ownership = ownership;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPagesize() {
        return pagesize;
    }

    public void setPagesize(Integer pagesize) {
        this.pagesize = pagesize;
    }

    @Override
    public String toString() {
        return "Searcher{" +
                "applyFor='" + applyFor + '\'' +
                ", products='" + products + '\'' +
                ", material='" + material + '\'' +
                ", methodology='" + methodology + '\'' +
                ", country='" + country + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", employee='" + employee + '\'' +
                ", ownership='" + ownership + '\'' +
                ", keyword='" + keyword + '\'' +
                ", page=" + page +
                ", pagesize=" + pagesize +
                '}';
    }
}
