package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Rolejur;

import java.util.List;

public interface RoleJurService extends BaseService{
    int saveRolejur(List<Rolejur> rolejurList);
}