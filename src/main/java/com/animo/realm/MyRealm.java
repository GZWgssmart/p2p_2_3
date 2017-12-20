package com.animo.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * Created by Animo on 2017-12-07.
 * @author Animo
 */
public class MyRealm extends AuthorizingRealm {

    /**
     * 授权(验证权限时调用)
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
//        User user  = (User)principalCollection.getPrimaryPrincipal();
//        Long id  = user.getId();
//        List<String> permsList = null;
//        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        //如果id等于总管理员的id  就赋予所有权限
//        if(id==1){
//            //赋予所有权限
//            authorizationInfo.addStringPermissions(permsList);
//        }else{
//            //查询当前用户的权限
//            authorizationInfo.addStringPermissions(permsList);
//        }
        return null;
    }

    /**
     * 认证(登录时调用)
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        return null;
    }

    /**
     * 自动加密密码
     * @param credentialsMatcher
     */
//    @Override
//    public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher){
//        HashedCredentialsMatcher shaCredentialsMatcher = new HashedCredentialsMatcher();
//        shaCredentialsMatcher.setHashAlgorithmName(ShiroUtils.HASH_ALGORITHM_NAME);
//        shaCredentialsMatcher.setHashIterations(ShiroUtils.HASHITERATIONS);
//        super.setCredentialsMatcher(shaCredentialsMatcher);
//    }


}
