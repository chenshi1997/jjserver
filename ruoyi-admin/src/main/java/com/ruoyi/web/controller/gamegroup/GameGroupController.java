package com.ruoyi.web.controller.gamegroup;

import com.ruoyi.common.domain.GameGroup;
import com.ruoyi.common.service.GameGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author chenshi
 * @date 2021/8/27
 */
@RestController
@RequestMapping("/gamegroup")
public class GameGroupController {
    @Autowired
    GameGroupService gameGroupService;
    @GetMapping("getAllGameGroup")
    public List getAllGameGroup()
    {
        List<GameGroup> list = gameGroupService.list();
        return list;
    }
}
