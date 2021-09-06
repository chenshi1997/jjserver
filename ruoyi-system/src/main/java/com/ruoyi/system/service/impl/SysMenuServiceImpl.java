package com.ruoyi.system.service.impl;

import java.awt.*;
import java.util.*;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.core.domain.GameTreeSelect;
import com.ruoyi.common.domain.GameGroup;
import com.ruoyi.common.service.GameGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.vo.MetaVo;
import com.ruoyi.system.domain.vo.RouterVo;
import com.ruoyi.system.mapper.SysMenuMapper;
import com.ruoyi.system.mapper.SysRoleMapper;
import com.ruoyi.system.mapper.SysRoleMenuMapper;
import com.ruoyi.system.service.ISysMenuService;

/**
 * 菜单 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class SysMenuServiceImpl implements ISysMenuService
{
    public static final String PREMISSION_STRING = "perms[\"{0}\"]";

    //系统菜单类型
    public static final int SYSTEM_ROLETYPE = 1;
    //游戏菜单类型
    public static final int GAME_ROLETYPE = 2;


    @Autowired
    private SysMenuMapper menuMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysRoleMenuMapper roleMenuMapper;

    @Autowired
    GameGroupService gameGroupService;

    /**
     * 根据用户查询系统菜单列表
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> selectMenuList(Long userId)
    {
        return selectMenuList(new SysMenu(), userId);
    }

    /**
     * 查询系统菜单列表
     *
     * @param menu 菜单信息
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> selectMenuList(SysMenu menu, Long userId)
    {
        List<SysMenu> menuList = null;
        menu.getParams().put("userId", userId);
        // 管理员显示所有菜单信息
        if (SysUser.isAdmin(userId))
        {
            menuList = menuMapper.selectMenuList(menu);
        }
        else
        {
            menu.getParams().put("userId", userId);
            menuList = menuMapper.selectMenuListByUserId(menu);
        }
        return menuList;
    }


    /**
     * 查询游戏菜单权限信息
     * @param menu
     * @param userId
     * @return
     */
    @Override
    public List<GameTreeSelect> selectGameMenuList(SysMenu menu, Long userId) {
        menu.getParams().put("userId", userId);
        // admin管理员显示所有游戏菜单信息
        ArrayList result=new ArrayList();
        if (SysUser.isAdmin(userId))
        {
            List<GameGroup> gamelist = gameGroupService.list();
            for (GameGroup gameGroup:
                    gamelist) {
                menu.setGameId(gameGroup.getGameId());
                List<SysMenu> menuList = menuMapper.selectGameMenuList(menu);
                //游戏的树结构为区别common类型匹配的具体游戏会在Id前面加上"gameId-"  例如1-101
                List<GameTreeSelect> childrenTree = buildGameMenuTreeSelect(menuList,String.valueOf(gameGroup.getGameId()));
                GameTreeSelect t=new GameTreeSelect();
                t.setId(gameGroup.getId());
                t.setLabel(gameGroup.getGameName());
                t.setChildren(childrenTree);
                result.add(t);
            }
        }
        else
        {
            List<GameGroup> gamelist = gameGroupService.list();
            menu.getParams().put("userId", userId);
            List<SysRole> sysRoles = roleMapper.selectRolePermissionByUserId(userId);
            List<Object> gameMenuIds=new ArrayList<>();
            //拥有哪些游戏权限
            List<Integer> gameIds = new ArrayList<Integer>();
            //key为游戏类型，list为此游戏类型所具有权限的所有菜单Id
            HashMap<Integer,List<Long>> gameIdmap=new HashMap<>();
            for (SysRole sysRole:
                    sysRoles) {
                String gamemenu=sysRole.getGameMenus();
                gameMenuIds.addAll(JSONArray.parseArray(gamemenu));
            }
            for (Object o:
                    gameMenuIds) {
                String gameMenuId=String.valueOf(o);
                int index=gameMenuId.indexOf(GameTreeSelect.separator);
                if(index==-1){
                    gameIds.add(Integer.valueOf(gameMenuId));
                }else{
                    //菜单权限
                    String[] strArr = gameMenuId.split(GameTreeSelect.separator);
                    Integer gameIdkey=Integer.valueOf(strArr[0]);
                    Long menuId=Long.valueOf(strArr[1]);
                    if(!gameIdmap.containsKey(gameIdkey)){
                        ArrayList<Long> l=new ArrayList<Long>();
                        l.add(menuId);
                        gameIdmap.put(gameIdkey,l);
                    }else{
                        gameIdmap.get(gameIdkey).add(menuId);
                    }
                }
            }
            //开始查询具体菜单信息
            for (GameGroup gameGroup:
               gamelist) {
                for (Integer gameId:
                gameIds) {
                    if(gameGroup.getGameId()==gameId){
                        List<Long> menuIds = gameIdmap.get(gameId);
                        List<SysMenu> menuList = new ArrayList<>();
                        for (Long menuId:
                             menuIds) {
                            SysMenu m = menuMapper.selectMenuById(menuId);
                            menuList.add(m);
                        }
                        List<GameTreeSelect> childrenTree = buildGameMenuTreeSelect(menuList,String.valueOf(gameGroup.getGameId()));
                        GameTreeSelect t=new GameTreeSelect();
                        t.setId(gameGroup.getId());
                        t.setLabel(gameGroup.getGameName());
                        t.setChildren(childrenTree);
                        result.add(t);
                        break;
                    }
                }
            }

        }
        return result;
    }

    @Override
    public List<String> selectGameMenuListRoleId(Long roleId) {
        SysRole sysRole = roleMapper.selectRoleById(roleId);
        JSONArray jsonArray=JSONArray.parseArray(sysRole.getGameMenus());
        return jsonArray.toJavaList(String.class);
    }

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectMenuPermsByUserId(Long userId)
    {
        List<String> perms = menuMapper.selectMenuPermsByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms)
        {
            if (StringUtils.isNotEmpty(perm))
            {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    @Override
    public Map<String,List> selectMenuTree(Map map) {
        HashMap<String,List> result =new HashMap<>();
        List<SysMenu> menus = new ArrayList<>();
        Integer roleType = Integer.valueOf((String) map.get("roleType")); 
        long userId = (long) map.get("userId");
        if (SecurityUtils.isAdmin(userId))
        {
            //admin账户菜单
            menus = menuMapper.selectMenuTreeAll();
            result.put("menus",getChildPerms(menus, 0));
            return result;
        }
        else
        {
            if(roleType==SYSTEM_ROLETYPE){
                //管理员菜单
                menus = menuMapper.selectMenuTree(map);
                result.put("menus",getChildPerms(menus, 0));
                return result;
            }else{
                //游戏菜单
                List<SysRole> sysRoles = roleMapper.selectRolePermissionByUserId(userId);
                List<Object> list=new ArrayList<>();
                for (SysRole sysRole:
                     sysRoles) {
                    String gamemenu=sysRole.getGameMenus();
                    list.addAll(JSONArray.parseArray(gamemenu));
                }
                List<Object> gameMenuIds = list.stream().distinct().collect(Collectors.toList());
                //拥有哪些游戏权限
                List<Integer> gameIds = new ArrayList<Integer>();
                for (Object o:
                        gameMenuIds) {
                    String gameMenuId=String.valueOf(o);
                    int index=gameMenuId.indexOf(GameTreeSelect.separator);
                    if(index==-1){
                        gameIds.add(Integer.valueOf(gameMenuId));
                    }else{
                        //菜单权限
                        String mennId=gameMenuId.substring(index+1,gameMenuId.length());
                        SysMenu menu = menuMapper.selectMenuById(Long.valueOf(mennId));
                        menus.add(menu);
                    }
                }
                //由于isCommon为1的菜单可能会存在多个且相同的，需要通过menuId去重
                List<SysMenu> distinct = menus.stream()
                        .collect(Collectors.collectingAndThen(
                                Collectors.toCollection(() -> new TreeSet<SysMenu>  (Comparator.comparing(m -> m.getMenuId()))),
                                ArrayList::new));
                result.put("menus",getChildPerms(distinct, 0));
                result.put("gameIds",gameIds);
                result.put("gameMenuIds",gameMenuIds);
                return result;
            }

        }
    }

    /**
     * 根据角色ID查询菜单树信息
     *
     * @param roleId 角色ID
     * @return 选中菜单列表
     */
    @Override
    public List<Integer> selectMenuListByRoleId(Long roleId)
    {
        SysRole role = roleMapper.selectRoleById(roleId);
        return menuMapper.selectMenuListByRoleId(roleId, role.isMenuCheckStrictly());
    }

    /**
     * 构建前端路由所需要的菜单
     *
     * @param menus 菜单列表
     * @return 路由列表
     */
    @Override
    public List<RouterVo> buildMenus(List<SysMenu> menus)
    {
        List<RouterVo> routers = new LinkedList<RouterVo>();
        for (SysMenu menu : menus)
        {
            RouterVo router = new RouterVo();
            router.setHidden("1".equals(menu.getVisible()));
            router.setName(getRouteName(menu));
            router.setPath(getRouterPath(menu));
            router.setGameId(menu.getGameId());
            router.setIsCommon(menu.getIsCommon());
            router.setMenuId(menu.getMenuId());
            router.setComponent(getComponent(menu));
            router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), StringUtils.equals("1", menu.getIsCache()), menu.getPath()));
            List<SysMenu> cMenus = menu.getChildren();
            if (!cMenus.isEmpty() && cMenus.size() > 0 && UserConstants.TYPE_DIR.equals(menu.getMenuType()))
            {
                router.setAlwaysShow(true);
                router.setRedirect("noRedirect");
                router.setChildren(buildMenus(cMenus));
            }
            else if (isMenuFrame(menu))
            {
                router.setMeta(null);
                List<RouterVo> childrenList = new ArrayList<RouterVo>();
                RouterVo children = new RouterVo();
                children.setPath(menu.getPath());
                children.setComponent(menu.getComponent());
                children.setName(StringUtils.capitalize(menu.getPath()));
                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), StringUtils.equals("1", menu.getIsCache()), menu.getPath()));
                childrenList.add(children);
                router.setChildren(childrenList);
            }
            else if (menu.getParentId().intValue() == 0 && isInnerLink(menu))
            {
                router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon()));
                router.setPath("/inner");
                List<RouterVo> childrenList = new ArrayList<RouterVo>();
                RouterVo children = new RouterVo();
                String routerPath = StringUtils.replaceEach(menu.getPath(), new String[] { Constants.HTTP, Constants.HTTPS }, new String[] { "", "" });
                children.setPath(routerPath);
                children.setComponent(UserConstants.INNER_LINK);
                children.setName(StringUtils.capitalize(routerPath));
                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), menu.getPath()));
                childrenList.add(children);
                router.setChildren(childrenList);
            }
            routers.add(router);
        }
        return routers;
    }

    /**
     * 构建前端所需要树结构
     *
     * @param menus 菜单列表
     * @return 树结构列表
     */
    @Override
    public List<SysMenu> buildMenuTree(List<SysMenu> menus)
    {
        List<SysMenu> returnList = new ArrayList<SysMenu>();
        List<Long> tempList = new ArrayList<Long>();
        for (SysMenu dept : menus)
        {
            tempList.add(dept.getMenuId());
        }
        for (Iterator<SysMenu> iterator = menus.iterator(); iterator.hasNext();)
        {
            SysMenu menu = (SysMenu) iterator.next();
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(menu.getParentId()))
            {
                recursionFn(menus, menu);
                returnList.add(menu);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = menus;
        }
        return returnList;
    }


    /**
     * 构建前端所需要下拉树结构
     *
     * @param menus 菜单列表
     * @return 下拉树结构列表
     */
    @Override
    public List<TreeSelect> buildMenuTreeSelect(List<SysMenu> menus)
    {
        List<SysMenu> menuTrees = buildMenuTree(menus);
        return menuTrees.stream().map(TreeSelect::new).collect(Collectors.toList());
    }


    public List<GameTreeSelect> buildGameMenuTreeSelect(List<SysMenu> menus,String gameId)
    {
        List<SysMenu> menuTrees = buildMenuTree(menus);
//        List<GameTreeSelect> list=menuTrees.stream().map(GameTreeSelect::new).collect(Collectors.toList());
        List<GameTreeSelect> list=menuTrees.stream().map(r -> new GameTreeSelect(r,gameId)).collect(Collectors.toList());
        for (GameTreeSelect g:
             list) {
            hasChild(g,gameId);
        }
        return list;
    }

    public void hasChild(GameTreeSelect gameTreeSelect,String gameId){
        for (GameTreeSelect g:gameTreeSelect.getChildren()){
            g.setId(gameId+GameTreeSelect.separator+g.getId());
            if(g.getChildren().size()>0){
                hasChild(g,gameId);
            }
        }
    };

    /**
     * 根据菜单ID查询信息
     *
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    @Override
    public SysMenu selectMenuById(Long menuId)
    {
        return menuMapper.selectMenuById(menuId);
    }

    /**
     * 是否存在菜单子节点
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public boolean hasChildByMenuId(Long menuId)
    {
        int result = menuMapper.hasChildByMenuId(menuId);
        return result > 0 ? true : false;
    }

    /**
     * 查询菜单使用数量
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public boolean checkMenuExistRole(Long menuId)
    {
        int result = roleMenuMapper.checkMenuExistRole(menuId);
        return result > 0 ? true : false;
    }

    /**
     * 新增保存菜单信息
     *
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public int insertMenu(SysMenu menu)
    {
        return menuMapper.insertMenu(menu);
    }

    /**
     * 修改保存菜单信息
     *
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public int updateMenu(SysMenu menu)
    {
        return menuMapper.updateMenu(menu);
    }

    /**
     * 删除菜单管理信息
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public int deleteMenuById(Long menuId)
    {
        return menuMapper.deleteMenuById(menuId);
    }

    /**
     * 校验菜单名称是否唯一
     *
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public String checkMenuNameUnique(SysMenu menu)
    {
        Long menuId = StringUtils.isNull(menu.getMenuId()) ? -1L : menu.getMenuId();
        SysMenu info = menuMapper.checkMenuNameUnique(menu.getMenuName(), menu.getParentId());
        if (StringUtils.isNotNull(info) && info.getMenuId().longValue() != menuId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }



    /**
     * 获取路由名称
     *
     * @param menu 菜单信息
     * @return 路由名称
     */
    public String getRouteName(SysMenu menu)
    {
        String routerName = StringUtils.capitalize(menu.getPath());
        // 非外链并且是一级目录（类型为目录）
        if (isMenuFrame(menu))
        {
            routerName = StringUtils.EMPTY;
        }
        return routerName;
    }

    /**
     * 获取路由地址
     *
     * @param menu 菜单信息
     * @return 路由地址
     */
    public String getRouterPath(SysMenu menu)
    {
        String routerPath = menu.getPath();
        // 内链打开外网方式
        if (menu.getParentId().intValue() != 0 && isInnerLink(menu))
        {
            routerPath = StringUtils.replaceEach(routerPath, new String[] { Constants.HTTP, Constants.HTTPS }, new String[] { "", "" });
        }
        // 非外链并且是一级目录（类型为目录）
        if (0 == menu.getParentId().intValue() && UserConstants.TYPE_DIR.equals(menu.getMenuType())
                && UserConstants.NO_FRAME.equals(menu.getIsFrame()))
        {
            routerPath = "/" + menu.getPath();
        }
        // 非外链并且是一级目录（类型为菜单）
        else if (isMenuFrame(menu))
        {
            routerPath = "/";
        }
        return routerPath;
    }

    /**
     * 获取组件信息
     *
     * @param menu 菜单信息
     * @return 组件信息
     */
    public String getComponent(SysMenu menu)
    {
        String component = UserConstants.LAYOUT;
        if (StringUtils.isNotEmpty(menu.getComponent()) && !isMenuFrame(menu))
        {
            component = menu.getComponent();
        }
        else if (StringUtils.isEmpty(menu.getComponent()) && menu.getParentId().intValue() != 0 && isInnerLink(menu))
        {
            component = UserConstants.INNER_LINK;
        }
        else if (StringUtils.isEmpty(menu.getComponent()) && isParentView(menu))
        {
            component = UserConstants.PARENT_VIEW;
        }
        return component;
    }

    /**
     * 是否为菜单内部跳转
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isMenuFrame(SysMenu menu)
    {
        return menu.getParentId().intValue() == 0 && UserConstants.TYPE_MENU.equals(menu.getMenuType())
                && menu.getIsFrame().equals(UserConstants.NO_FRAME);
    }

    /**
     * 是否为内链组件
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isInnerLink(SysMenu menu)
    {
        return menu.getIsFrame().equals(UserConstants.NO_FRAME) && StringUtils.ishttp(menu.getPath());
    }

    /**
     * 是否为parent_view组件
     *
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isParentView(SysMenu menu)
    {
        return menu.getParentId().intValue() != 0 && UserConstants.TYPE_DIR.equals(menu.getMenuType());
    }

    /**
     * 根据父节点的ID获取所有子节点
     *
     * @param list 分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public List<SysMenu> getChildPerms(List<SysMenu> list, int parentId)
    {
        List<SysMenu> returnList = new ArrayList<SysMenu>();
        for (Iterator<SysMenu> iterator = list.iterator(); iterator.hasNext();)
        {
            SysMenu t = (SysMenu) iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId)
            {
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    /**
     * 递归列表
     *
     * @param list
     * @param t
     */
    private void recursionFn(List<SysMenu> list, SysMenu t)
    {
        // 得到子节点列表
        List<SysMenu> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysMenu tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<SysMenu> getChildList(List<SysMenu> list, SysMenu t)
    {
        List<SysMenu> tlist = new ArrayList<SysMenu>();
        Iterator<SysMenu> it = list.iterator();
        while (it.hasNext())
        {
            SysMenu n = (SysMenu) it.next();
            if (n.getParentId().longValue() == t.getMenuId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysMenu> list, SysMenu t)
    {
        return getChildList(list, t).size() > 0 ? true : false;
    }
}
