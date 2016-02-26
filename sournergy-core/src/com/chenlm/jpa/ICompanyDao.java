package com.chenlm.jpa;

import com.chenlm.jpa.model.Company;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * 公司查询搜索接口
 */
@Repository
public interface ICompanyDao extends PagingAndSortingRepository<Company, Long> {
    Page<Company> findByTitleLikeOrderByIdDesc(String title, Pageable page);

    Page<Company> findByTitleLikeAndProvinceLikeAndCityLikeAndDistrictLikeAndEmployeeTotalBetweenOrderByIdDesc(
            String title, String province, String city, String distinct, Integer min, Integer max, Pageable page);
}