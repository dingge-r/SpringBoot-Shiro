package com.cn.demo1.config;

import com.cn.demo1.domain.User;
import com.cn.demo1.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 自定义Realm
 */
public class UserRealm extends AuthorizingRealm {
    /**
     * 执行授权逻辑
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("执行授权逻辑");

        //给资源进行授权
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        //添加资源的授权字符串
//        info.addStringPermission("user:add");

        //到数据库查询当前登录的授权字符串
        //获取当前登录用户
        Subject subject= SecurityUtils.getSubject();
        User user=(User)subject.getPrincipal();

        User dbUser=userService.findById(user.getId());
        info.addStringPermission(dbUser.getPerms());

        return info;
    }

    @Autowired
    private UserService userService;

    /**
     * 执行认证逻辑
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("执行认证逻辑");

        //假设数据库的用户名和密码
        //        String name="admin";
        //        String password="admin";

        //编写 shiro判断逻辑，判断用户名和密码
        //1.判断用户名
        UsernamePasswordToken token=(UsernamePasswordToken)authenticationToken;

        User user=userService.findByName(token.getUsername());
        System.out.println(user);

        if(user==null){
            //用户名不存在
            return null;   //shiro底层会抛出UnknownAccountException
        }
        //判断密码
        return new SimpleAuthenticationInfo(user,user.getPassword(),"");
    }
}
