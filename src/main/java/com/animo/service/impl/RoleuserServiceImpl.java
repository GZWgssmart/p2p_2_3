package com.animo.service.impl;

import com.animo.common.ServerResponse;
import com.animo.common.ValidationResult;
import com.animo.dao.RoleuserMapper;
import com.animo.pojo.Roleuser;
import com.animo.service.RoleuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleuserServiceImpl extends AbstractServiceImpl implements RoleuserService {

    private RoleuserMapper roleuserMapper;

    private ValidationResult validationResult;

    @Autowired
    public void setRoleuserMapper(RoleuserMapper roleuserMapper) {
        super.setBaseMapper(roleuserMapper);
        this.roleuserMapper = roleuserMapper;
    }

    /**
     * //批量插入用户，角色
     * @param ridString 批量角色rid
     * @param huidString 批量用户huid
     * @return
     */
    @Override
    public ServerResponse save(String ridString, String huidString) {
        String [] ridList = ridString.split(",");
        String [] huidList = huidString.split(",");
        Integer integer = 0;
        List<Roleuser> roleuserList = new ArrayList<>();
        for (int i = 0; i < huidList.length; i++){
            Roleuser roleuser;
            for (int x = 0; x < ridList.length; x++){
                roleuser = new Roleuser();
                roleuser.setHuid(Integer.valueOf(huidList[i]));
                roleuser.setRid(Integer.valueOf(ridList[x]));
                roleuserList.add(roleuser);
            }
            integer = roleuserMapper.saveRoleuser(roleuserList);
        }
        return integer==1?ServerResponse.createBySuccess("添加成功"):ServerResponse.createByError("添加失败");
    }

    @Override
    public List<Roleuser> listByHuid(Integer huid) {
        return roleuserMapper.listByHuid(huid);
    }

}