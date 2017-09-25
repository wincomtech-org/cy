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
    $sql = "SELECT cat_name,image,keywords,description FROM " . $dou->table('product_category') . 'WHERE cat_id='.$cat_id;
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
        $cate_info['description'] = str_replace(PHP_EOL,'<br>',$cate_info['description']);
    }
}

// 判断有无子二类
// 获取所有子类id组
$checkids = $dou->dou_child_id('product_category',$cat_id,'',1);
// 判断子类id是否还有子类
$check_last = $dou->get_one("SELECT count(*) FROM ". $dou->table('product_category') ." WHERE parent_id IN ({$checkids}) AND lang_id=".$_CFG['lang_type']);

// 有无子分类区别
if ($checkids) {
    if ($check_last) {
        // product_category.html
        // $smarty->assign('product_category', $dou->get_category('product_category', 0, $cat_id));
        // $smarty->assign('product_category', $dou->get_category('product_category',$cat_id));
        $sql = 'SELECT cat_id,cat_name,image,description FROM '. $dou->table('product_category') .' WHERE parent_id=0 AND lang_id='.$_CFG['lang_type'];
        $query = $dou->query($sql);
        while ($row = $dou->fetch_assoc($query)) {
            $row['url'] = $dou->rewrite_url('product_category', $row['cat_id']);
            $row['description'] = $row['description'] ? str_replace(PHP_EOL,'<br>',$row['description']) : '';
            // 生成缩略图的文件名
            if ($row['image']) {
                $image = explode('.', $row['image']);
                $row['thumb'] = ROOT_URL . $image[0] . "_thumb." . $image[1];
                // $row['image'] = ROOT_URL . $row['image'];
            } else {
                $row['thumb'] = ROOT_URL .'images/nopic_s_100x100.jpg';
            }
            $product_category[] = $row;
        }
        $smarty->assign('product_category', $product_category);
        $thistpl = 'product_category.html';

    } else {
        // product_category_child.html
        $cat_ids = $cat_id . $dou->dou_child_id('product_category', $cat_id);
        if (strpos($cat_ids,',')) {
            $where = ' WHERE cat_id IN ('. $cat_ids .') AND lang_id='. $lang_type;
        } else {
            $where = ' WHERE cat_id='.$cat_id;
        }
        // 获取分页信息
        $page = $check->is_number($_REQUEST['page']) ? trim($_REQUEST['page']) : 1;
        $where2 = str_replace('a.','',$where);
        $limit = $dou->pager('product_category', ($_DISPLAY['product'] ? $_DISPLAY['product'] : 10), $page, $dou->rewrite_url('product_category', $cat_id), $where2);
        /* 获取二级产品列表 */
        $sql = sprintf('SELECT cat_id,cat_name FROM %s %s ORDER BY sort',$dou->table('product_category'),$where,$limit);
        $query = $dou->query($sql);
        while ($row = $dou->fetch_assoc($query)) {
            $row['url'] = $dou->rewrite_url('product_category', $row['cat_id']);
            $list = array();
            $result = $dou->query('SELECT id,name,image from '.$dou->table('product').' where cat_id='. $row['cat_id'] .' ORDER BY sort LIMIT 4');
            while ($r = $dou->fetch_assoc($result)) {
                $r['url'] = $dou->rewrite_url('product', $r['id']).'&cid='.$row['cat_id'];
                if ($r['image']) {
                    $image = explode('.', $r['image']);
                    $r['thumb'] = ROOT_URL . $image[0] . "_thumb." . $image[1];
                }
                $list[] = $r;
            }
            $row['list'] = $list;
            $product_list[] = $row;
        }
        $smarty->assign('product_list', $product_list);
        $thistpl = 'product_category_child.html';
    }

} else {
    // product_list.html
    // 获取分页信息
    $page = $check->is_number($_REQUEST['page']) ? trim($_REQUEST['page']) : 1;
    $limit = $dou->pager('product', ($_DISPLAY['product'] ? $_DISPLAY['product'] : 12), $page, $dou->rewrite_url('product_category', $cat_id), $where);
    /* 获取产品列表 */
    $fields = $dou->create_fields_quote('id,cat_id,name,image');
    $sql = sprintf('SELECT %s from %s %s order by sort,id desc %s',$fields,$dou->table('product'),$where,$limit);
    $query = $dou->query($sql);
    while ($row = $dou->fetch_assoc($query)) {
        $row['url'] = $dou->rewrite_url('product', $row['id']).'&cid='.$cat_id; // 获取经过伪静态产品链接
        // $row['add_time'] = date("Y-m-d", $row['add_time']);
        // $row['description'] = $row['description'] ? str_replace(PHP_EOL,'<br>',$row['description']) : '';
        // 生成缩略图的文件名
        $image = explode('.', $row['image']);
        $row['thumb'] = ROOT_URL . $image[0] . "_thumb." . $image[1];
        // 格式化价格
        // $row['price'] = $row['price'] > 0 ? $dou->price_format($row['price']) : $_LANG['price_discuss'];
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

// $dou->debug($cate_info);
// $dou->debug($product_category,1);
// $dou->debug($product_list,1);


// $_CFG['deftpl']['product_category'] = 'product_category.dwt';
// $thistpl = $cate_info['template']?$cate_info['template']:$_CFG['deftpl']['product_category'];
// $smarty->display($thistpl);
$smarty->display($thistpl);
?>