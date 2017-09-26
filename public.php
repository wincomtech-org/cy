<?php
// if (!defined('IN_LOTHAR')) die('Hacking attempt');

// 导航 -- 产品三级分类，由于中英文的存在，暂时关闭缓存
// if ($memory->get('nav_product')) {
//     $nav_product = $memory->get('nav_product');
// } else {
    // $nav_product = array(
    //         'url'=>'product_category.php',
    //         'cur'=>1,'nav_name'=>$_LANG['product_tag'],
    //         'child'=>$dou->get_category('product_category')
    //     );
    $nav_product = $dou->get_category('product_category');
    // $memory->set('nav_product',$nav_product);
// }
$smarty->assign('nav_product',$nav_product);

// 用户信息 $_USER 只有 user_id 和 user_name 信息
if ($_SESSION[DOU_ID]) {
    $gUid = intval($_SESSION[DOU_ID]['user_id']);
    if ($gUid) {
        $gUinfos = $dou->fetchRow(sprintf('SELECT * from %s where user_id=%d',$dou->table('user'),$gUid));
    }
}

// 从后台传过来的
if (isset($_GET['fuid'])) {
    $fuid = intval($_GET['fuid']);
    $sUinfo = $dou->fetchRow('SELECT user_id,email,password from '. $dou->table('user') .' where user_id='.$fuid);
    unset($_SESSION[DOU_ID]);
    $_SESSION[DOU_ID]['user_id'] = $sUinfo['user_id'];
    $_SESSION[DOU_ID]['shell'] = md5($sUinfo['email'] . $sUinfo['password'] . DOU_SHELL);
    $_SESSION[DOU_ID]['ontime'] = CTIME;
    $dou->dou_header($_URL['order']);
}

// 国家
$countrys = $dou->fetchAll(sprintf('SELECT cat_id,unique_id,cat_name from %s order by sort',$dou->table('district')));
// 地区 district
/*DIY表数据*/
$diys = $dou->fetchAll(sprintf('SELECT id,title,title2,cat_id from %s order by sort',$dou->table('diy')));
if ($diys) {
    foreach ($diys as $value) {
        $diys_c[$value['cat_id']][] = $value;
    }
}
// 所属领域
$industrys = $diys_c[1];
// 职业
$posts = $diys_c[2];
// 部门
$Inquiry_Type = $diys_c[3];



// $dou->debug($nav_product);
// $dou->debug($countrys);

// $dou->debug(ROOT_PATH,1);
// $dou->debug($_CFG);
// $dou->debug($GLOBALS['_CFG']);
// $dou->debug($_LANG);
// $dou->debug($_URL);
// $dou->debug($_OPEN);
// $dou->debug($_DISPLAY);
// $dou->debug($_DEFINED);
// $dou->debug($_SESSION[DOU_ID]['user_id']);
// $dou->debug($_SESSION[DOU_ID]['shell'],1);
// $dou->debug($_USER);

// unset($_SESSION);
// session_unset();
// session_destroy();
// $dou->debug($_SESSION,1);
// $dou->debug($GLOBALS,1);
// $dou->debug($_SERVER,1);









// $phpself = $_SERVER['PHP_SELF'];
// $forbid_url = array(
//         '/pay.php',
//         '/include/weixin/example/native.php',
//         '/include/weixin/return.php',
//         '/include/pay/alipayto.php',
//         '/include/pay/return_url.php'
//     );
// if (in_array($phpself,$forbid_url)) {
//     $dou->dou_msg('非法进入！');
// }

// $dou->debug(ROOT_PATH);
// $dou->debug($gUinfos,1);

?>