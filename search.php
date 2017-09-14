<?php
/*
* 搜索结果
* 产品 和 文章
*/
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
require ROOT_PATH .'public.php';

// 初始化
// 如果存在搜索词则转入搜索页面
if (!$check->is_search_keyword( $srcval=trim($_REQUEST['srcval']) )) {
    $dou->dou_msg($_LANG['search_keyword_wrong']);
}
$module = $check->is_letter($_REQUEST['module']) ? $_REQUEST['module'] : 'product';
switch ($module) {
    case 'article' : 
        $name_field = 'title';
        $search_url = 'search.php?module=article&srcval=';
        break;
    default :// 产品模块
        $name_field = 'name';
        $search_url = 'search.php?srcval=';
        break;
}
$smarty->assign('module', $module);
$smarty->assign('srcval', $srcval);

// 筛选条件
// $where = ' WHERE (a.'.$name_field." LIKE '%$srcval%' OR a.keywords LIKE '%$srcval%') AND a.lang_id=$lang_type";
$where = sprintf("WHERE (a.%s LIKE '%s' OR a.keywords LIKE '%s') AND a.lang_id='%d'",$name_field,$srcval,$srcval,$lang_type);
$search_url = ROOT_URL . $search_url . $srcval;
// $search_url = $dou->rewrite_url('search', $cat_id);

// 获取分页信息
$page = $check->is_number($_REQUEST['page']) ? $_REQUEST['page'] : 1;
$where2 = str_replace('a.','',$where);
$limit = $dou->pager($module, ($_DISPLAY[$module] ? $_DISPLAY[$module] : 25), $page, $search_url, $where2, '', '', true);

/* 获取搜索结果列表 */
// $fields = $dou->create_fields_quote('*','a');
$sql = "SELECT a.*,b.cat_name FROM ". $dou->table($module) .' a LEFT JOIN '. $dou->table($module.'_category') .' b ON a.cat_id=b.cat_id '. $where .' ORDER BY id DESC' . $limit;
$query = $dou->query($sql);
while ($row = $dou->fetch_array($query)) {
    $row['url'] = $dou->rewrite_url($module, $row['id']);
    $row['add_time_short'] = date("m-d", $row['add_time']);
    $row['add_time'] = date("Y-m-d H:i:s", $row['add_time']);
    $row['description'] = $row['description'] ? $row['description'] : $dou->dou_substr($row['content'], 150);
    // 生成缩略图的文件名
    $image = explode('.', $row['image']);
    $row['thumb'] = ROOT_URL . $image[0] . '_thumb.' . $image[1];
    $row['price'] = $row['price'] > 0 ? $dou->price_format($row['price']) : $_LANG['price_discuss'];
    $row['name'] = $row['title'] = $row[$name_field];

    $search_list[] = $row;
}

$search_results = preg_replace('/d%/Ums', $srcval, $_LANG['search_results']);

// 赋值给模板-meta和title信息
$smarty->assign('page_title', $dou->page_title('search', '', $search_results));
$smarty->assign('keywords', $_CFG['site_keywords']);
$smarty->assign('description', $_CFG['site_description']);

// 赋值给模板-导航栏
// $smarty->assign('nav_top_list', $dou->get_nav('top'));
$smarty->assign('nav_middle_list', $dou->get_nav('middle'));
$smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

// 赋值给模板-数据
// $smarty->assign('ur_here', $search_results);
// $smarty->assign('product_category', $dou->get_category('product_category'));
// $smarty->assign('article_category', $dou->get_category('article_category'));
$smarty->assign('search_list', $search_list);

$smarty->display('search.dwt');

// 终止执行文件外的程序
// exit();

?>