<?php
define('IN_LOTHAR', true);

$sub =  'login|register|password_reset|logout|'.
        'edit|password|order';
$subbox = array("module" => 'user',"sub" => $sub);
# $dou->dou_url();
require (dirname(__FILE__) . '/include/init.php');
require ROOT_PATH .'public.php';


// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'personal';
$op = $check->is_rec($_REQUEST['op']) ? $_REQUEST['op'] : '';

$no_login = 'login|register|password_reset';// 设定不需要登录权限的页面
if (!in_array($rec, explode('|', $no_login)) && !is_array($_USER)) // 需要登录且没有登录的情况
    $dou->dou_header($_URL['login']);
if (in_array($rec, explode('|', $no_login)) && is_array($_USER)) // 不需要登录却登录的情况
    $dou->dou_header($_URL['user']);

// 赋值给模板-meta和title信息
$smarty->assign('keywords', $_CFG['site_keywords']);
$smarty->assign('description', $_CFG['site_description']);

// 赋值给模板-导航栏
// $smarty->assign('nav_top_list', $dou->get_nav('top'));
$smarty->assign('nav_middle_list', $dou->get_nav('middle', 0, 'user', 0));
$smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

// 赋值给模板-数据
$smarty->assign('rec', $rec);

/**
 * +----------------------------------------------------------
 * 会员中心
 * +----------------------------------------------------------
*/
switch ($rec) {
case 'register':
    # 注册
    require ROOT_PATH .'control/register.php';
    break;

case 'login':
    # 登入
    require ROOT_PATH .'control/login.php';
    break;

case 'password_reset':
    # 忘记密码，找回密码
    require ROOT_PATH .'control/password_reset.php';
    break;

case 'logout':
    # 登出
    unset($_SESSION[DOU_ID]);
    $dou->dou_header(ROOT_URL);
    break;

case 'edit':
    # 会员信息编辑
    require ROOT_PATH .'control/edit.php';
    break;

case 'password':
    # 会员修改密码
    require ROOT_PATH .'control/password.php';
    break;

case 'order':
    # 订单
    require ROOT_PATH .'control/order.php';
    break;

default:
    # 会员中心
    // 获取会员信息
    $user_info = ($gUinfos) ? $gUinfos : $dou_user->get_user_info($gUid);
    // 格式化信息
    $user_info['last_login'] = date("Y-m-d H:i:s", $dou->get_first_log($user_info['last_login']));
    $user_info['last_ip'] = $dou->get_first_log($user_info['last_ip']);

    // 获取购物车信息
    // 引入和实例化订单功能
    if (file_exists($order_file = ROOT_PATH . 'include/order.class.php')) {
        include_once ($order_file);
        $dou_order = new Order();
        $carts = $dou_order->user_cart($gUid);
    }
    $smarty->assign('page_title', $dou->page_title('user'));
    // $smarty->assign('ur_here', $dou->ur_here('user'));
    $smarty->assign('user_info', $user_info);
    $smarty->assign('carts', $carts);
    // $smarty->assign('order_list', $dou_user->get_order_list($gUid));
    $smarty->display('user/personal.html');
    break;
}
?>