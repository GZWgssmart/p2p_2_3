package com.animo.service.impl;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.common.ValidationResult;
import com.animo.dao.RoleMapper;
import com.animo.pojo.Role;
import com.animo.pojo.Rolejur;
import com.animo.service.RoleJurService;
import com.animo.service.RoleService;
import com.animo.utils.ValidationUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl extends AbstractServiceImpl implements RoleService{

    private RoleMapper roleMapper;
    @Autowired
    private RoleJurService roleJurService;
    private ValidationResult validationResult;

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        super.setBaseMapper(roleMapper);
        this.roleMapper = roleMapper;
    }

    @Override
    public List<Role> listAll() {
        return roleMapper.listAll();
    }

    @Override
    public List<Role> listByPid(Integer pid) {
        return roleMapper.listByPid(pid);
    }

    @Override
    public ServerResponse deleteByRoleKey(Integer id) {
        try {
            roleMapper.deleteByRoleKey(id);
            return ServerResponse.createBySuccess("删除成功");
        }catch (Exception e){
            return ServerResponse.createByError("删除失败");
        }
    }

    @Override
    public ServerResponse save(Role role, String jurString){
        validationResult = ValidationUtils.validateEntity(role);
        if(validationResult.isHasErrors()){
            return ServerResponse.createByError(validationResult.getErrorMsg());
        }
        Integer integer = roleMapper.insertSelective(role);
        if (jurString != null && jurString.length() > 0){
            //获取rid
            String [] jurList = jurString.split(",");
            List<Rolejur> rolejurList = new ArrayList<>();
            Rolejur rolejur;
            for (int i = 0; i < jurList.length; i++){
                rolejur = new Rolejur();
                rolejur.setRid(role.getRid());
                rolejur.setJid(Integer.valueOf(jurList[i]));
                rolejurList.add(rolejur);
            }
            Integer x = roleJurService.saveRolejur(rolejurList);
        }
        if(integer==1){
            return ServerResponse.createBySuccess("添加成功");
        }
        return ServerResponse.createByError("添加失败");
    }
}