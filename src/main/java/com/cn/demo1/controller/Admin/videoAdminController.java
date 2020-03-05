package com.cn.demo1.controller.Admin;

import com.cn.demo1.domain.Video;
import com.cn.demo1.service.demoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/api/v1/video")
public class videoAdminController {


    @Autowired
    private demoService demoService;
    /**
     * 根据id删除视频
     * @param videoId
     * @return
     */
    @DeleteMapping("del_by_id")
    public  Object delById(@RequestParam(value = "video_id",required = true) int videoId){
        return demoService.delete(videoId);
    }

    /**
     * 根据id更新视频
     * @param video
     * @return
     */
    @PutMapping("update_by_id")
    public  Object update(@RequestBody Video video){
        return demoService.update(video);
    }

    /**
     * 保存视频
     * @param video
     * @return
     */
    @PostMapping("save")
    public  Object save(@RequestBody Video video){
        return demoService.save(video);
    }
}
