package com.animo.dao;

import com.animo.pojo.Rolejur;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RolejurMapper extends BaseMapper{
    int saveRolejur(List<Rolejur> rolejurList);
    int deleteAll();
}