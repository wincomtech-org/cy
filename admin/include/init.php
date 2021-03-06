<?php
if (!defined('IN_LOTHAR')) die('Hacking attempt');
// 显示除了E_NOTICE(提示)和E_WARNING(警告)外的所有错误
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
// 调整时区
if (PHP_VERSION >= '5.1') date_default_timezone_set('PRC');
// 开启SESSION
if (!session_id()) session_start();

// 网站后台标记
define('IS_ADMIN', true);
define('SMARTY_CONF', 2);

// 定义DouPHP基础常量
include_once ('../data/config.php');
define('ROOT_PATH', str_replace(ADMIN_PATH . '/include/init.php', '', str_replace('\\', '/', __FILE__)));
define('ROOT_HOST', 'http://' . $_SERVER['HTTP_HOST']);
define('ROOT_URL', preg_replace('/' . ADMIN_PATH . '\//Ums', '', dirname('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF']) . "/"));
define('M_URL', ROOT_URL . M_PATH . '/');

if (!file_exists(ROOT_PATH . "data/system.dou")) {
    header("Location: ../install/index.php\n");
    exit();
}

// 载入DouPHP核心文件
require (ROOT_PATH . 'include/mysql.class.php');
require (ROOT_PATH . 'include/common.class.php');
require (ROOT_PATH . ADMIN_PATH . '/include/action.class.php');
require (ROOT_PATH . ADMIN_PATH . '/include/rbac.class.php');
require (ROOT_PATH . 'include/check.class.php');
require (ROOT_PATH . 'include/firewall.class.php');
require (ROOT_PATH . 'include/memory.class.php');

// 实例化DouPHP核心类
$dou = new Action($dbhost, $dbuser, $dbpass, $dbname, $prefix, DOU_CHARSET);
$rbac = new RBAC();
$check = new Check();
$firewall = new Firewall();
// $memory = new Memory();

// 定义系统标识
define('DOU_SHELL', $dou->get_one("SELECT value FROM " . $dou->table('config') . " WHERE name = 'hash_code'"));
define('DOU_ID', 'admin_' . substr(md5(DOU_SHELL . 'admin'), 0, 5));

// 豆壳防火墙
$firewall->dou_firewall();

// 设置页面缓存和编码
header('content-type: text/html; charset=' . DOU_CHARSET);
header('Expires: Fri, 14 Mar 1980 20:53:00 GMT');
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
header('Cache-Control: no-cache, must-revalidate');
header('Pragma: no-cache');

// 开启缓冲区
ob_start();

// SMARTY配置
// \include\smarty.init.php
// 注意后台这里没有载入模块文件，需要加
require_once ROOT_PATH . 'include/smarty.init.php';

// 验证管理员
$smarty->assign("user", $_USER = $dou->admin_check($_SESSION[DOU_ID]['user_id'], $_SESSION[DOU_ID]['shell']));
/*
var_export($_USER);
// array(
//   'user_id' => '1',
//   'user_name' => 'admin',
//   'email' => '',
//   'action_level' => '99',
// )
*/

// 语言包控制管理
// 注意后台这里没有载入模块文件，需要加
require_once ROOT_PATH . 'include/lang.init.php';

// 读取站点信息
$smarty->assign("site", $_CFG = $dou->get_config());
// $dou->debug($_CFG['defined'],1);
$_CFG['lang_type'] = $lang_type;
require ROOT_PATH . ADMIN_PATH . '/include/image_thumb.config.php';

// 系统模块
$_MODULE = $dou->dou_module();

// 涉及权限的栏目
// $rbac_role = array();
// $rbac_module = array();
// foreach ($_MODULE['all'] as $mdl) {
//     $rbac_module[] = $mdl;
// }
// $rbac_module_sum = array_push($rbac_module,'system','nav','show','page','backup','mobile','theme','manager','rbac','manager_log','module','cloud','main','display','defined','mail','district');
// $dou->debug($rbac_module);
// 权限判断
// $access_module = $rbac->access_module(2);
// $dou->debug($access_module);
// $_access = $rbac->access_check('user',2);
// $dou->debug($_access,1,1);

// 载入语言文件
foreach ($_MODULE['lang'] as $lang_file) {
    require ($lang_file); // 载入系统语言文件
}

// 载入模块文件
// foreach ((array)$_MODULE['init'] as $init_file) {
//     require_once ($init_file);
// }

// 如果存在自定义类则载入
if (file_exists($other_class_file = ROOT_PATH . 'include/other.class.php')) {
      require ($other_class_file);
      $other = new Other();
}

// 工作空间
$smarty->assign("workspace", $dou->dou_workspace());
// echo $_CFG['lang_type'];
// 通用信息调用
$smarty->assign("lang", $_LANG);
$smarty->assign("site", $_CFG);
$_DISPLAY = unserialize($_CFG['display']); // 显示设置
$_DEFINED = unserialize($_CFG['defined']); // 自定义属性

// $dou->debug($_SERVER);
// $dou->debug($GLOBALS,1);
?>