<?php
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
// 权限判断
$rbac->access_jump('apply',$_USER);

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

// 图片上传
include_once (ROOT_PATH . 'include/upload.class.php');
$images_dir = 'images/apply/'; // 文件上传路径，结尾加斜杠
$thumb_dir = ''; // 缩略图路径（相对于$images_dir） 结尾加斜杠，留空则跟$images_dir相同
$img = new Upload(ROOT_PATH . $images_dir, $thumb_dir); // 实例化类文件
if (!file_exists(ROOT_PATH . $images_dir))
    mkdir(ROOT_PATH . $images_dir, 0777);
$_CFG['thumb_width'] = 374;$_CFG['thumb_height'] = 374;

// 赋值给模板
$smarty->assign('rec', $rec);
$smarty->assign('cur', 'apply');

/**
 * +----------------------------------------------------------
 * 应用列表
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    $smarty->assign('ur_here', $_LANG['apply']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['apply_add'],
            'href' => 'apply.php?rec=add' 
    ));
    
    // 获取参数
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? $_REQUEST['cat_id'] : 0;
    $keyword = isset($_REQUEST['keyword']) ? trim($_REQUEST['keyword']) : '';
    
    // 筛选条件
    if ($cat_id) {
        $where = ' WHERE a.cat_id IN ('.$cat_id . $dou->dou_child_id('apply_category',$cat_id).')';
    }
    $where = $where ? $where : 'WHERE a.lang_id='.intval($GLOBALS['lang_type']);
    if ($keyword) {
        $where .= " AND a.title LIKE '%$keyword%'";
        $get = '&keyword=' . $keyword;
    }
    
    // 分页
    $page = $check->is_number($_REQUEST['page']) ? $_REQUEST['page'] : 1;
    $page_url = 'apply.php' . ($cat_id ? '?cat_id=' . $cat_id : '');
    $where2 = str_replace('a.', '', $where);
    $limit = $dou->pager('apply', 15, $page, $page_url, $where2, $get);
    // 查询数据
    $fields = $dou->create_fields_quote('id,title,cat_id,image,add_time','a');
    $sql = sprintf("SELECT %s,b.cat_name from %s a left join %s b on a.cat_id=b.cat_id %s %s %s", $fields,$dou->table('apply'),$dou->table('apply_category'),$where,' ORDER BY a.id DESC',$limit);
    $query = $dou->query($sql);
    while ($row = $dou->fetch_array($query)) {
        $row['add_time'] = date("Y-m-d", $row['add_time']);
        $apply_list[] = $row;
    }
    
    // 首页显示应用数量限制框
    for($i=1; $i<=$_CFG['home_display_apply']; $i++) {
        $sort_bg .= "<li><em></em></li>";
    }
    
    // 赋值给模板
    $smarty->assign('if_sort', $_SESSION['if_sort']);
    $smarty->assign('sort', get_sort_apply());
    $smarty->assign('sort_bg', $sort_bg);
    $smarty->assign('cat_id', $cat_id);
    $smarty->assign('keyword', $keyword);
    $smarty->assign('apply_category', $dou->get_category_nolevel('apply_category'));
    $smarty->assign('apply_list', $apply_list);
    
    $smarty->display('apply.htm');
} 

/**
 * +----------------------------------------------------------
 * 应用添加
 * +----------------------------------------------------------
 */
elseif ($rec == 'add') {
    $smarty->assign('ur_here', $_LANG['apply_add']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['apply'],
            'href' => 'apply.php' 
    ));
    
    // 格式化自定义参数，并存到数组$apply，应用编辑页面中调用应用详情也是用数组$apply，
    if ($_DEFINED['apply']) {
        $defined = explode(',', $_DEFINED['apply']);
        foreach ($defined as $row) {
            $defined_apply .= $row . "：\n";
        }
        $apply['defined'] = trim($defined_apply);
        $apply['defined_count'] = count(explode("\n", $apply['defined'])) * 2;
    }
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'insert');
    $smarty->assign('apply_category', $dou->get_category_nolevel('apply_category'));
    $smarty->assign('apply', $apply);
    
    $smarty->display('apply.htm');
} 

elseif ($rec == 'insert') {
    // 验证标题
    if (empty($_POST['title'])) $dou->dou_msg($_LANG['apply_name'] . $_LANG['is_empty']);
    
    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('apply'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
    }
    
    // 数据格式化
    $add_time = time();
    $_POST['defined'] = $_POST['defined']?str_replace("\r\n", ',', $_POST['defined']):'';
        
    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);

    $data = array(
            'cat_id'        => $_POST['cat_id'],
            'lang_id'       => intval($GLOBALS['lang_type']),
            'title'         => $_POST['title'],
            'defined'       => $_POST['defined'],
            'content'       => $_POST['content'],
            'image'         => $image,
            'link'          => $_POST['link'],
            'keywords'      => $_POST['keywords'],
            'description'   => $_POST['description'],
            'add_time'      => $add_time,
        );
    $dou->insert('apply',$data);
    
    $dou->create_admin_log($_LANG['apply_add'] . ': ' . $_POST['title']);
    $dou->dou_msg($_LANG['apply_add_succes'], 'apply.php');
} 

/**
 * +----------------------------------------------------------
 * 应用编辑
 * +----------------------------------------------------------
 */
elseif ($rec == 'edit') {
    $smarty->assign('ur_here', $_LANG['apply_edit']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['apply'],
            'href' => 'apply.php' 
    ));
    
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : '';
    
    $query = $dou->select($dou->table('apply'), '*', '`id`=\''. $id .'\'');
    $apply = $dou->fetch_array($query);
    
    // 格式化自定义参数
    if ($_DEFINED['apply']) {
        $defined = explode(',', $_DEFINED['apply']);
        foreach ($defined as $row) {
            $defined_apply .= $row . "：\n";
        }
        // 如果应用中已经写入自定义参数则调用已有的
        $apply['defined'] = $apply['defined'] ? str_replace(",", "\n", $apply['defined']) : trim($defined_apply);
        $apply['defined_count'] = count(explode("\n", $apply['defined'])) * 2;
    }
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'update');
    $smarty->assign('apply_category', $dou->get_category_nolevel('apply_category'));
    $smarty->assign('apply', $apply);
    
    $smarty->display('apply.htm');
} 

elseif ($rec == 'update') {
    // 验证标题
    if (empty($_POST['title'])) $dou->dou_msg($_LANG['apply_name'] . $_LANG['is_empty']);
        
    // 图片上传
    if ($_FILES['image']['name'] != ''){
        $image_name = $img->upload_image('image', $img->create_file_name('apply', $_POST['id']));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
    }

    // 格式化自定义参数
    $_POST['defined'] = $_POST['defined']?str_replace("\r\n", ',', $_POST['defined']):'';
    
    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);
    
    $data = array(
            'cat_id'        => $_POST['cat_id'],
            'title'         => $_POST['title'],
            'defined'       => $_POST['defined'],
            'content'       => $_POST['content'],
            'link'          => $_POST['link'],
            'keywords'      => $_POST['keywords'],
            'description'   => $_POST['description'],
        );
    if ($image) 
        $data['image'] = $image;
    $dou->update('apply',$data,'id='.$_POST['id']);
    
    $dou->create_admin_log($_LANG['apply_edit'] . ': ' . $_POST['title']);
    $dou->dou_msg($_LANG['apply_edit_succes'], 'apply.php');
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
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'apply.php');
    
    $max_sort = $dou->get_one("SELECT sort FROM " . $dou->table('apply') . " ORDER BY sort DESC");
    $new_sort = $max_sort + 1;
    $dou->query("UPDATE " . $dou->table('apply') . " SET sort = '$new_sort' WHERE id='$id'");
    
    $dou->dou_header($_SERVER['HTTP_REFERER']);
} 

/**
 * +----------------------------------------------------------
 * 取消首页显示产品
 * +----------------------------------------------------------
 */
elseif ($rec == 'del_sort') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'apply.php');
    
    $dou->query("UPDATE " . $dou->table('apply') . " SET sort = '' WHERE id='$id'");
    $dou->dou_header($_SERVER['HTTP_REFERER']);
} 

/**
 * +----------------------------------------------------------
 * 应用删除
 * +----------------------------------------------------------
 */
elseif ($rec == 'del') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'apply.php');
    $title = $dou->get_one("SELECT title FROM " . $dou->table('apply') . " WHERE id='$id'");
    
    if (isset($_POST['confirm']) ? $_POST['confirm'] : '') {
        // 删除相应产品图片
        $image = $dou->get_one("SELECT image FROM " . $dou->table('apply') . " WHERE id='$id'");
        $dou->del_image($image);
        
        $dou->create_admin_log($_LANG['apply_del'] . ': ' . $title);
        $dou->delete($dou->table('apply'), "id = $id", 'apply.php');
    } else {
        $_LANG['del_check'] = preg_replace('/d%/Ums', $title, $_LANG['del_check']);
        $dou->dou_msg($_LANG['del_check'], 'apply.php', '', '30', "apply.php?rec=del&id=$id");
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
            // 批量应用删除
            $dou->del_all('apply', $_POST['checkbox'], 'id', 'image');
        } elseif ($_POST['action'] == 'category_move') {
            // 批量移动分类
            $dou->category_move('apply', $_POST['checkbox'], $_POST['new_cat_id']);
        } else {
            $dou->dou_msg($_LANG['select_empty']);
        }
    } else {
        $dou->dou_msg($_LANG['apply_select_empty']);
    }
}

/**
 * +----------------------------------------------------------
 * 获取首页显示应用
 * +----------------------------------------------------------
 */
function get_sort_apply() {
    $limit = $GLOBALS['_DISPLAY']['home_apply'] ? ' LIMIT ' . $GLOBALS['_DISPLAY']['home_apply'] : '';
    $sql = "SELECT id, title FROM " . $GLOBALS['dou']->table('apply') . " WHERE sort > 0 ORDER BY sort DESC" . $limit;
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