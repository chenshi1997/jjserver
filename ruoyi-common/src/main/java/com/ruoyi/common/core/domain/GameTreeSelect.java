package com.ruoyi.common.core.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysMenu;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Treeselect树结构实体类
 * 
 * @author ruoyi
 */
public class GameTreeSelect implements Serializable
{
    public static String separator="-";

    private static final long serialVersionUID = 1L;

    /** 节点ID */
    private String id;

    /** 节点名称 */
    private String label;

    /** 子节点 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<GameTreeSelect> children;

    public GameTreeSelect()
    {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = String.valueOf(id);
    }

    public void setId(Long id) {
        this.id = String.valueOf(id);
    }

    public GameTreeSelect(SysDept dept)
    {
        this.id = String.valueOf(dept.getDeptId());
        this.label = dept.getDeptName();
        this.children = dept.getChildren().stream().map(GameTreeSelect::new).collect(Collectors.toList());
    }

    public GameTreeSelect(SysMenu menu)
    {
        this.id = String.valueOf(menu.getMenuId());
        this.label = menu.getMenuName();
        this.children = menu.getChildren().stream().map(GameTreeSelect::new).collect(Collectors.toList());
    }

    public GameTreeSelect(SysMenu menu, String gameId)
    {
        this.id = String.valueOf(gameId+separator+menu.getMenuId());
        this.label = menu.getMenuName();
        this.children = menu.getChildren().stream().map(GameTreeSelect::new).collect(Collectors.toList());
    }

    public String getLabel()
    {
        return label;
    }

    public void setLabel(String label)
    {
        this.label = label;
    }

    public List<GameTreeSelect> getChildren()
    {
        return children;
    }

    public void setChildren(List<GameTreeSelect> children)
    {
        this.children = children;
    }
}
