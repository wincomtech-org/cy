<?php 
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
require ROOT_PATH .'public.php';

// 验证并获取合法的ID，如果不合法将其设定为-1
$id = $firewall->get_legal_id('job', $_REQUEST['id'], $_REQUEST['unique_id']);
if ($id == -1)
    $dou->dou_msg($GLOBALS['_LANG']['page_wrong'], ROOT_URL);
$cat_id = $dou->get_one("SELECT cat_id FROM " . $dou->table('job') . " WHERE id='$id'");
$parent_id = $dou->get_one("SELECT parent_id FROM " . $dou->table('job_category') . " WHERE cat_id = '" . $cat_id . "'");
    
/* 获取详细信息 */
$query = $dou->select($dou->table('job'), '*', '`id`=\''. $id .'\'');
$job = $dou->fetch_array($query);

// 格式化数据
$job['add_time'] = date("Y-m-d", $job['add_time']);
$job['image'] = $job['image'] ? ROOT_URL . $job['image'] : '';

// 格式化自定义参数
foreach (explode(',', $job['defined']) as $row) {
    $row = explode('：', str_replace(":", "：", $row));
    if ($row['1']) {
        $defined[] = array(
            "arr" => $row['0'],
            "value" => $row['1'] 
        );
    }
}

// 访问统计
$click = $job['click'] + 1;
$dou->query("update " . $dou->table('job') . " SET click = '$click' WHERE id='$id'");

// 赋值给模板-meta和title信息
$smarty->assign('page_title', $dou->page_title('job_category', $cat_id, $job['title']));
$smarty->assign('keywords', $job['keywords']);
$smarty->assign('description', $job['description']);

// 赋值给模板-导航栏
// $smarty->assign('nav_top_list', $dou->get_nav('top'));
$smarty->assign('nav_middle_list', $dou->get_nav('middle', '0', 'job_category', $cat_id, $parent_id));
$smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

// 赋值给模板-数据
// $smarty->assign('ur_here', $dou->ur_here('job_category', $cat_id, $job['title']));
// $smarty->assign('job_category', $dou->get_category('job_category', 0, $cat_id));
// $smarty->assign('lift', $dou->lift('job', $id, $cat_id));
$smarty->assign('job', $job);
$smarty->assign('defined', $defined);

$smarty->display('recruitment_detail.html');
?>