package com.animo.service;

import com.animo.common.ServerResponse;
import com.animo.pojo.Jklx;

/**
 * Created by Animo on 2017-12-22.
 */
public interface JklxService {

    ServerResponse<String> save(Jklx jklx);

}
