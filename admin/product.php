<?php
define('IN_LOTHAR', true);
define('CMOD', 'product');
require (dirname(__FILE__) . '/include/init.php');
// 权限判断
$rbac->access_jump('product',$_USER);

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

// 图片上传
include_once (ROOT_PATH . 'include/upload.class.php');
$images_dir = 'images/product/'; // 文件上传路径，结尾加斜杠
$thumb_dir = ''; // 缩略图路径（相对于$images_dir） 结尾加斜杠，留空则跟$images_dir相同
$img = new Upload(ROOT_PATH . $images_dir, $thumb_dir); // 实例化类文件
if(!file_exists(ROOT_PATH . $images_dir)) {
    mkdir(ROOT_PATH . $images_dir, 0777);
}

// 赋值给模板
$smarty->assign('rec', $rec);
$smarty->assign('cur', 'product');

if (in_array($rec,array('default','add','edit'))) {
    // 获取参数
    $cat_id = $check->is_number($_REQUEST['cat_id']) ? intval($_REQUEST['cat_id']) : ($rec=='default'?0:1);
    $cid = isset($_GET['cid']) ? intval($_GET['cid']) : 0;
    if ($cid) {
        $cat_id = $cid;
    }
    if ($rec=='edit') {
        // 验证并获取合法的ID
        $id = $check->is_number($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
        if (!$cid) {
            $cat_id = $dou->get_one("SELECT cat_id from ".$dou->table('product')." WHERE id=".$id);
        }
    }

    // 选定字段 和 筛子
    $daos = $dou->get_dao_fields($cat_id);
    if (empty($daos['fields'])) {
        $tid = $dou->get_tid('product_category',$cat_id);
        $daos = $dou->get_dao_fields($tid);
    }
    // $dou->get_dao_series();

    $smarty->assign('cat_id', $cat_id);
}

/**
 * +----------------------------------------------------------
 * 产品列表
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    $smarty->assign('ur_here', $_LANG['product']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['product_add'],
            'href' => 'product.php?rec=add'
    ));

    // 获取参数
    $keyword = isset($_REQUEST['keyword']) ? trim($_REQUEST['keyword']) : '';

    // 筛选条件
    if ($cat_id) {
        $where = ' WHERE a.cat_id IN ('.$cat_id . $dou->dou_child_id('product_category',$cat_id).')';
    }
    $where = $where ? $where : 'WHERE a.lang_id='.intval($GLOBALS['lang_type']);
    if ($keyword) {
        $where .= " AND a.name LIKE '%$keyword%'";
        $get = '&keyword=' . $keyword;
    }

    // 分页
    $page = $check->is_number($_REQUEST['page']) ? $_REQUEST['page'] : 1;
    $page_url = 'product.php' . ($cat_id ? '?cat_id=' . $cat_id : '');
    $where2 = str_replace('a.', '', $where);
    $limit = $dou->pager('product', 15, $page, $page_url, $where2, $get);
    // 查询数据 a.cat_id,
    $fields = $dou->create_fields_quote('id,name,cat_id,add_time,sort','a');
    $sql = sprintf("SELECT %s,b.cat_name from %s a left join %s b on a.cat_id=b.cat_id %s %s %s", $fields,$dou->table('product'),$dou->table('product_category'),$where,' ORDER BY a.sort,a.add_time DESC',$limit);
    $query = $dou->query($sql);
    while ($row = $dou->fetch_array($query)) {
        $row['add_time'] = date("Y-m-d", $row['add_time']);
        $product_list[] = $row;
    }

    // 首页显示产品数量限制框
    for($i=1; $i<=$_CFG['home_display_product']; $i++) {
        $sort_bg .= "<li><em></em></li>";
    }

    // 赋值给模板
    $smarty->assign('if_sort', $_SESSION['if_sort']);
    $smarty->assign('sort', get_sort_product());
    $smarty->assign('sort_bg', $sort_bg);
    $smarty->assign('keyword', $keyword);
    $smarty->assign('product_category', $dou->get_category_nolevel('product_category'));
    $smarty->assign('product_list', $product_list);

    $smarty->display('product.htm');
}

/**
 * +----------------------------------------------------------
 * 产品添加
 * +----------------------------------------------------------
 */
elseif ($rec == 'add') {
    $smarty->assign('ur_here', $_LANG['product_add']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['product'],
            'href' => 'product.php'
    ));

    // 格式化自定义参数，并存到数组$product，产品编辑页面中调用产品详情也是用数组$product，
    if ($_DEFINED['product']) {
        $defined = explode(',', $_DEFINED['product']);
        foreach ($defined as $row) {
            $defined_product .= $row . "：\n";
        }
        $product['defined'] = trim($defined_product);
        $product['defined_count'] = count(explode("\n", $product['defined'])) * 2;
    }
    // 获取自定义属性

    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());

    // 产品分类
    $product_category = $dou->get_category('product_category',0,'','cat_id,parent_id,cat_name');
    // print_r($product_category);
    // $product_category = $dou->get_category_nolevel('product_category');

    // 赋值给模板
    $smarty->assign('form_action', 'insert');
    $smarty->assign('product_category', $product_category);
    $smarty->assign('product', $product);

    $smarty->display('product.htm');
}

elseif ($rec == 'insert') {
    // 数据验证
    if (empty($_POST['name'])) $dou->dou_msg($_LANG['name'] . $_LANG['is_empty']);
    if (!$check->is_price(trim($_POST['price']))) $dou->dou_msg($_LANG['price_wrong']);

    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('product'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
        // 第二张缩略图
        $img->make_thumb($image_name, $thumb['w2'], $thumb['h2'], '90', '2');
    } else {
        $image = '';
    }

    // 数据格式化
    if (!empty($_POST['defined'])) {
        $_POST['defined'] = str_replace("\r\n", ',', $_POST['defined']);
    } else {
        $_POST['defined'] = '';
    }

    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);

    $data = array(
            'cat_id'  => $_POST['cat_id'],
            'lang_id' => intval($GLOBALS['lang_type']),
            'name'  => $_POST['name'],
            'model'  => $_POST['model'],
            'price'  => $_POST['price'],
            'defined'  => $_POST['defined'],
            'content'  => $_POST['content'],
            'image'  => $image,
            'link'  => $_POST['link'],
            'keywords'  => $_POST['keywords'],
            'description'  => $_POST['description'],
            'sort'  => $_POST['sort'],
            'add_time'  => time()
    );
    // 获取选定字段
    // $dou->debug($daos,1);
    if (!empty($_POST['daos'])) {
        $data['daos'] = serialize($_POST['daos']);
    }
    $dou->insert('product',$data);

    $dou->create_admin_log($_LANG['product_add'] . ': ' . $_POST['name']);
    $dou->dou_msg($_LANG['product_add_succes'], 'product.php');
}

/**
 * +----------------------------------------------------------
 * 产品编辑
 * +----------------------------------------------------------
 */
elseif ($rec == 'edit') {
    $smarty->assign('ur_here', $_LANG['product_edit']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['product'],
            'href' => 'product.php'
    ));

    $query = $dou->select($dou->table('product'), '*', '`id`=\''. $id .'\'');
    $product = $dou->fetch_array($query);

    // 格式化自定义参数
    if ($_DEFINED['product']) {
        $defined = explode(',', $_DEFINED['product']);
        foreach ($defined as $row) {
            $defined_product .= $row . "：\n";
        }
        // 如果产品中已经写入自定义参数则调用已有的
        $product['defined'] = $product['defined'] ? str_replace(",", "\n", $product['defined']) : trim($defined_product);
        $product['defined_count'] = count(explode("\n", $product['defined'])) * 2;
    } else {
        $product['defined'] = '';
        $product['defined_count'] = 0;
    }

    // 反序列化选定字段
    if ($product['daos']) {
        $daos = unserialize($product['daos']);
        $product = array_merge($product,$daos);
    }

    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->get_token());

    // 产品分类
    $product_category = $dou->get_category('product_category',0,'','cat_id,parent_id,cat_name');
    // print_r($product_category);
    // $product_category = $dou->get_category_nolevel('product_category');

    // 赋值给模板
    $smarty->assign('form_action', 'update');
    $smarty->assign('product_category', $product_category);
    $smarty->assign('product', $product);

    $smarty->display('product.htm');
}

elseif ($rec == 'update') {
    // 数据验证
    if (empty($_POST['name'])) $dou->dou_msg($_LANG['name'] . $_LANG['is_empty']);
    if (!$check->is_price(trim($_POST['price']))) $dou->dou_msg($_LANG['price_wrong']);

    // 图片上传
    if ($_FILES['image']['name'] != '') {
        $image_name = $img->upload_image('image', $img->create_file_name('product', $_POST['id'], 'image'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
        // 第二张缩略图
        $img->make_thumb($image_name, $thumb['w2'], $thumb['h2'], '90', '2');
        // 因为这里文件名始终相同，会直接覆盖源文件，所以不可以做额外删除
        // $old_pic = $dou->get_one("SELECT image from ".$dou->table('product')." where id='$_POST[id]' ");
        // if ($old_pic) { $dou->del_image($old_pic); }
    }

    // 格式化自定义参数
    if (!empty($_POST['defined'])) {
        $_POST['defined'] = str_replace("\r\n", ',', $_POST['defined']);
    } else {
        $_POST['defined'] = '';
    }

    // CSRF防御令牌验证
    $firewall->check_token($_POST['token']);

    $data = array(
            'cat_id'  => $_POST['cat_id'],
            'name'  => $_POST['name'],
            'model'  => $_POST['model'],
            'price'  => $_POST['price'],
            'defined'  => $_POST['defined'],
            'content'  => $_POST['content'],
            'link'  => $_POST['link'],
            'keywords'  => $_POST['keywords'],
            'description'  => $_POST['description'],
            'sort'  => $_POST['sort'],
        );
    if (!empty($image)) $data['image'] = $image;

    // 获取选定字段
    // $dou->debug($daos,1);
    if (!empty($_POST['daos'])) {
        $data['daos'] = serialize($_POST['daos']);
    }
    $dou->update('product',$data,'id='.$_POST['id']);

    $dou->create_admin_log($_LANG['product_edit'] . ': ' . $_POST['name']);
    $dou->dou_msg($_LANG['product_edit_succes'], 'product.php');
}

/**
 * +----------------------------------------------------------
 * 重新生成产品图片
 * +----------------------------------------------------------
 */
elseif ($rec == 're_thumb') {
    $smarty->assign('ur_here', $_LANG['product_thumb']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['product'],
            'href' => 'product.php'
    ));

    $sql = "SELECT id, image FROM " . $dou->table('product') . "ORDER BY id ASC";
    $count = mysql_num_rows($query = $dou->query($sql));
    $mask['count'] = preg_replace('/d%/Ums', $count, $_LANG['product_thumb_count']);
    $mask_tag = '<i></i>';
    $mask['confirm'] = $_POST['confirm'];

    for($i=1; $i<=$count; $i++)
        $mask['bg'] .= $mask_tag;

    $smarty->assign('mask', $mask);
    $smarty->display('product.htm');

    if (isset($_POST['confirm'])) {
        echo ' ';
        while ($row = $dou->fetch_array($query)) {
            $img->make_thumb(basename($row['image']), $_CFG['thumb_width'], $_CFG['thumb_height']);
            echo "<script type=\"text/javascript\">mask('" . $mask_tag . "');</script>";
            flush();
            ob_flush();
        }
        echo "<script type=\"text/javascript\">success();</script>\n</body>\n</html>";
    }
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
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'product.php');

    $max_sort = $dou->get_one("SELECT sort FROM " . $dou->table('product') . " ORDER BY sort DESC");
    $new_sort = $max_sort + 1;
    $dou->query("UPDATE " . $dou->table('product') . " SET sort = '$new_sort' WHERE id='$id'");

    $dou->dou_header($_SERVER['HTTP_REFERER']);
}

/**
 * +----------------------------------------------------------
 * 取消首页显示产品
 * +----------------------------------------------------------
 */
elseif ($rec == 'del_sort') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'product.php');

    $dou->query("UPDATE " . $dou->table('product') . " SET sort = '' WHERE id='$id'");

    $dou->dou_header($_SERVER['HTTP_REFERER']);
}

/**
 * +----------------------------------------------------------
 * 产品删除
 * +----------------------------------------------------------
 */
elseif ($rec == 'del') {
    // 验证并获取合法的ID
    $id = $check->is_number($_REQUEST['id']) ? $_REQUEST['id'] : $dou->dou_msg($_LANG['illegal'], 'product.php');

    $name = $dou->get_one("SELECT name FROM " . $dou->table('product') . " WHERE id='$id'");

    if (isset($_POST['confirm']) ? $_POST['confirm'] : '') {
        // 删除相应产品图片
        $image = $dou->get_one("SELECT image FROM " . $dou->table('product') . " WHERE id='$id'");
        $dou->del_image($image);

        $dou->create_admin_log($_LANG['product_del'] . ': ' . $name);
        $dou->delete($dou->table('product'), "id = $id", 'product.php');
    } else {
        $_LANG['del_check'] = preg_replace('/d%/Ums', $name, $_LANG['del_check']);
        $dou->dou_msg($_LANG['del_check'], 'product.php', '', '30', "product.php?rec=del&id=$id");
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
            // 批量产品删除
            $dou->del_all('product', $_POST['checkbox'], 'id', 'image');
        } elseif ($_POST['action'] == 'category_move') {
            // 批量移动分类
            $dou->category_move('product', $_POST['checkbox'], $_POST['new_cat_id']);
        } else {
            $dou->dou_msg($_LANG['select_empty']);
        }
    } else {
        $dou->dou_msg($_LANG['product_select_empty']);
    }
}

/**
 * +----------------------------------------------------------
 * 获取首页显示产品
 * +----------------------------------------------------------
 */
function get_sort_product() {
    $limit = $GLOBALS['_DISPLAY']['home_product'] ? ' LIMIT ' . $GLOBALS['_DISPLAY']['home_product'] : '';
    $sql = "SELECT id, name, image FROM " . $GLOBALS['dou']->table('product') . " WHERE sort > 0 ORDER BY sort DESC" . $limit;
    $query = $GLOBALS['dou']->query($sql);
    while ($row = $GLOBALS['dou']->fetch_array($query)) {
        $image = ROOT_URL . $row['image'];

        $sort[] = array(
                "id" => $row['id'],
                "name" => $row['name'],
                "image" => $image
        );
    }

    return $sort;
}
?>