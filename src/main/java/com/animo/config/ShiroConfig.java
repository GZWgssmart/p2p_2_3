//package com.animo.config;
//
//import com.animo.realm.MyRealm;
//import org.apache.shiro.mgt.SecurityManager;
//import org.apache.shiro.realm.Realm;
//import org.apache.shiro.session.mgt.DefaultSessionManager;
//import org.apache.shiro.spring.LifecycleBeanPostProcessor;
//import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
//import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
//import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
//import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.LinkedHashMap;
//import java.util.Map;
//
///**
// * Created by Animo on 2017-12-07.
// * @author Animo
// */
//@Configuration
//public class ShiroConfig {
//
//
//    /**
//     * 设置shiro缓存
//     * @return
//     */
////    @Bean
////    public EhCacheManager ehCacheManager(){
////        EhCacheManager ehCacheManager = new EhCacheManager();
////       // ehCacheManager.setCacheManagerConfigFile("classpath:/config/ehcache.xml");
////        return ehCacheManager;
////    }
//
//    /**
//     * GlobalSessionTimeout 设置session失效的时间
//     * DeleteInvalidSessions 是否删除失效的session
//     * @return
//     */
////    @Bean()
////    public DefaultSessionManager defaultSessionManager(){
////        DefaultSessionManager defaultSessionManager = new DefaultSessionManager();
////        defaultSessionManager.setGlobalSessionTimeout(600000);
////        defaultSessionManager.setDeleteInvalidSessions(true);
////        return defaultSessionManager;
////    }
//
//    /**
//     * SessionManager 设置会话管理器
//     * Realm 设置自定义realm
//     * @return
//     */
////    @Bean()
////    public DefaultWebSecurityManager defaultWebSecurityManager(){
////        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
////        defaultWebSecurityManager.setSessionManager(defaultSessionManager());
////        defaultWebSecurityManager.setRealm(realm());
//////        defaultWebSecurityManager.setCacheManager(ehCacheManager());
////        return defaultWebSecurityManager;
////    }
//
//
//    @Bean
//    public SecurityManager securityManager() {
//        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
//        // 设置realm.
//        securityManager.setRealm(realm());
//        return securityManager;
//    }
//
//    /**
//     * LoginUrl 登录页面
//     * UnauthorizedUrl 未授权页面
//     * ChainDefinitionMapFilters 过滤URL
//     *   1). anon 可以被匿名访问
//     2). authc 必须认证(即登录)后才可能访问的页面.
//     3). logout 登出.
//     4). roles 角色过滤器
//     * @return
//     */
//    @Bean("shiroFilter")
//    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager){
//        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
//
//        // 必须设置 SecurityManager
//        shiroFilterFactoryBean.setSecurityManager(securityManager);
//
//        shiroFilterFactoryBean.setSecurityManager(defaultWebSecurityManager());
//        // 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
//        shiroFilterFactoryBean.setLoginUrl("");
//        // 登录成功后要跳转的链接
//        shiroFilterFactoryBean.setSuccessUrl("");
//        // 未授权界面;
//        shiroFilterFactoryBean.setUnauthorizedUrl("");
//        // 拦截器
//        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
//        // 配置不会被拦截的链接 顺序判断
//        filterChainDefinitionMap.put("/**", "anon");
//        // 配置退出过滤器,其中的具体的退出代码Shiro已经替我们实现了
////        filterChainDefinitionMap.put("/logout", "logout");
//        // <!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
//        filterChainDefinitionMap.put("/admin/data/json/**", "authc");
//        //后台页面需认证后才可访问
//        filterChainDefinitionMap.put("/back/**", "authc");
//        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
//        System.out.println("Shiro拦截器工厂类注入成功");
//        return shiroFilterFactoryBean;
//    }
//
//    /**
//     * 身份认证realm; (这个需要自己写，账号密码校验；权限等)
//     *
//     * @return
//     */
//    public Realm realm(){
//        return new MyRealm();
//    }
//
//    /**
//     * 实现Shiro内部lifecycle函数的bean执行
//     * @return
//     */
//    @Bean()
//    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor(){
//        return new LifecycleBeanPostProcessor();
//    }
//
//    /**
//     * 通过以下两个Bean配置 就可以开启shiro注解
//     * @return
//     */
//    @Bean
//    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator(){
//        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
//        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
//        return defaultAdvisorAutoProxyCreator;
//    }
//
//    @Bean
//    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(){
//        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
//        authorizationAttributeSourceAdvisor.setSecurityManager(defaultWebSecurityManager());
//        return authorizationAttributeSourceAdvisor;
//    }
//
//
//}
