package com.animo.utils;

import com.animo.realm.MyRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;

/**
 * 清除缓存，清除所有权限，重新加载权限
 */
public class ShiroAuthorizationUtil {

    public static void clearAuthAndCache() {
        RealmSecurityManager realmSecurityManager = (RealmSecurityManager) SecurityUtils.getSecurityManager();
        MyRealm myRealm = (MyRealm) realmSecurityManager.getRealms().iterator().next();
        myRealm.clearCached();
        myRealm.clearAuthz();
    }

}
