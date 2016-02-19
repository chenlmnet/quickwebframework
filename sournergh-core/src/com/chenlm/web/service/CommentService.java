package com.chenlm.web.service;

import com.chenlm.jpa.ICommentDao;
import com.chenlm.jpa.model.Comment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * company业务层，依赖持久层
 *
 * @date 2014-10-30 下午2:37:21
 */
@Service
public class CommentService {
    @Resource
    private ICommentDao iCommentDao;

    public Comment getComment(Long commentid) {
        return iCommentDao.findOne(commentid);
    }
}