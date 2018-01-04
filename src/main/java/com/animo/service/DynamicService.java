package com.animo.service;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Dynamic;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Administrator on 2017/12/25.
 */
public interface DynamicService extends BaseService {
    ServerResponse save(Dynamic dynamic, MultipartFile file);

    Pager listPagers(Integer pageNumber, Integer pageSize);
}
