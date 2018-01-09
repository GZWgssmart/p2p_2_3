package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Friend;
import com.animo.service.FriendService;
import com.animo.utils.PathUtils;
import com.animo.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ye
 * 描述：合作伙伴相关操作
 */
@RestController
@RequestMapping("/friend/data/json")
public class FriendController {

    @Autowired
    private FriendService friendService;


    @RequestMapping("pager")
    public Pager pagerFriend(Integer page, Integer limit){
        return friendService.listPager(page, limit);
    }

    /**
     * 图片上传
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("upload")
    public Object upload(MultipartFile file, HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        String path = PathUtils.mkUploads();
        try {
            String image = UploadUtil.uploadFile(file,path);
            map.put("code",0);
            map.put("image",image);
        } catch (IOException e) {
            map.put("code",1);
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("save")
    public ServerResponse saveFriend(Friend friend){
        return friendService.save(friend);
    }

    @RequestMapping("update")
    public ServerResponse updateFriend(Friend friend){
        return friendService.update(friend);
    }
}
