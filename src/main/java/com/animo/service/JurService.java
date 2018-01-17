package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Jur;
import com.animo.vo.RoleJurVO;

import java.util.List;

public interface JurService extends BaseService {
    List<Jur> listAll();
    List<RoleJurVO> listByRid(Integer rid);
    ServerResponse insertJurList(String filePath);
}
