package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.RewardSetting;
import com.animo.service.RewardSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Administrator on 2018/1/2.
 */
@RestController
@RequestMapping("/rewardset/data/json")
public class RewardSettingController {

    @Autowired
    private RewardSettingService rewardSettingService;

    @GetMapping(value="list")
    public Pager list(int page, int limit) {
        return rewardSettingService.listPager(page-0, limit-1);
    }

    @PostMapping("save")
    public ServerResponse save(RewardSetting rewardSetting){
        return rewardSettingService.save(rewardSetting);
    }

    @PostMapping("update")
    public ServerResponse update(RewardSetting rewardSetting){
        return rewardSettingService.update(rewardSetting);
    }

}
