package com.chenlm.jpa;

import com.chenlm.jpa.model.*;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * 持久层接口
 */
@Repository
public interface IVoteDao extends PagingAndSortingRepository<Vote, Long> {
    Vote findByAuserAndCompanyAndTag(AUser aUser, Company company, Tag tag);

    Vote findByAuserAndCompanyAndComment(AUser login, Company company, Comment comment);
}