<?php
define('IN_LOTHAR', true);
// 强制在移动端中显示PC版
if (isset($_REQUEST['mobile'])) {
    setcookie('client', 'pc');
    if ($_COOKIE['client'] != 'pc') $_COOKIE['client'] = 'pc';
}
require (dirname(__FILE__) . '/include/init.php');
require ROOT_PATH .'public.php';
// 特殊处理
if ($GLOBALS['lang_type']==2) {
    $about_ID = 2;
    $recommend_article_ID = 4;
    $article_activity_ID = 5;
} else {
    $about_ID = 1;
    $recommend_article_ID = 1;
    $article_activity_ID = 2;
}

// 获取关于我们信息
$sql = 'SELECT page_name,content,image,description FROM '. $dou->table('page') .' WHERE id='.$about_ID;
$about = $dou->fetchRow($sql);
// 写入到index数组
$index['about_name'] = $about['page_name'];
$index['image'] = $about['image']?ROOT_URL.$about['image']:ROOT_URL.'images/nopic_s_100x100.jpg';
$index['about_content'] = $about['description'] ? $about['description'] : $dou->dou_substr($about['content'], 260, false); // 这里的300数值不能设置得过大，否则会造成程序卡死
$index['about_link'] = $dou->rewrite_url('page', $about_ID);
$index['cur'] = true;// 当前导航标志

// 赋值给模板-meta和title信息
$smarty->assign('page_title', $dou->page_title());
$smarty->assign('keywords', $_CFG['site_keywords']);
$smarty->assign('description', $_CFG['site_description']);

// 赋值给模板-导航栏
// $smarty->assign('nav_top_list', $dou->get_nav('top'));
$smarty->assign('nav_middle_list', $dou->get_nav('middle'));
$smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

// 赋值给模板-数据
$smarty->assign('show_list', $dou->get_show_list());
$smarty->assign('show_list2', $dou->get_show_list('center'));
// $smarty->assign('link', $dou->get_link_list());
$smarty->assign('index', $index);
// $smarty->assign('recommend_product', $dou->get_list('product', 'ALL', $_DISPLAY['home_product'], 'sort DESC'));
$smarty->assign('recommend_article', $dou->get_list('article', $recommend_article_ID, $_DISPLAY['home_article'], 'sort DESC'));
$smarty->assign('article_activity', $dou->get_list('article', $article_activity_ID, $_DISPLAY['home_article'], 'sort DESC'));

// $dou->debug($index[image]);

$smarty->display('index.html');
?>
