package com.cn.demo1.utils;

import com.cn.demo1.domain.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

/**
 * JWT工具类
 */
public class JwtUtils {

    public static final  String SUBJECT ="xdclass";

    public  static final long EXPIRE=1000*60*60*24*7;//过期时间，毫秒，一周

    public static final String APPSECRET="xd666";  //秘钥

    /**
     * 生成 Jwt
     * @param user
     * @return
     */
    public static String geneJsonWebToken(User user){

        if(user==null||user.getId()==null||user.getName()==null||user.getPassword()==null){
            return null;
        }
        String token = Jwts.builder().setSubject(SUBJECT)
                .claim("id",user.getId())
                .claim("name",user.getName())
                .claim("img",user.getPassword())
                .setIssuedAt(new Date())   //SetIsuseAt发行时间
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRE))  //setExpiration:过期时间，
                .signWith(SignatureAlgorithm.HS256,APPSECRET).compact(); //signWith里面定义算法和密钥，最后compact使字符串紧密一下

        return token;  //最终返回的是一个字符串
    }

    /**
     * 校验 token
     * @param token
     * @return
     */
    public static Claims checkJWT(String token){
         try {
             final Claims claims=Jwts.parser().setSigningKey(APPSECRET).parseClaimsJws(token).getBody();
             return claims;

         }catch (Exception e){}
         return null;
    }
}
