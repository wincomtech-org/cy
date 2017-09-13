<?php
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
// 权限判断
$rbac->access_jump('job',$_USER);

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

// 图片上传
include_once (ROOT_PATH . 'include/upload.class.php');
$images_dir = 'images/job/'; // 文件上传路径，结尾加斜杠
$thumb_dir = ''; // 缩略图路径（相对于$images_dir） 结尾加斜杠，留空则跟$images_dir相同
$img = new Upload(ROOT_PATH . $images_dir, $thumb_dir); // 实例化类文件
if (!file_exists(ROOT_PATH . $images_dir))
    mkdir(ROOT_PATH . $images_dir, 0777);

// 赋值给模板
$smarty->assign('rec', $rec);
$smarty->assign('cur', 'job');

/**
 * +----------------------------------------------------------
 * 招聘列表
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    $smarty->assign('ur_here', $_LANG['job']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['job_add'],
            'href' => 'job.php?rec=add' 
    ));
    
    // 获取参数
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? $_REQUEST['cat_id'] : 0;
    $keyword = isset($_REQUEST['keyword']) ? trim($_REQUEST['keyword']) : '';
    
    // 筛选条件
    if ($cat_id) {
        $where = ' WHERE a.cat_id IN ('.$cat_id . $dou->dou_child_id('job_category',$cat_id).')';
    }
    $where = $where ? $where : 'WHERE a.lang_id='.intval($GLOBALS['lang_type']);
    if ($keyword) {
        $where .= " AND a.title LIKE '%$keyword%'";
        $get = '&keyword=' . $keyword;
    }
    
    // 分页
    $page = $check->is_number($_REQUEST['page']) ? $_REQUEST['page'] : 1;
    $page_url = 'job.php' . ($cat_id ? '?cat_id=' . $cat_id : '');
    $where2 = str_replace('a.', '', $where);
    $limit = $dou->pager('job', 15, $page, $page_url, $where2, $get);
    // 查询数据
    $fields = $dou->create_fields_quote('id,title,cat_id,image,type,num,addr,add_time','a');
    $sql = sprintf("SELECT %s,b.cat_name from %s a left join %s b on a.cat_id=b.cat_id %s %s %s", $fields,$dou->table('job'),$dou->table('job_category'),$where,' ORDER BY a.id DESC',$limit);
    $query = $dou->query($sql);
    while ($row = $dou->fetch_array($query)) {
        $row['add_time'] = date("Y-m-d", $row['add_time']);
        $job_list[] = $row;
    }
    
    // 首页显示招聘数量限制框
    for($i=1; $i<=$_CFG['home_display_job']; $i++) {
        $sort_bg .= "<li><em></em></li>";
    }
    
    // 赋值给模板
    $smarty->assign('if_sort', $_SESSION['if_sort']);
    $smarty->assign('sort', get_sort_job());
    $smarty->assign('sort_bg', $sort_bg);
    $smarty->assign('cat_id', $cat_id);
    $smarty->assign('keyword', $keyword);
    $smarty->assign('job_category', $dou->get_category_nolevel('job_category'));
    $smarty->assign('job_list', $job_list);
    
    $smarty->display('job.htm');
} 

/**
 * +----------------------------------------------------------
 * 招聘添加
 * +----------------------------------------------------------
 */
elseif ($rec == 'add') {
    $smarty->assign('ur_here', $_LANG['job_add']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['job'],
            'href' => 'job.php' 
    ));
    
    // 格式化自定义参数，并存到数组$job，招聘编辑页面中调用招聘详情也是用数组$job，
    if ($_DEFINED['job']) {
        $defined = explode(',', $_DEFINED['job']);
        foreach ($defined as $row) {
            $defined_job .= $row . "：\n";
        }
        $job['defined'] = trim($defined_job);
        $job['defined_count'] = count(explode("\n", $job['defined'])) * 2;
    }
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'insert');
    $smarty->assign('job_category', $dou->get_category_nolevel('job_category'));
    $smarty->assign('job', $job);
    
    $smarty->display('job.htm');
} 

elseif ($rec == 'insert') {
    // 验证标题
    if (empty($_POST['title'])) $dou->dou_msg($_LANG['job_name'] . $_LANG['is_empty']);
    
    // 图片上传
    if ($_FILES['image']['name'] != ''){
        $image = $images_dir . $img->upload_image('image', $img->create_file_name('job'));
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
            'type'          => $_POST['type'],
            'num'           => $_POST['num'],
            'addr'          => $_POST['addr'],
            'link'          => $_POST['link'],
            'keywords'      => $_POST['keywords'],
            'description'   => $_POST['description'],
            'add_time'      => $add_time,
        );
    $dou->insert('job',$data);
    
    $dou->create_admin_log($_LANG['job_add'] . ': ' . $_POST['title']);
    $dou->dou_msg($_LANG['job_add_succes'], 'job.php');
} 

/**
 * +----------------------------------------------------------
 * 招聘编辑
 * +----------------------------------------------------------
 */
elseif ($rec == 'edit') {
    $smarty->assign('ur_here', $_LANG['job_edit']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['job'],
            'href' => 'job.php' 
    ));
    
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : '';
    
    $query = $dou->select($dou->table('job'), '*', '`id`=\''. $id .'\'');
    $job = $dou->fetch_array($query);
    
    // 格式化自定义参数
    if ($_DEFINED['job'] || $job['defined']) {
        $defined = explode(',', $_DEFINED['job']);
        foreach ($defined as $row) {
            $defined_job .= $row . "：\n";
        }
        // 如果招聘中已经写入自定义参数则调用已有的
        $job['defined'] = $job['defined'] ? str_replace(",", "\n", $job['defined']) : trim($defined_job);
        $job['defined_count'] = count(explode("\n", $job['defined'])) * 2;
    }
    
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());
    
    // 赋值给模板
    $smarty->assign('form_action', 'update');
    $smarty->assign('job_category', $dou->get_category_nolevel('job_category'));
    $smarty->assign('job', $job);
    
    $smarty->display('job.htm');
} 

elseif ($rec == 'update') {
    // 验证标题
    if (empty($_POST['title'])) $dou->dou_msg($_LANG['job_name'] . $_LANG['is_empty']);
        
    // 图片上传
    if ($_FILES['image']['name'] != ''){
        $image = $images_dir . $img->upload_image('image', $img->create_file_name('job', $_POST['id']));
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
            'type'          => $_POST['type'],
            'num'           => $_POST['num'],
            'addr'          => $_POST['addr'],
            'link'          => $_POST['link'],
            'keywords'      => $_POST['keywords'],
            'description'   => $_POST['description'],
        );
    if ($image) 
        $data['image'] = $image;
    $dou->update('job',$data,'id='.$_POST['id']);
    
    $dou->create_admin_log($_LANG['job_edit'] . ': ' . $_POST['title']);
    $dou->dou_msg($_LANG['job_edit_succes'], 'job.php');
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
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'job.php');
    
    $max_sort = $dou->get_one("SELECT sort FROM " . $dou->table('job') . " ORDER BY sort DESC");
    $new_sort = $max_sort + 1;
    $dou->query("UPDATE " . $dou->table('job') . " SET sort = '$new_sort' WHERE id='$id'");
    
    $dou->dou_header($_SERVER['HTTP_REFERER']);
} 

/**
 * +----------------------------------------------------------
 * 取消首页显示产品
 * +----------------------------------------------------------
 */
elseif ($rec == 'del_sort') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'job.php');
    
    $dou->query("UPDATE " . $dou->table('job') . " SET sort = '' WHERE id='$id'");
    $dou->dou_header($_SERVER['HTTP_REFERER']);
} 

/**
 * +----------------------------------------------------------
 * 招聘删除
 * +----------------------------------------------------------
 */
elseif ($rec == 'del') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'job.php');
    $title = $dou->get_one("SELECT title FROM " . $dou->table('job') . " WHERE id='$id'");
    
    if (isset($_POST['confirm']) ? $_POST['confirm'] : '') {
        // 删除相应产品图片
        $image = $dou->get_one("SELECT image FROM " . $dou->table('job') . " WHERE id='$id'");
        $dou->del_image($image);
        
        $dou->create_admin_log($_LANG['job_del'] . ': ' . $title);
        $dou->delete($dou->table('job'), "id = $id", 'job.php');
    } else {
        $_LANG['del_check'] = preg_replace('/d%/Ums', $title, $_LANG['del_check']);
        $dou->dou_msg($_LANG['del_check'], 'job.php', '', '30', "job.php?rec=del&id=$id");
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
            // 批量招聘删除
            $dou->del_all('job', $_POST['checkbox'], 'id', 'image');
        } elseif ($_POST['action'] == 'category_move') {
            // 批量移动分类
            $dou->category_move('job', $_POST['checkbox'], $_POST['new_cat_id']);
        } else {
            $dou->dou_msg($_LANG['select_empty']);
        }
    } else {
        $dou->dou_msg($_LANG['job_select_empty']);
    }
}

/**
 * +----------------------------------------------------------
 * 获取首页显示招聘
 * +----------------------------------------------------------
 */
function get_sort_job() {
    $limit = $GLOBALS['_DISPLAY']['home_job'] ? ' LIMIT ' . $GLOBALS['_DISPLAY']['home_job'] : '';
    $sql = "SELECT id, title FROM " . $GLOBALS['dou']->table('job') . " WHERE sort > 0 ORDER BY sort DESC" . $limit;
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