package com.chenlm.web.service;

import com.chenlm.jpa.ITagDao;
import com.chenlm.jpa.model.Attachment;
import com.chenlm.jpa.model.Company;
import com.chenlm.jpa.model.Contractor;
import com.chenlm.jpa.model.Tag;
import com.chenlm.web.controller.model.CompanyAttachFiles;
import com.chenlm.web.controller.model.Searcher;
import org.apache.commons.io.FilenameUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * company业务层，依赖持久层
 *
 * @date 2014-10-30 下午2:37:21
 */
@Service
public class TagService {
    @Resource
    private ITagDao tagDao;

    /**
     * 获取行业标签
     */
    public List<Tag> getBussinessTag() {
        return tagDao.findByType("busi");
    }

    /**
     * 获取质量体系标签
     *
     * @return
     */
    public List<Tag> getQualityTag() {
        return tagDao.findByType("quality");
    }

    /**
     * 获取总体评价标签
     *
     * @return
     */
    public List<Tag> getVotes() {
        return tagDao.findByType("vote");
    }

    /**
     * 获取专业能力标签
     *
     * @return
     */
    public List<Tag> getPro() {
        return tagDao.findByType("pro");
    }

    /**
     * 获取type类型的标签
     *
     * @param type
     * @return
     */
    public List<Tag> getVotes(String type) {
        return tagDao.findByType(type);
    }

}