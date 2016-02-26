package com.chenlm.jpa;

import com.chenlm.jpa.model.Role;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * 持久层接口
 */
@Repository
public interface IRoleDao extends PagingAndSortingRepository<Role, Long> {
    Role findRoleByName(String name);
    Role findRoleByIsNew(boolean isNew);
}