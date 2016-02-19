package com.chenlm.web.controller.model;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by chenlm on 15-11-27.
 */
public class CompanyAttachFiles {
    private MultipartFile logoFile;
    private List<MultipartFile> reportFiles;
    private List<MultipartFile> machinesFiles;
    private List<MultipartFile> organisationFiles;
    private List<MultipartFile> qualityFiles;
    private List<MultipartFile> testingFiles;
    private List<MultipartFile> manualFiles;
    private List<MultipartFile> certificateFiles;

    public MultipartFile getLogoFile() {
        return logoFile;
    }

    public void setLogoFile(MultipartFile logoFile) {
        this.logoFile = logoFile;
    }

    public List<MultipartFile> getReportFiles() {
        return reportFiles;
    }

    public void setReportFiles(List<MultipartFile> reportFiles) {
        this.reportFiles = reportFiles;
    }

    public List<MultipartFile> getMachinesFiles() {
        return machinesFiles;
    }

    public void setMachinesFiles(List<MultipartFile> machinesFiles) {
        this.machinesFiles = machinesFiles;
    }

    public List<MultipartFile> getOrganisationFiles() {
        return organisationFiles;
    }

    public void setOrganisationFiles(List<MultipartFile> organisationFiles) {
        this.organisationFiles = organisationFiles;
    }

    public List<MultipartFile> getQualityFiles() {
        return qualityFiles;
    }

    public void setQualityFiles(List<MultipartFile> qualityFiles) {
        this.qualityFiles = qualityFiles;
    }

    public List<MultipartFile> getTestingFiles() {
        return testingFiles;
    }

    public void setTestingFiles(List<MultipartFile> testingFiles) {
        this.testingFiles = testingFiles;
    }

    public List<MultipartFile> getManualFiles() {
        return manualFiles;
    }

    public void setManualFiles(List<MultipartFile> manualFiles) {
        this.manualFiles = manualFiles;
    }

    public List<MultipartFile> getCertificateFiles() {
        return certificateFiles;
    }

    public void setCertificateFiles(List<MultipartFile> certificateFiles) {
        this.certificateFiles = certificateFiles;
    }

    @Override
    public String toString() {
        return "CompanyAttachFiles{" +
                "logoFile=" + logoFile +
                ", reportFiles=" + reportFiles +
                ", machinesFiles=" + machinesFiles +
                ", organisationFiles=" + organisationFiles +
                ", qualityFiles=" + qualityFiles +
                ", testingFiles=" + testingFiles +
                ", manualFiles=" + manualFiles +
                ", certificateFiles=" + certificateFiles +
                '}';
    }
}
