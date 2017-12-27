package com.animo.dao;

import com.animo.pojo.Bz;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BzMapper extends BaseMapper{

    List<Bz> list();

}