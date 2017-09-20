<?php
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
// 特殊处理
if (isset($_GET['id']) && strpos($_SERVER['HTTP_HOST'],'cypro')===false) {
    $cat_id = intval($_GET['id']);
    if ($cat_id==4 || $cat_id==22) {
        header('Location:'. $_CFG['domain_pro'] .'?id='.$cat_id);exit();
    }
}
require ROOT_PATH .'public.php';
if ($GLOBALS['lang_type']==2 && $_CFG['cypro']) {
    $sql = 'SELECT page_name,content,image,description FROM '. $dou->table('page') .' WHERE id=2';
    $about = $dou->fetchRow($sql);
    $index['about_content'] = $about['description'] ? $about['description'] : $dou->dou_substr($about['content'], 300, false);
    $smarty->assign('index', $index);
}

// 验证并获取合法的ID，如果不合法将其设定为-1
$cat_id = $firewall->get_legal_id('product_category', $_REQUEST['id'], $_REQUEST['unique_id']);
if ($cat_id == -1) {
    $dou->dou_msg($GLOBALS['_LANG']['page_wrong'], ROOT_URL);
} else {
    $cat_ids = $cat_id . $dou->dou_child_id('product_category', $cat_id);
    if (strpos($cat_ids,',')) {
        $where = ' WHERE cat_id IN ('. $cat_ids .") AND lang_id='{$GLOBALS[lang_type]}'";
    } else {
        $where = ' WHERE cat_id='.$cat_ids;
    }
    // 获取分类信息
    $sql = "SELECT * FROM " . $dou->table('product_category') . 'WHERE cat_id='.$cat_id;
    $query = $dou->query($sql);
    $cate_info = $dou->fetch_assoc($query);
    // 获取分类信息
    if (empty($cate_info)) {
        $cate_info = array(
            'cat_name'  => $_LANG['product_t'],
            'image'  => 'theme/'. $_CFG['site_theme'] .'/img/product1.jpg',
            'keywords'  => $_LANG['product_k'],
            'description'  => $_LANG['product_d']
        );
    } else {
        if ($cate_info['image']) {
            $thumb = explode('.', $cate_info['image']);
            $cate_info['thumb'] = ROOT_URL . $thumb[0] . "_thumb." . $thumb[1];
        } else {
            $cate_info['thumb'] = ROOT_URL .'images/nopic_s_100x100.jpg';
        }
    }
}

// 判断有无子二类
// 获取所有子类id组
$checkids = $dou->dou_child_id('product_category',$cat_id,'',1);
// 判断子类id是否还有子类
$check_last = $dou->get_one("SELECT count(*) FROM ". $dou->table('product_category') ." WHERE parent_id IN ({$checkids}) AND lang_id='{$GLOBALS[lang_type]}'");

// 有无子分类区别
if ($checkids) {
    if ($check_last) {
        // product_category.html
        // $smarty->assign('product_category', $dou->get_category('product_category', 0, $cat_id));
        $smarty->assign('product_category', $dou->get_category('product_category', $cat_id));
        $thistpl = 'product_category.html';
    } else {
        // product_category_child.html
        $cat_ids = $cat_id . $dou->dou_child_id('product_category', $cat_id);
        if (strpos($cat_ids,',')) {
            $where = ' WHERE a.cat_id IN ('. $cat_ids .") AND a.lang_id='{$GLOBALS[lang_type]}'";
        } else {
            $where = ' WHERE a.cat_id='.$cat_ids;
        }
        // 获取分页信息
        $page = $check->is_number($_REQUEST['page']) ? trim($_REQUEST['page']) : 1;
        $where2 = str_replace('a.','',$where);
        $limit = $dou->pager('product', ($_DISPLAY['product'] ? $_DISPLAY['product'] : 10), $page, $dou->rewrite_url('product_category', $cat_id), $where2);
        /* 获取产品列表 */
        $fields = $dou->create_fields_quote('id,cat_id,name,price,image,add_time,description,content','a');
        $sql = sprintf('SELECT %s,b.cat_name from %s as a join %s b on a.cat_id=b.cat_id %s order by a.sort asc,a.id desc %s',$fields,$dou->table('product'),$dou->table('product_category'),$where,$limit);
        $query = $dou->query($sql);
        while ($row = $dou->fetch_array($query,MYSQL_ASSOC)) {
            $row['url'] = $dou->rewrite_url('product', $row['id']).'&cid='.$cat_id; // 获取经过伪静态产品链接
            $row['add_time'] = date("Y-m-d", $row['add_time']);
            // 如果描述不存在则自动从详细介绍中截取
            $row['description'] = $row['description'] ? $row['description'] : $dou->dou_substr($row['content'], 150, false);
            // 生成缩略图的文件名
            $image = explode('.', $row['image']);
            $row['thumb'] = ROOT_URL . $image[0] . "_thumb." . $image[1];
            $row['image'] = ROOT_URL . $row['image'];
            // 格式化价格
            $row['price'] = $row['price'] > 0 ? $dou->price_format($row['price']) : $_LANG['price_discuss'];
            $product_list_c[] = $row;
        }
        foreach ($product_list_c as $key => $value) {
            // if (count($product_list[$value['cat_id']]['list'])<4) {
                $product_list[$value['cat_id']]['count'] = $value['cat_name'];
                $product_list[$value['cat_id']]['cat_name'] = $value['cat_name'];
                $product_list[$value['cat_id']]['cat_url'] = $dou->rewrite_url('product_category', $value['cat_id']);
                $product_list[$value['cat_id']]['list'][] = $value;
            // }
        }
        $smarty->assign('product_list', array_values($product_list));
        $thistpl = 'product_category_child.html';
    }

} else {
    // product_list.html
    // 获取分页信息
    $page = $check->is_number($_REQUEST['page']) ? trim($_REQUEST['page']) : 1;
    $limit = $dou->pager('product', ($_DISPLAY['product'] ? $_DISPLAY['product'] : 10), $page, $dou->rewrite_url('product_category', $cat_id), $where);
    /* 获取产品列表 */
    $fields = $dou->create_fields_quote('id,cat_id,name,price,content,image,add_time,description');
    $sql = sprintf('SELECT %s from %s %s order by sort,id desc %s',$fields,$dou->table('product'),$where,$limit);
    $query = $dou->query($sql);
    while ($row = $dou->fetch_array($query)) {
        $row['url'] = $dou->rewrite_url('product', $row['id']).'&cid='.$cat_id; // 获取经过伪静态产品链接
        $row['add_time'] = date("Y-m-d", $row['add_time']);
        // 如果描述不存在则自动从详细介绍中截取
        $row['description'] = $row['description'] ? $row['description'] : $dou->dou_substr($row['content'], 150, false);
        // 生成缩略图的文件名
        $image = explode('.', $row['image']);
        $row['thumb'] = ROOT_URL . $image[0] . "_thumb." . $image[1];
        // 格式化价格
        $row['price'] = $row['price'] > 0 ? $dou->price_format($row['price']) : $_LANG['price_discuss'];
        $product_list[] = $row;
    }
    $smarty->assign('product_list', $product_list);
    $thistpl = 'product_list.html';
}

// 当前导航标志
$product['cur'] = true;

// 赋值给模板-meta和title信息
$smarty->assign('page_title', $dou->page_title('product_category', $cat_id));
$smarty->assign('keywords', $cate_info['keywords']);
$smarty->assign('description', $cate_info['description']);

// 赋值给模板-导航栏
// $smarty->assign('nav_top_list', $dou->get_nav('top'));
$smarty->assign('nav_middle_list', $dou->get_nav('middle', '0', 'product_category', $cat_id, $cate_info['parent_id']));
$smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

// 赋值给模板-数据
// $smarty->assign('ur_here', $dou->ur_here('product_category', $cat_id));
$smarty->assign('cate_info', $cate_info);
$smarty->assign('product', $product);

// $dou->debug($dou->get_category('product_category', $cat_id),1);
// $dou->debug($cate_info);
// $dou->debug($product_list,1);


// $_CFG['deftpl']['product_category'] = 'product_category.dwt';
// $thistpl = $cate_info['template']?$cate_info['template']:$_CFG['deftpl']['product_category'];
// $smarty->display($thistpl);
$smarty->display($thistpl);
?>