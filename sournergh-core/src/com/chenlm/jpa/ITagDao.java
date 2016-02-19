package com.chenlm.jpa;

import com.chenlm.jpa.model.Tag;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 持久层接口
 */
@Repository
public interface ITagDao extends PagingAndSortingRepository<Tag, Long> {
    List<Tag> findByType(String type);
}