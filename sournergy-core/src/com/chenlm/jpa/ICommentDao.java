package com.chenlm.jpa;

import com.chenlm.jpa.model.*;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * 持久层接口
 */
@Repository
public interface ICommentDao extends PagingAndSortingRepository<Comment, Long> {
    Comment findByAuserAndCompany(AUser aUser, Company company);
}