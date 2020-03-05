package com.cn.demo1.service;

import com.cn.demo1.domain.Video;
import com.cn.demo1.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 视频业务类接口
 */
@Service
public class demoService {
    @Autowired
    private VideoMapper videoMapper;

    public  List<Video> findAll(){
        return videoMapper.selectAll();
    }

    public Video findById(int id){
          return videoMapper.selectByPrimaryKey(id);
    }

    public  int update(Video video){
        return  videoMapper.updateByPrimaryKey(video);
    }

     public int delete(int id){
        return  videoMapper.deleteByPrimaryKey(id);
     }

     public int save(Video video){
        return videoMapper.insert(video);
     }

}
