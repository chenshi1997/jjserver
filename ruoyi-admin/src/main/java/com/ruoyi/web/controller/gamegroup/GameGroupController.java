package com.ruoyi.web.controller.gamegroup;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.web.domain.GameGroup;
import com.ruoyi.web.service.GameGroupService;
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
