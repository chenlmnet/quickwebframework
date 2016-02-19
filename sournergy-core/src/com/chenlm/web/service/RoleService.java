package com.chenlm.web.service;

import com.chenlm.jpa.IRoleDao;
import com.chenlm.jpa.model.Role;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * User业务层，依赖持久层  IUserDao
 *
 * @author liuyt
 * @date 2014-10-30 下午2:37:21
 */
@Service
public class RoleService {
    @Resource
    private IRoleDao roleDao;

    public List<Role> findAllUsers() {
        return (List<Role>) roleDao.findAll();
    }

    public Page<Role> findAllUserByPage(PageRequest page) {
        return (Page<Role>) roleDao.findAll(page);
    }

    public Role findRole(String name) {
        if (name == null)
            return null;
        return roleDao.findRoleByName(name);
    }

    public Role findRole(Long id) {
        if (id == null)
            return null;
        return roleDao.findOne(id);
    }

    public void save(Role role) {
        roleDao.save(role);
    }

    // 获取新注册用户组
    public Role getRegisterRole() {
        return roleDao.findRoleByIsNew(true);
    }
}