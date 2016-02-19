package com.chenlm.web.service;

import com.chenlm.jpa.IParamDao;
import com.chenlm.jpa.model.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class AdminService {
    @Resource
    private IParamDao paramDao;

    private Pattern pattern = Pattern.compile("([a-zA-Z0-9]+).([a-zA-Z0-9]+)");

    public List<Param> findAllParams() {
        return (List<Param>) paramDao.findAll();
    }

    public boolean saveParams(Map<String, String[]> parameterMap) {
        for (Map.Entry<String, String[]> paramEntry : parameterMap.entrySet()) {
            String key = paramEntry.getKey();
            Matcher matcher = pattern.matcher(key);
            String value = paramEntry.getValue()[0];
            if (matcher.matches()) {
                String pid = matcher.group(1);
                String name = matcher.group(2);
                List<Param> params = paramDao.findByPidAndName(pid, name);
                if (params == null || params.size() == 0) {
                    Param param = new Param();
                    param.setPid(pid);
                    param.setName(name);
                    param.setValue(value);
                    paramDao.save(param);
                } else if (params.size() == 1) {
                    Param param = params.get(0);
                    param.setValue(value);
                    paramDao.save(param);
                } else {
                    return false;
                }
            }
        }
        return true;
    }
}