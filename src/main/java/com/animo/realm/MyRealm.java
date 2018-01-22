package com.animo.realm;

import com.animo.common.CustomToken;
import com.animo.common.EncryptUtils;
import com.animo.common.ServerResponse;
import com.animo.constant.Constant;
import com.animo.pojo.Huser;
import com.animo.pojo.Jur;
import com.animo.pojo.Roleuser;
import com.animo.service.HuserService;
import com.animo.service.JurService;
import com.animo.service.RoleuserService;
import com.animo.vo.RoleJurVO;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Animo on 2017-12-07.
 * @author Animo
 */
@Component
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private HuserService huserService;

    @Autowired
    private RoleuserService roleuserService;

    @Autowired
    private JurService jurService;


    /**
     * 认证(登录时调用)
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("身份认证方法：MyRealm.doGetAuthenticationInfo()");
        CustomToken token = (CustomToken)authenticationToken;
        String code = token.getVerifyCode();
        String codeInsession = token.getCodeInSession();
        String username = (String) token.getPrincipal();
        String password = String.valueOf((char[])token.getCredentials());
        //验证码校验
        if (!code.equalsIgnoreCase(codeInsession)){
           throw new UnknownAccountException("验证码错误");
        }
        Session session = SecurityUtils.getSubject().getSession();
        Huser huser = huserService.getByPhonePwd(username, EncryptUtils.md5(password));
        //账号不存在
        if(huser == null) {
            throw new UnknownAccountException("账号或密码不正确");
        }else {
            session.setAttribute(Constant.SESSION_ADMIN, huser);
            return new SimpleAuthenticationInfo(username,password,"myRealm");
        }
    }

    /**
     * 授权(验证权限时调用)
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        Session session = SecurityUtils.getSubject().getSession();
        Huser huser = (Huser) session.getAttribute(Constant.SESSION_ADMIN);
        //查询用户的角色
//        Set<Integer> roleSet = new HashSet<Integer>();
//        List<Rolejur> rolejurList = new ArrayList<>();
        //查询用户角色对应的权限
        Set<String> permsSet = new HashSet<>();
        List<String> jurlList = new ArrayList<>();
        List<RoleJurVO> roleJurVOList;
        if (huser.getHuid()==0 && huser.getHuname().equalsIgnoreCase("root")){
            List<Jur> jurList = jurService.listAll();
            for (int y = 0; y <jurList.size(); y++){
                jurlList.add(jurList.get(y).getJurl());
            }
        }else{
            //根据用户id查询角色，根据角色查询权限
            List<Roleuser> roleuserList = roleuserService.listByHuid(huser.getHuid());
            for(int i = 1; i<= roleuserList.size(); i++){
                roleJurVOList = new ArrayList<>();
                roleJurVOList = jurService.listByRid(roleuserList.get(i-1).getRid());
                if (roleJurVOList.size()>0){
                    for (int x = 1; x <= roleJurVOList.size(); x++){
                        jurlList.add(roleJurVOList.get(x-1).getJurl());
                    }
                }
            }
        }
        for (String perms : jurlList){
            permsSet.add(perms);
        }
        authorizationInfo.setStringPermissions(permsSet);
        return authorizationInfo;
    }

    // 清除缓存
    public void clearCached() {
        super.clearCache(SecurityUtils.getSubject().getPrincipals());
    }

    //清除所有权限
    public void clearAuthz(){
        super.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
    }

}
