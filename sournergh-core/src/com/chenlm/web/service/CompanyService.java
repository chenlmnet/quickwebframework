package com.chenlm.web.service;

import com.chenlm.jpa.ICommentDao;
import com.chenlm.jpa.ICompanyDao;
import com.chenlm.jpa.ITagDao;
import com.chenlm.jpa.IVoteDao;
import com.chenlm.jpa.model.*;
import com.chenlm.web.controller.model.CompanyAttachFiles;
import com.chenlm.web.controller.model.Searcher;
import org.apache.commons.io.FilenameUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * company业务层，依赖持久层
 *
 * @date 2014-10-30 下午2:37:21
 */
@Service
public class CompanyService {
    public static final String UPLOAD_DIR = "/upload";
    // 推荐用Resource来替代AutoWrite注解
    @Resource
    private ICompanyDao companyDao;
    @Resource
    private ITagDao tagDao;
    @Resource
    private IVoteDao iVoteDao;
    @Resource
    private ICommentDao iCommentDao;
    @Resource
    private ITagDao iTagDao;

    // 新增公司
    public void saveCompany(Company company) {
        List<Contractor> contractors = company.getContractors();
        if (contractors != null)
            for (Contractor contractor : contractors) {
                contractor.setCompany(company);
            }
        List<Tag> business = company.getBusiness();
        if (business != null)
            for (int i = 0; i < business.size(); i++) {
                Tag tag = business.get(i);
                if (tag.getId() != null)
                    tag = iTagDao.findOne(tag.getId());
                tag.addCompany(company);
                business.set(i, tag);
            }

        List<Tag> professionals = company.getProfessionals();
        if (professionals != null)
            for (int i = 0; i < professionals.size(); i++) {
                Tag tag = professionals.get(i);
                if (tag.getId() != null)
                    tag = iTagDao.findOne(tag.getId());
                tag.addCompany(company);
                professionals.set(i, tag);
            }

        List<Tag> quality = company.getQuality();
        if (quality != null)
            for (int i = 0; i < quality.size(); i++) {
                Tag tag = quality.get(i);
                if (tag.getId() != null)
                    tag = iTagDao.findOne(tag.getId());
                tag.addCompany(company);
                quality.set(i, tag);
            }

        List<Comment> comments = company.getComments();
        if (comments != null)
            for (Comment comment : comments) {
                comment.setCompany(company);
            }
        List<Vote> votes = company.getVotes();
        if (votes != null)
            for (Vote vote : votes) {
                vote.setCompany(company);
            }
        List<Customer> customers = company.getCustomers();
        if (customers != null)
            for (Customer customer : customers) {
                customer.setCompany(company);
            }
        List<Supplier> suppliers = company.getSuppliers();
        if (suppliers != null)
            for (Supplier supplier : suppliers) {
                supplier.setCompany(company);
            }
        List<Tag> tags = company.getTags();
        if (tags != null)
            for (int i = 0; i < tags.size(); i++) {
                Tag tag = tags.get(i);
                if (tag.getId() != null)
                    tag = iTagDao.findOne(tag.getId());
                tag.addCompany(company);
                tags.set(i, tag);
            }

        List<Attachment> logo = company.getLogo();
        if (logo != null)
            for (Attachment attachment : logo) {
                attachment.setCompany(company);
            }
        Set<Attachment> attachments = company.getAttachments();
        if (attachments != null)
            for (Attachment attachment : attachments) {
                attachment.setCompany(company);
            }
        companyDao.save(company);
        tagDao.save(quality);
    }

    // 获取公司
    public Company getCompany(Company company) {
        Company companyOne = companyDao.findOne(company.getId());
        if (companyOne != null) {
            for (Comment comment : companyOne.getComments()) {
                comment.calcVote();
            }
        }
        return companyOne;
    }

    public Page<Company> findCompany(PageRequest page) {
        return companyDao.findAll(page);
    }

    // 搜索
    public Page<Company> findByTitleLike(String title, PageRequest page) {
        Page<Company> companyPage = companyDao.findByTitleLikeOrderByIdDesc(title, page);
        return calcSize(companyPage);
    }

    public Set<Attachment> saveCompanyFiles(CompanyAttachFiles companyFiles, String uploadDir)
            throws IOException {
        Set<Attachment> attachments = new HashSet<>();

        List<MultipartFile> reportFiles = companyFiles.getReportFiles();
        List<Attachment> saveFiles = saveFiles(uploadDir, "1", reportFiles.toArray(new MultipartFile[]{}));
        attachments.addAll(saveFiles);

        List<MultipartFile> machinesFiles = companyFiles.getMachinesFiles();
        saveFiles = saveFiles(uploadDir, "2", machinesFiles.toArray(new MultipartFile[]{}));
        attachments.addAll(saveFiles);

        List<MultipartFile> organisationFiles = companyFiles.getOrganisationFiles();
        saveFiles = saveFiles(uploadDir, "3", organisationFiles.toArray(new MultipartFile[]{}));
        attachments.addAll(saveFiles);

        List<MultipartFile> qualityFiles = companyFiles.getQualityFiles();
        saveFiles = saveFiles(uploadDir, "4", qualityFiles.toArray(new MultipartFile[]{}));
        attachments.addAll(saveFiles);

        List<MultipartFile> testingFiles = companyFiles.getTestingFiles();
        saveFiles = saveFiles(uploadDir, "5", testingFiles.toArray(new MultipartFile[]{}));
        attachments.addAll(saveFiles);

        List<MultipartFile> manualFiles = companyFiles.getManualFiles();
        saveFiles = saveFiles(uploadDir, "6", manualFiles.toArray(new MultipartFile[]{}));
        attachments.addAll(saveFiles);

        List<MultipartFile> certificateFiles = companyFiles.getCertificateFiles();
        saveFiles = saveFiles(uploadDir, "7", certificateFiles.toArray(new MultipartFile[]{}));
        attachments.addAll(saveFiles);

        return attachments;
    }

    private List<Attachment> saveFiles(String uploadDir, String type, MultipartFile... files)
            throws IOException {
        List<Attachment> attachments = new ArrayList<>();
        if (files != null) {
            for (MultipartFile multipartFile : files) {
                if (multipartFile != null && multipartFile.getSize() > 0) {
                    String extension = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
                    String filename = UPLOAD_DIR + File.separator
                            + String.valueOf(new Date().getTime()) + "." + extension;
                    multipartFile.transferTo(new File(uploadDir + File.separator + filename));

                    Attachment attachment = new Attachment();
                    attachment.setType(type);
                    attachment.setUrl(filename);

                    attachments.add(attachment);
                }
            }
        }
        return attachments;
    }

    public List<Attachment> saveCompanyLogo(CompanyAttachFiles companyFiles, String uploadDir)
            throws IOException {
        MultipartFile logoFile = companyFiles.getLogoFile();
        return saveFiles(uploadDir, "0", logoFile);
    }

    public Page<Company> search() {
        return search(new Searcher());
    }

    public Page<Company> search(Searcher searcher) {
        Integer page = searcher.getPage();
        if (page == null || page < 0) {
            page = 0;
        }
        Integer pagesize = searcher.getPagesize();
        if (pagesize == null || pagesize < 0) {
            pagesize = 10;
        }
        PageRequest pageRequest = new PageRequest(page, pagesize);
        Integer min = 0;
        Integer max = Integer.MAX_VALUE;
        String employee = searcher.getEmployee();
        if (employee != null && !"all".equals(employee)) {
            String[] split = employee.split("-");
            if (split.length > 0 && split[0] != null && !"".equals(split[0]))
                min = Integer.parseInt(split[0]);
            if (split.length > 1 && split[1] != null && !"".equals(split[1]))
                max = Integer.parseInt(split[1]);
        }
//        Page<Company> companyPage = findByTitleLike("%" + searcher.getKeyword() + "%", pageRequest);
        String keyword = nullConvert(searcher.getKeyword());
        String province = nullConvert(searcher.getProvince());
        String city = nullConvert(searcher.getCity());
        String district = nullConvert(searcher.getDistrict());
        Page<Company> companyPage
                = companyDao.findByTitleLikeAndProvinceLikeAndCityLikeAndDistrictLikeAndEmployeeTotalBetweenOrderByIdDesc(
                "%" + keyword + "%",
                "%" + province + "%",
                "%" + city + "%",
                "%" + district + "%",
                min,
                max,
                pageRequest);
        return calcSize(companyPage);
    }

    private String nullConvert(String word) {
        return (word == null || "all".equals(word)) ? "" : word;
    }


    public Page<Company> calcSize(Page<Company> companyPage) {
        for (Company company : companyPage.getContent()) {
            int voteSize = 0;
            for (Vote vote : company.getVotes()) {
                if (vote.getTag() != null && vote.isUpdown()) {
                    voteSize++;
                }
            }
            company.setVoteSize(voteSize);
            company.setCommentSize(company.getComments().size());
            company.setFocusSize(company.getFocusUsers().size());
        }
        return companyPage;
    }

    public boolean saveVotes(AUser login, Company company, String[] ids, String[] values) {
        if (ids != null && ids.length > 0) {
            List<Vote> votes = new ArrayList<>();
            for (int i = 0; i < ids.length; i++) {
                String tagid = ids[i];
                Tag tag = tagDao.findOne(Long.parseLong(tagid));
                Vote vote = iVoteDao.findByAuserAndCompanyAndTag(login, company, tag);
                if (vote == null) {
                    vote = new Vote();
                    vote.setAuser(login);
                    vote.setCompany(company);
                    vote.setTag(tag);
                }
                if ("1".equals(values[i])) {
                    vote.setUpdown(true);
                } else {
                    vote.setUpdown(false);
                }
                votes.add(vote);
            }
            iVoteDao.save(votes);
            return true;
        }
        return false;
    }

    public boolean saveComment(AUser login, Company company, String content) {
        if (content != null) {
            Comment comment = iCommentDao.findByAuserAndCompany(login, company);
            if (comment == null) {
                comment = new Comment();
                comment.setAuser(login);
                comment.setCompany(company);
            }
            comment.setContent(content);
            iCommentDao.save(comment);
            return true;
        }
        return false;
    }

    public boolean saveVotes(AUser login, Company company, Comment comment, boolean updown) {
        Vote vote = iVoteDao.findByAuserAndCompanyAndComment(login, company, comment);
        if (vote == null) {
            vote = new Vote();
            vote.setAuser(login);
            vote.setCompany(company);
            vote.setComment(comment);
        }
        vote.setUpdown(updown);
        iVoteDao.save(vote);
        return true;
    }

    public Page<Company> findCompanyTop(int top) {
        Sort.Order so = new Sort.Order(Sort.Direction.DESC, "opttime");
        Sort orders = new Sort(so);
        PageRequest pageRequest = new PageRequest(0, top, orders);
        Page<Company> top10 = companyDao.findAll(pageRequest);
        return top10;
    }
}