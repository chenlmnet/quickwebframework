package com.chenlm.web.service;

import com.chenlm.jpa.IUserDao;
import com.chenlm.jpa.model.AUser;
import com.chenlm.jpa.model.Company;
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
public class UserService {
    // 推荐用Resource来替代AutoWrite注解
    @Resource
    private IUserDao userDao;

    // 新增用户
    public AUser saveUser(AUser aUser) {
        aUser = userDao.save(aUser);
        return aUser;
    }

    // 删除用户，参数也可以为一个含有id的User对象
    public void deleteUser(Long id) {
        userDao.delete(id);
    }

    // 查询所有user对象，findOne为查询单个
    public List<AUser> findAllUsers() {
        return (List<AUser>) userDao.findAll();
    }

    /**
     * 根据一个分页对象查询user集合（还可以添加一个Store排序属性）
     * PageRequest    是spring自己封装的请求分页类，实现了Pageable接口，包涵从请求中获得的分页属性（当前页和大小）和获取方法
     * 通过调用分页方法，返回一个Page<>一个泛型集合的分页对象，里面包涵了通过查询计算出的各个属性和结果集
     * 详细类结构和属性请参阅源码
     *
     * @param page
     * @return
     */
    public Page<AUser> findAllUserByPage(PageRequest page) {
        return (Page<AUser>) userDao.findAll(page);
    }

    public AUser findUser(AUser aUser) {
        if (aUser == null || aUser.getUserName() == null || "".equals(aUser.getUserName()))
            return null;
        return userDao.findUserByUserName(aUser.getUserName());
    }

    public AUser findUser(Long id) {
        if (id == null)
            return null;
        return userDao.findOne(id);
    }

    public boolean focusCompany(AUser user, Company company) {
        user = findUser(user);
        user.addCompany(company);
        saveUser(user);
        return true;
    }
}