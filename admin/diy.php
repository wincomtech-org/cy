<?php
define('IN_LOTHAR', true);
// define('CMOD', 'diy');
require (dirname(__FILE__) . '/include/init.php');
// 权限判断
$rbac->access_jump('diy',$_USER);

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

// 图片上传
include_once (ROOT_PATH . 'include/upload.class.php');
$images_dir = 'images/diy/'; // 文件上传路径，结尾加斜杠
$thumb_dir = ''; // 缩略图路径（相对于$images_dir） 结尾加斜杠，留空则跟$images_dir相同
$img = new Upload(ROOT_PATH . $images_dir, $thumb_dir); // 实例化类文件
if (!file_exists(ROOT_PATH . $images_dir))
    mkdir(ROOT_PATH . $images_dir, 0777);

// 赋值给模板
$smarty->assign('rec', $rec);
$smarty->assign('cur', 'diy');

/**
 * +----------------------------------------------------------
 * DIY列表
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    // 获取参数
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? $_REQUEST['cat_id'] : 0;
    $keyword = isset($_REQUEST['keyword']) ? trim($_REQUEST['keyword']) : '';

    $smarty->assign('ur_here', $_LANG['diy']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['diy_add'],
            'href' => 'diy.php?rec=add&cat_id='.$cat_id
    ));

    // 筛选条件
    $where = '';
    if ($cat_id) {
        $where = ' WHERE a.cat_id IN ('.$cat_id . $dou->dou_child_id('diy_category',$cat_id).')';
    }
    if ($keyword) {
        $where .= ($where ? ' AND' : 'WHERE') ." a.title LIKE '%$keyword%'";
        $get = '&keyword=' . $keyword;
    }

    // 分页
    $page = $check->is_number($_REQUEST['page']) ? $_REQUEST['page'] : 1;
    $page_url = 'diy.php' . ($cat_id ? '?cat_id=' . $cat_id : '');
    $where2 = str_replace('a.', '', $where);
    $limit = $dou->pager('diy', 15, $page, $page_url, $where2, $get);
    // 查询数据
    $fields = $dou->create_fields_quote('id,title,title2,cat_id,image','a');
    if ($GLOBALS['lang_type']==1) {
        $fields .= ',b.cat_name';
    } else {
        $fields .= ',b.cat_name2';
    }
    $sql = sprintf("SELECT %s from %s a left join %s b on a.cat_id=b.cat_id %s %s %s", $fields,$dou->table('diy'),$dou->table('diy_category'),$where,' ORDER BY a.id DESC',$limit);
    $query = $dou->query($sql);
    while ($row = $dou->fetch_assoc($query)) {
        $row['title'] = $row['title'] ? $row['title'] : $row['title2'];
        $row['cat_name'] = $row['cat_name'] ? $row['cat_name'] : $row['cat_name2'];
        $diy_list[] = $row;
    }
    
    // 赋值给模板
    $smarty->assign('if_sort', $_SESSION['if_sort']);
    $smarty->assign('sort', get_sort_diy());
    $smarty->assign('sort_bg', $sort_bg);
    $smarty->assign('cat_id', $cat_id);
    $smarty->assign('keyword', $keyword);
    $smarty->assign('diy_category', $dou->get_category_nolevel('diy_category'));
    $smarty->assign('diy_list', $diy_list);
    
    $smarty->display('diy.htm');
} 

/**
 * +----------------------------------------------------------
 * DIY添加
 * +----------------------------------------------------------
 */
elseif ($rec == 'add') {
    // 分类ID
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? $_REQUEST['cat_id'] : '';
    
    // 格式化自定义参数，并存到数组$diy，DIY编辑页面中调用DIY详情也是用数组$diy，
    if ($_DEFINED['diy']) {
        $defined = explode(',', $_DEFINED['diy']);
        foreach ($defined as $row) {
            $defined_diy .= $row . "：\n";
        }
        $diy['defined'] = trim($defined_diy);
        $diy['defined_count'] = count(explode("\n", $diy['defined'])) * 2;
    }

    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'insert');
    $smarty->assign('diy_category', $dou->get_category_nolevel('diy_category'));
    $smarty->assign('cat_id', $cat_id);
    $smarty->assign('diy', $diy);

    $smarty->assign('ur_here', $_LANG['diy_add']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['diy'],
            'href' => 'diy.php?cat_id='.$cat_id 
    ));

    $smarty->display('diy.htm');
} 

elseif ($rec == 'insert') {
    // 验证标题
    if (empty($_POST['title'])) $dou->dou_msg($_LANG['diy_name'] . $_LANG['is_empty']);
    if ($dou->get_one("SELECT id from ".$dou->table('diy')." where title='".$_POST['title']."' and cat_id='$_POST[cat_id]'")) {
        $dou->dou_msg('已存在！');
    }
    if ($_POST['cat_id']==4) {
        if (!$check->is_unique_id($_POST['unique_id']))
            $dou->dou_msg($_LANG['unique_id_wrong']);
        if ($dou->value_exist('diy', 'unique_id', $_POST['unique_id']))
            $dou->dou_msg($_LANG['unique_id_existed']);
    }
    // 图片上传
    if ($_FILES['image']['name'] != ''){
        $image_name = $img->upload_image('image', $img->create_file_name('diy'));
        $image = $images_dir . $image_name;
        // $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
    }

    // 数据格式化
    $_POST['defined'] = str_replace("\r\n", ',', $_POST['defined']);
        
    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);

    $data = array(
            'unique_id'  => $_POST['unique_id'],
            'cat_id'  => $_POST['cat_id'],
            'title'  => $_POST['title'],
            'title2'  => $_POST['title2'],
            'content'  => $_POST['content'],
            'image'  => $image,
            'keywords'  => $_POST['keywords'],
            'description'  => $_POST['description'],
            'sort'  => $_POST['sort']
        );
    $dou->insert('diy',$data);
    
    $dou->create_admin_log($_LANG['diy_add'] . ': ' . $_POST['title']);
    $dou->dou_msg($_LANG['diy_add_succes'], 'diy.php');
} 

/**
 * +----------------------------------------------------------
 * DIY编辑
 * +----------------------------------------------------------
 */
elseif ($rec == 'edit') {    
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : '';
    
    $query = $dou->select($dou->table('diy'), '*', '`id`=\''. $id .'\'');
    $diy = $dou->fetch_array($query);
    
    // 格式化自定义参数
    if ($_DEFINED['diy']) {
        $defined = explode(',', $_DEFINED['diy']);
        foreach ($defined as $row) {
            $defined_diy .= $row . "：\n";
        }
        // 如果DIY中已经写入自定义参数则调用已有的
        $diy['defined'] = $diy['defined'] ? str_replace(",", "\n", $diy['defined']) : trim($defined_diy);
        $diy['defined_count'] = count(explode("\n", $diy['defined'])) * 2;
    }
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'update');
    $smarty->assign('diy_category', $dou->get_category_nolevel('diy_category'));
    $smarty->assign('cat_id', $diy['cat_id']);
    $smarty->assign('diy', $diy);

    $smarty->assign('ur_here', $_LANG['diy_edit']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['diy'],
            'href' => 'diy.php?cat_id='.$diy['cat_id']
    ));
    
    $smarty->display('diy.htm');
} 

elseif ($rec == 'update') {
    // 验证并获取合法的ID
    if ($check->is_number($_POST['id'])){
        $id = intval($_POST['id']);
    } else {
        $dou->dou_msg('ID 非法');
    }
    // 验证标题
    if (empty($_POST['title'])) $dou->dou_msg($_LANG['diy_name'] . $_LANG['is_empty']);

    if ($_POST['unique_id']==4) {
        if (!$check->is_unique_id($_POST['unique_id']))
            $dou->dou_msg($_LANG['unique_id_wrong']);
        if ($dou->value_exist('diy', 'unique_id', $_POST['unique_id'], "AND cat_id != '$_POST[cat_id]'"))
            $dou->dou_msg($_LANG['unique_id_existed']);
    }

    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('diy', $id));
        $image = $images_dir . $image_name;
        // $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
    }
    
    // 格式化自定义参数
    $_POST['defined'] = str_replace("\r\n", ',', $_POST['defined']);
    
    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);

    $data = array(
            'unique_id'  => $_POST['unique_id'],
            'cat_id'  => $_POST['cat_id'],
            'title'  => $_POST['title'],
            'title2'  => $_POST['title2'],
            'content'  => $_POST['content'],
            'keywords'  => $_POST['keywords'],
            'description'  => $_POST['description'],
            'sort'  => $_POST['sort']
        );
    if ($image) 
        $data['image'] = $image;
    $dou->update('diy',$data,'id='.$id);

    $dou->create_admin_log($_LANG['diy_edit'] . ': ' . $_POST['title']);
    $dou->dou_msg($_LANG['diy_edit_succes'], 'diy.php');
} 

/**
 * +----------------------------------------------------------
 * 首页产品筛选
 * +----------------------------------------------------------
 */
elseif ($rec == 'sort') {
    $_SESSION['if_sort'] = $_SESSION['if_sort'] ? false : true;
    
    // 跳转到上一页面
    $dou->dou_header($_SERVER['HTTP_REFERER']);
} 

/**
 * +----------------------------------------------------------
 * 设为首页显示产品
 * +----------------------------------------------------------
 */
elseif ($rec == 'set_sort') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'diy.php');
    
    $max_sort = $dou->get_one("SELECT sort FROM " . $dou->table('diy') . " ORDER BY sort DESC");
    $new_sort = $max_sort + 1;
    $dou->query("UPDATE " . $dou->table('diy') . " SET sort = '$new_sort' WHERE id='$id'");
    
    $dou->dou_header($_SERVER['HTTP_REFERER']);
} 

/**
 * +----------------------------------------------------------
 * 取消首页显示产品
 * +----------------------------------------------------------
 */
elseif ($rec == 'del_sort') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'diy.php');
    
    $dou->query("UPDATE " . $dou->table('diy') . " SET sort = '' WHERE id='$id'");
    $dou->dou_header($_SERVER['HTTP_REFERER']);
} 

/**
 * +----------------------------------------------------------
 * DIY删除
 * +----------------------------------------------------------
 */
elseif ($rec == 'del') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'diy.php');
    $title = $dou->get_one("SELECT title FROM " . $dou->table('diy') . " WHERE id='$id'");
    
    if (isset($_POST['confirm']) ? $_POST['confirm'] : '') {
        // 删除相应产品图片
        $image = $dou->get_one("SELECT image FROM " . $dou->table('diy') . " WHERE id='$id'");
        $dou->del_image($image);
        
        $dou->create_admin_log($_LANG['diy_del'] . ': ' . $title);
        $dou->delete($dou->table('diy'), "id = $id", 'diy.php');
    } else {
        $_LANG['del_check'] = preg_replace('/d%/Ums', $title, $_LANG['del_check']);
        $dou->dou_msg($_LANG['del_check'], 'diy.php', '', '30', "diy.php?rec=del&id=$id");
    }
} 

/**
 * +----------------------------------------------------------
 * 批量操作选择
 * +----------------------------------------------------------
 */
elseif ($rec == 'action') {
    if (is_array($_POST['checkbox'])) {
        if ($_POST['action'] == 'del_all') {
            // 批量DIY删除
            $dou->del_all('diy', $_POST['checkbox'], 'id', 'image');
        } elseif ($_POST['action'] == 'category_move') {
            // 批量移动分类
            $dou->category_move('diy', $_POST['checkbox'], $_POST['new_cat_id']);
        } else {
            $dou->dou_msg($_LANG['select_empty']);
        }
    } else {
        $dou->dou_msg($_LANG['diy_select_empty']);
    }
}

/**
 * +----------------------------------------------------------
 * 获取首页显示DIY
 * +----------------------------------------------------------
 */
function get_sort_diy() {
    $limit = $GLOBALS['_DISPLAY']['home_diy'] ? ' LIMIT ' . $GLOBALS['_DISPLAY']['home_diy'] : '';
    $sql = "SELECT id, title FROM " . $GLOBALS['dou']->table('diy') . " WHERE sort > 0 ORDER BY sort DESC" . $limit;
    $query = $GLOBALS['dou']->query($sql);
    while ($row = $GLOBALS['dou']->fetch_array($query)) {
        $sort[] = array(
                "id" => $row['id'],
                "title" => $row['title'] 
        );
    }
    
    return $sort;
}
?>