package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.common.ValidationResult;
import com.animo.dao.BaseMapper;
import com.animo.service.BaseService;
import com.animo.utils.ValidationUtils;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Animo on 2017-12-22.
 */
public class AbstractServiceImpl implements BaseService{

    private BaseMapper baseMapper;

    private ValidationResult validationResult;

    @Autowired
    public void setBaseMapper(BaseMapper baseMapper) {
        this.baseMapper = baseMapper;
    }

    @Override
    public ServerResponse save(Object object) {
        validationResult = ValidationUtils.validateEntity(object);
        if(validationResult.isHasErrors()){
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        Integer integer = baseMapper.insertSelective(object);
        if(integer==1){
            return ServerResponse.createBySuccess("添加成功");
        }
        return ServerResponse.createByError("添加失败");
    }

    @Override
    public ServerResponse getById(Integer id) {
        Object object = baseMapper.selectByPrimaryKey(id);
        return ServerResponse.createBySuccess(object);
    }

    @Override
    public ServerResponse updateStatus(Integer id,Integer status) {
        Integer integer = baseMapper.updateStatus(id,status);
        return integer==1?ServerResponse.createBySuccess("更新成功"):ServerResponse.createByError("更新失败");
    }

    @Override
    public ServerResponse update(Object object) {
        validationResult = ValidationUtils.validateEntity(object);
        if(validationResult.isHasErrors()){
            return ServerResponse.createByError("更新失败");
        }
        Integer integer = baseMapper.updateByPrimaryKeySelective(object);
        return integer==1?ServerResponse.createBySuccess("更新成功"):ServerResponse.createByError("更新失败");
    }


    @Override
    public ServerResponse removeById(Integer id) {
        Integer integer = baseMapper.deleteByPrimaryKey(id);
        return integer==1?ServerResponse.createBySuccess("删除成功"):ServerResponse.createByError("删除失败");
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(baseMapper.listPager(pager));
        pager.setTotal(baseMapper.count());
        return pager;
    }
}
