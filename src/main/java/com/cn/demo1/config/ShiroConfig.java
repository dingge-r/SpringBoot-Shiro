package com.cn.demo1.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * shiro配置类
 */
@Configuration
public class ShiroConfig {
    /**
     * 创建 ShiroFilterFactoryBean
     */
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("securityManager") DefaultWebSecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean=new ShiroFilterFactoryBean();
        //设置安全管理器
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //添加shiro内置过滤器
        /**
         * shiro内置过滤器，可以实现权限相关的拦截器
         *     常用的过滤器：
         *           anon:无需认证可以访问
         *           authc:必须访问才可以认证
         *           user:如果使用rememberMe的功能可以直接访问
         *           perms:该资源必须得到资源权限才可以访问
         */
        Map<String,String> filterMap=new LinkedHashMap<String,String>();

//        filterMap.put("/test","anon");
//        filterMap.put("/login","anon");

        filterMap.put("/add","authc");
        filterMap.put("/update","authc");
        //授权过滤器
        //注意：当前授权拦截，shiro会自动跳转到未授权页面
        filterMap.put("/add","perms[user:add]");
        filterMap.put("/update","perms[user:update]");

        //修改调整的登录页面
        shiroFilterFactoryBean.setLoginUrl("/toLogin");
        //设置未授权提示页面
        shiroFilterFactoryBean.setUnauthorizedUrl("/noAuth");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterMap);
        return shiroFilterFactoryBean;
    }

    /**
     * 创建 DefaultWebSecurityManager
     */
    @Bean(name="securityManager")
      public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm){
          DefaultWebSecurityManager securityManager=new DefaultWebSecurityManager();
          //关联realm
          securityManager.setRealm(userRealm);
          return  securityManager;
      }

    /**
     * 创建 Realm
     */

    @Bean(name="userRealm")
    public  UserRealm getRealm(){
        return new UserRealm();
    }

    /**
     * 配置 ShiroDialect ,用于thymeleaf与shiro标签配合使用
     */
    @Bean
    public ShiroDialect getShiroDialect(){
        return new ShiroDialect();
    }

}
