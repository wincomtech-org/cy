<?php
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
// 权限判断
$rbac->access_jump('article',$_USER);

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

// 图片上传
include_once (ROOT_PATH . 'include/upload.class.php');
$images_dir = 'images/article_category/'; // 文件上传路径，结尾加斜杠
$thumb_dir = ''; // 缩略图路径（相对于$images_dir） 结尾加斜杠，留空则跟$images_dir相同
$img = new Upload(ROOT_PATH . $images_dir, $thumb_dir); // 实例化类文件
if (!file_exists(ROOT_PATH . $images_dir)) {
    mkdir(ROOT_PATH . $images_dir, 0777);
}

// 赋值给模板
$smarty->assign('rec', $rec);
$smarty->assign('cur', 'article_category');

if (in_array($rec,array('default','add','edit'))) {
    // 允许指定模板
    $allow_tpl_name = array('默认','新闻','服务中心');
    $allow_tpl_tpl = array('article_category.dwt','news.html','serviceCenter.html');
    foreach ($allow_tpl_name as $key => $value) {
        $allow_tpl[$key]['name'] = $allow_tpl_name[$key];
        $allow_tpl[$key]['tpl'] = $allow_tpl_tpl[$key];
    }
    $smarty->assign('allow_tpl',$allow_tpl);
}

/**
 * +----------------------------------------------------------
 * 分类列表
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    $smarty->assign('ur_here', $_LANG['article_category']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['article_category_add'],
            'href' => 'article_category.php?rec=add' 
    ));
    
    // 赋值给模板
    $smarty->assign('article_category', $dou->get_category_nolevel('article_category'));
    
    $smarty->display('article_category.htm');
} 

/**
 * +----------------------------------------------------------
 * 分类添加
 * +----------------------------------------------------------
 */
elseif ($rec == 'add') {
    $smarty->assign('ur_here', $_LANG['article_category_add']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['article_category'],
            'href' => 'article_category.php' 
    ));
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'insert');
    $smarty->assign('article_category', $dou->get_category_nolevel('article_category'));
    
    $smarty->display('article_category.htm');
} 

elseif ($rec == 'insert') {
    if (empty($_POST['cat_name']))
        $dou->dou_msg($_LANG['article_category_name'] . $_LANG['is_empty']);

    if (!$check->is_unique_id($_POST['unique_id']))
        $dou->dou_msg($_LANG['unique_id_wrong']);

    if ($dou->value_exist('article_category', 'unique_id', $_POST['unique_id']))
        $dou->dou_msg($_LANG['unique_id_existed']);

    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('article_category'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
    }

    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);
    
    $data = array(
            'unique_id' => $_POST['unique_id'],
            'parent_id' => $_POST['parent_id'],
            'lang_id'   => intval($GLOBALS['lang_type']),
            'cat_name' => $_POST['cat_name'],
            'image'    => $image,
            'content'    => $_POST['content'],
            'keywords' => $_POST['keywords'],
            'description' => $_POST['description'],
            'sort' => $_POST['sort'],
            'template' => trim($_POST['template']),
        );
    $res = $dou->insert('article_category',$data);
    if ($res) {
        $dou->create_admin_log($_LANG['article_category_add'] . ': ' . $_POST['cat_name']);
        $dou->dou_msg($_LANG['article_category_add_succes'], 'article_category.php');
    } else {
        $dou->dou_msg('修改失败！');
    }
} 

/**
 * +----------------------------------------------------------
 * 分类编辑
 * +----------------------------------------------------------
 */
elseif ($rec == 'edit') {
    $smarty->assign('ur_here', $_LANG['article_category_edit']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['article_category'],
            'href' => 'article_category.php' 
    ));
    
    // 获取分类信息
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? $_REQUEST['cat_id'] : '';
    $query = $dou->select($dou->table('article_category'), '*', '`cat_id`=\''. $cat_id .'\'');
    $cat_info = $dou->fetch_array($query);
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'update');
    $smarty->assign('article_category', $dou->get_category_nolevel('article_category', '0', '0', $cat_id));
    $smarty->assign('cat_info', $cat_info);
    
    $smarty->display('article_category.htm');
} 

elseif ($rec == 'update') {
    if (empty($_POST['cat_name']))
        $dou->dou_msg($_LANG['article_category_name'] . $_LANG['is_empty']);

    if (!$check->is_unique_id($_POST['unique_id']))
        $dou->dou_msg($_LANG['unique_id_wrong']);

    if ($dou->value_exist('article_category', 'unique_id', $_POST['unique_id'], "AND cat_id != '$_POST[cat_id]'"))
        $dou->dou_msg($_LANG['unique_id_existed']);

    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('article_category', $id, 'image', 'cat_id'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
        // 因为这里文件名始终相同，会直接覆盖源文件，所以不可以做额外删除
        // $old_pic = $dou->get_one("SELECT image from ".$dou->table('article')." where id={$id} ");
        // if ($old_pic) { $dou->del_image($old_pic); }
    }

    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);

    $data = array(
            'unique_id' => $_POST['unique_id'],
            'parent_id' => $_POST['parent_id'],
            'cat_name' => $_POST['cat_name'],
            'content'  => $_POST['content'],
            'keywords' => $_POST['keywords'],
            'description' => $_POST['description'],
            'sort' => $_POST['sort'],
            'template' => trim($_POST['template']),
        );
    if ($image) 
        $data['image'] = $image;
    $res = $dou->update('article_category',$data,"cat_id = '$_POST[cat_id]'");
    if ($res) {
        $dou->create_admin_log($_LANG['article_category_edit'] . ': ' . $_POST['cat_name']);
        $dou->dou_msg($_LANG['article_category_edit_succes'], 'article_category.php');
    } else {
        $dou->dou_msg('内容无变化 或 修改失败！');
    }
} 

/**
 * +----------------------------------------------------------
 * 分类删除
 * +----------------------------------------------------------
 */
elseif ($rec == 'del') {
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? intval($_REQUEST['cat_id']) : $dou->dou_msg($_LANG['illegal'], 'article_category.php');
    $cates = $dou->fetchRow(sprintf("SELECT b.id,a.cat_name,(SELECT cat_id FROM %s WHERE parent_id=%d) as cat_id FROM %s a JOIN %s b ON a.cat_id=b.cat_id WHERE a.cat_id=%d;",$dou->table('article_category'),$cat_id,$dou->table('article_category'),$dou->table('article'),$cat_id));
    $is_parent = $cates['id'] .$cates['cat_id'];
    if ($is_parent) {
        $_LANG['article_category_del_is_parent'] = preg_replace('/d%/Ums', $cates['cat_name'], $_LANG['article_category_del_is_parent']);
        $dou->dou_msg($_LANG['article_category_del_is_parent'], 'article_category.php', '', '3');
    } else {
        if (isset($_POST['confirm']) ? $_POST['confirm'] : '') {
            $dou->create_admin_log($_LANG['article_category_del'] . ': ' . $cates['cat_name']);
            $dou->delete($dou->table('article_category'), "cat_id = $cat_id", 'article_category.php');
        } else {
            $_LANG['del_check'] = preg_replace('/d%/Ums', $cates['cat_name'], $_LANG['del_check']);
            $dou->dou_msg($_LANG['del_check'], 'article_category.php', '', '30', "article_category.php?rec=del&cat_id=$cat_id");
        }
    }
}
?>