<?php
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
require ROOT_PATH .'public.php';

// 验证并获取合法的ID，如果不合法将其设定为-1
$id = $firewall->get_legal_id('product', $_REQUEST['id'], $_REQUEST['unique_id']);
if ($id == -1)
    $dou->dou_msg($GLOBALS['_LANG']['page_wrong'], ROOT_URL);
$cat_id = $dou->get_one('SELECT cat_id FROM ' . $dou->table('product') . " WHERE id='$id'");
$parent_id = $dou->get_one('SELECT parent_id FROM ' . $dou->table('product_category') . " WHERE cat_id = '" . $cat_id . "'");

/* 获取产品信息 */
$query = $dou->select($dou->table('product'), '*', '`id`=\''. $id .'\'');
$product = $dou->fetch_assoc($query);
$product['description_format'] = str_replace(PHP_EOL,'<br>',$product['description']);

// 格式化数据
$product['price'] = $product['price'] > 0 ? $dou->price_format($product['price']) : $_LANG['price_discuss'];
$product['add_time'] = date('Y-m-d', $product['add_time']);

// 生成缩略图的文件名
$image = explode('.', $product['image']);
$product['thumb'] = ROOT_URL . $image[0] . '_thumb.' . $image[1];
$product['image'] = ROOT_URL . $product['image'];

// 格式化自定义参数
foreach (explode(',', $product['defined']) as $row) {
    $row = explode('：', str_replace(":", "：", $row));
    if ($row['1']) {
        $defined[] = array(
            "arr" => $row['0'],
            "value" => $row['1']
        );
    }
}
// 当前导航标志
$product['cur'] = true;
// 处理选定字段值
$dou->get_dao_fields();
if ($product['daos']) {
    $daos = unserialize($product['daos']);
    // $product = array_merge($product,$daos);
}
// $dou->debug($daos,1);

// 赋值给模板-meta和title信息
$smarty->assign('page_title', $dou->page_title('product_category', $cat_id, $product['name']));
$smarty->assign('keywords', $product['keywords']);
$smarty->assign('description', $product['description']);

// 赋值给模板-导航栏
// $smarty->assign('nav_top_list', $dou->get_nav('top'));
$smarty->assign('nav_middle_list', $dou->get_nav('middle', '0', 'product_category', $cat_id, $parent_id));
$smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

// 赋值给模板-数据
// $smarty->assign('ur_here', $dou->ur_here('product_category', $cat_id, $product['name']));
$smarty->assign('product_category', $dou->get_category('product_category', 0, $cat_id));
$smarty->assign('product', $product);
$smarty->assign('defined', $defined);
$smarty->assign('daos', $daos);

// $_CFG['deftpl']['product'] = 'product.dwt';
// $thistpl = $product['template']?$product['template']:$_CFG['deftpl']['product'];
// $smarty->display($thistpl);
$smarty->display('product.html');
?>