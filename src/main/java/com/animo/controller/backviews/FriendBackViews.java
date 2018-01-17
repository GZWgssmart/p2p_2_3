package com.animo.controller.backviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ye
 * 描述：后台合作伙伴管理
 */
@Controller
@RequestMapping("/back/friends")
public class FriendBackViews {

    @GetMapping("pagerFriend")
   public String listRoles(){
       return "friend/friends";
   }

   @GetMapping("addFriends")
    public String addFriends(){
       return "friend/addFriends";
   }

//   @GetMapping("updateFriend")
//    public String updateFriend(){
//        return "friend/Friends";
//   }
}
