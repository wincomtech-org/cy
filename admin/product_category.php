<?php
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
// 权限判断
$rbac->access_jump('product',$_USER);

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

// 图片上传
include_once (ROOT_PATH . 'include/upload.class.php');
$images_dir = 'images/product_category/'; // 文件上传路径，结尾加斜杠
$thumb_dir = ''; // 缩略图路径（相对于$images_dir） 结尾加斜杠，留空则跟$images_dir相同
$img = new Upload(ROOT_PATH . $images_dir, $thumb_dir); // 实例化类文件
if (!file_exists(ROOT_PATH . $images_dir)) {
    mkdir(ROOT_PATH . $images_dir, 0777);
}
$_CFG['thumb_width'] = 374;$_CFG['thumb_height'] = 374;

// 赋值给模板
$smarty->assign('rec', $rec);
$smarty->assign('cur', 'product_category');

/**
 * +----------------------------------------------------------
 * 分类列表
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    $smarty->assign('ur_here', $_LANG['product_category']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['product_category_add'],
            'href' => 'product_category.php?rec=add' 
    ));
    
    // 赋值给模板
    $smarty->assign('product_category', $dou->get_category_nolevel('product_category'));
    // print_r($dou->get_category_nolevel('product_category'));
    $smarty->display('product_category.htm');
} 

/**
 * +----------------------------------------------------------
 * 分类添加
 * +----------------------------------------------------------
 */
elseif ($rec == 'add') {
    $smarty->assign('ur_here', $_LANG['product_category_add']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['product_category'],
            'href' => 'product_category.php' 
    ));
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'insert');
    $smarty->assign('product_category', $dou->get_category_nolevel('product_category'));
    
    $smarty->display('product_category.htm');
} 

elseif ($rec == 'insert') {
    if (empty($_POST['cat_name']))
        $dou->dou_msg($_LANG['product_category_name'] . $_LANG['is_empty']);
    
    if (!$check->is_unique_id($_POST['unique_id']))
        $dou->dou_msg($_LANG['unique_id_wrong']);
        
    if ($dou->value_exist('product_category', 'unique_id', $_POST['unique_id']))
        $dou->dou_msg($_LANG['unique_id_existed']);

    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('product_category'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
    }

    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);
    
    $data = array(
            'unique_id' => $_POST['unique_id'],
            'parent_id' => $_POST['parent_id'],
            'lang_id'   => intval($GLOBALS['lang_type']),
            'cat_name'  => $_POST['cat_name'],
            'image'     => $image,
            'keywords'  => $_POST['keywords'],
            'description'  => $_POST['description'],
            'sort'      => $_POST['sort']
        );
    $dou->insert('product_category',$data);
    
    $dou->create_admin_log($_LANG['product_category_add'] . ': ' . $_POST['cat_name']);
    $dou->dou_msg($_LANG['product_category_add_succes'], 'product_category.php');
} 

/**
 * +----------------------------------------------------------
 * 分类编辑
 * +----------------------------------------------------------
 */
elseif ($rec == 'edit') {
    $smarty->assign('ur_here', $_LANG['product_category_edit']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['product_category'],
            'href' => 'product_category.php' 
    ));
    
    // 获取分类信息
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? $_REQUEST['cat_id'] : '';
    $query = $dou->select($dou->table('product_category'), '*', '`cat_id`=\''. $cat_id .'\'');
    $cat_info = $dou->fetch_array($query);
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'update');
    $smarty->assign('product_category', $dou->get_category_nolevel('product_category', '0', '0', $cat_id));
    $smarty->assign('cat_info', $cat_info);
    
    $smarty->display('product_category.htm');
} 

elseif ($rec == 'update') {
    if (empty($_POST['cat_name']))
        $dou->dou_msg($_LANG['product_category_name'] . $_LANG['is_empty']);

    if (!$check->is_unique_id($_POST['unique_id']))
        $dou->dou_msg($_LANG['unique_id_wrong']);

    if ($dou->value_exist('product_category', 'unique_id', $_POST['unique_id'], "AND cat_id != '$_POST[cat_id]'"))
        $dou->dou_msg($_LANG['unique_id_existed']);

    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('product_category', $_POST['cat_id'], 'image', 'cat_id'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
        // 因为这里文件名始终相同，会直接覆盖源文件，所以不可以做额外删除
        // $old_pic = $dou->get_one("SELECT image from ".$dou->table('product')." where id='$_POST[id]' ");
        // if ($old_pic) { $dou->del_image($old_pic); }
    }

    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);
    
    $data = array(
            'cat_name'  => $_POST['cat_name'],
            'unique_id'  => $_POST['unique_id'],
            'parent_id'  => $_POST['parent_id'],
            'keywords'  => $_POST['keywords'],
            'description'  => $_POST['description'],
            'sort'  => $_POST['sort']
        );
    if ($image)
        $data['image'] = $image;
    $dou->update('product_category',$data,'cat_id='.$_POST['cat_id']);
    
    $dou->create_admin_log($_LANG['product_category_edit'] . ': ' . $_POST['cat_name']);
    $dou->dou_msg($_LANG['product_category_edit_succes'], 'product_category.php');
} 

/**
 * +----------------------------------------------------------
 * 分类删除
 * +----------------------------------------------------------
 */
elseif ($rec == 'del') {
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? $_REQUEST['cat_id'] : $dou->dou_msg($_LANG['illegal'], 'product_category.php');
    $cat_name = $dou->get_one("SELECT cat_name FROM " . $dou->table('product_category') . " WHERE cat_id = '$cat_id'");
    $is_parent = $dou->get_one("SELECT id FROM " . $dou->table('product') . " WHERE cat_id = '$cat_id'") .
             $dou->get_one("SELECT cat_id FROM " . $dou->table('product_category') . " WHERE parent_id = '$cat_id'");
    
    if ($is_parent) {
        $_LANG['product_category_del_is_parent'] = preg_replace('/d%/Ums', $cat_name, $_LANG['product_category_del_is_parent']);
        $dou->dou_msg($_LANG['product_category_del_is_parent'], 'product_category.php', '', '3');
    } else {
        if (isset($_POST['confirm']) ? $_POST['confirm'] : '') {
            $dou->create_admin_log($_LANG['product_category_del'] . ': ' . $cat_name);
            $dou->delete($dou->table('product_category'), "cat_id = $cat_id", 'product_category.php');
        } else {
            $_LANG['del_check'] = preg_replace('/d%/Ums', $cat_name, $_LANG['del_check']);
            $dou->dou_msg($_LANG['del_check'], 'product_category.php', '', '30', "product_category.php?rec=del&cat_id=$cat_id");
        }
    }
}
?>