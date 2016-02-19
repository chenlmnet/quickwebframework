package com.chenlm.jpa;

import com.chenlm.jpa.model.Param;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * param获取接口
 */
@Repository
public interface IParamDao extends PagingAndSortingRepository<Param, Long> {
    List<Param> findByPidAndName(String pid, String name);
}