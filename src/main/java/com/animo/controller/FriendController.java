package com.animo.controller;

import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.pojo.Friend;
import com.animo.service.FriendService;
import com.animo.utils.PathUtils;
import com.animo.utils.UploadUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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

    /**
     * 删除合作伙伴
     * @param friend
     * @return
     */
    @RequestMapping("delete")
//    @RequiresPermissions("friend:delete")
    public ServerResponse deleteById(Friend friend){
        return friendService.removeById(friend.getFid());
    }

    /**
     * 合作伙伴分页查看
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("pager")
//    @RequiresPermissions("friend:pager")
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

    /**
     * 添加合作伙伴
     * @param friend
     * @return
     */
    @RequestMapping("save")
//    @RequiresPermissions("friend:save")
    public ServerResponse saveFriend(Friend friend){
        return friendService.save(friend);
    }

    /**
     * 修改合作伙伴
     * @param friend
     * @return
     */
    @RequestMapping("update")
//    @RequiresPermissions("friend:update")
    public ServerResponse updateFriend(Friend friend){
        return friendService.update(friend);
    }

    /**
     * Animo
     * @return
     */
    @GetMapping("list")
    public ServerResponse list(){
        return friendService.list();
    }
}
