package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.DynamicMapper;
import com.animo.dao.MediaMapper;
import com.animo.pojo.Dynamic;
import com.animo.pojo.Media;
import com.animo.service.DynamicService;
import com.animo.service.MediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2017/12/25.
 */
@Service
public class MediaServiceImpl implements MediaService {
@Autowired
private MediaMapper mediaMapper;

    @Override
    public ServerResponse save(Object object) {
        if (object != null){

            Integer integer = mediaMapper.insertSelective(object);
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
        Object obj= mediaMapper.selectByPrimaryKey(id);
        ServerResponse service= ServerResponse.createBySuccess(obj);
        return service;
    }

    @Override
    public ServerResponse updateStatus(Integer id, Integer status) {
        return null;
    }

    @Override
    public ServerResponse update(Object object) {
        mediaMapper.updateByPrimaryKey(object);

        return ServerResponse.createBySuccess("更新成功");
    }

    @Override
    public ServerResponse removeById(Integer id) {
        mediaMapper.deleteByPrimaryKey(id);
        return ServerResponse.createBySuccess("删除成功");
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(mediaMapper.listPager(pager));
        pager.setTotal(mediaMapper.count());
        return pager;
    }

    @Override
    public ServerResponse save(Media media, MultipartFile file) {
        if (media != null){

            Integer integer = mediaMapper.insertSelective(media);
            if (integer == 1){
                return ServerResponse.createBySuccess("添加成功");
            }else {
                return ServerResponse.createByError("添加失败");
            }
        }
        return ServerResponse.createByError("请输入内容");
    }


    @Override
    public Pager listPagers(Integer pageNumber, Integer pageSize) {
        Pager pager = new Pager(pageNumber, pageSize);
        pager.setRows(mediaMapper.listPager(pager));
        pager.setTotal(mediaMapper.count());
        return pager;
    }

    }

