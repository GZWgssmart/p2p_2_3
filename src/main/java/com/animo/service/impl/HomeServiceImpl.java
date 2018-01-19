package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.HomeMapper;
import com.animo.pojo.Home;
import com.animo.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/1/17.
 */
@Service
public class HomeServiceImpl implements HomeService {
    @Autowired
    private HomeMapper homeMapper;

    @Override
    public ServerResponse save(Object object) {
        if (object != null){

            Integer integer = homeMapper.insertSelective(object);
            if (integer == 1){
                return ServerResponse.createBySuccess("添加成功");
            }else {
                return ServerResponse.createByError("添加失败");
            }
        }
        return ServerResponse.createByError("请输入内容");
    }

    @Override
    public ServerResponse getById(Integer id) {
        Object obj= homeMapper.selectByPrimaryKey(id);
        ServerResponse service= ServerResponse.createBySuccess(obj);
        return service;
    }

    @Override
    public ServerResponse updateStatus(Integer id, Integer status) {
        return null;
    }

    @Override
    public ServerResponse update(Object object) {
        homeMapper.updateByPrimaryKey(object);

        return ServerResponse.createBySuccess("更新成功");
    }

    @Override
    public ServerResponse removeById(Integer id) {
        homeMapper.deleteByPrimaryKey(id);
        return ServerResponse.createBySuccess("删除成功");
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(homeMapper.listPager(pager));
        pager.setTotal(homeMapper.count());
        return pager;
    }

    @Override
    public Home listhome() {
        return homeMapper.listhome();
    }

    @Override
    public int updhid(Integer hid) {
        return homeMapper.updhid(hid);
    }

    @Override
    public int updhids(Integer hid) {
        return homeMapper.updhids(hid);
    }
}
