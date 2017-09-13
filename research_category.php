<?php 
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
require ROOT_PATH .'public.php';

// 验证并获取合法的ID，如果不合法将其设定为-1
// $cat_id = $firewall->get_legal_id('research_category', $_REQUEST['id'], $_REQUEST['unique_id']);
if($GLOBALS[lang_type]==1){
    $cat_id = 1;$team_id = 2;
}elseif($GLOBALS[lang_type]==2){
    $cat_id = 3;$team_id = 4;
}
if ($cat_id == -1) {
    $dou->dou_msg($GLOBALS['_LANG']['page_wrong'], ROOT_URL);
} else {
    $cat_ids = $cat_id . $dou->dou_child_id('research_category', $cat_id);
    if (strpos($cat_ids,',')) {
        $where = ' WHERE cat_id IN ('. $cat_ids .") AND lang_id='{$GLOBALS[lang_type]}'";
    } else {
        $where = ' WHERE cat_id='.$cat_ids . (empty($cat_ids)?" AND lang_id='{$GLOBALS[lang_type]}'":'');
    }
}
#echo $where;die;
// 获取分页信息
$page = $check->is_number($_REQUEST['page']) ? trim($_REQUEST['page']) : 1;
$limit = $dou->pager('research', ($_DISPLAY['research'] ? $_DISPLAY['research'] : 9), $page, $dou->rewrite_url('research_category', $cat_id), $where);
/* 获取研发列表 */
$sql = "SELECT id,title,content,image,cat_id,add_time,click,description FROM ". $dou->table('research') . $where ." ORDER BY sort,id DESC". $limit;
$query = $dou->query($sql);
while ($row = $dou->fetch_array($query,MYSQL_ASSOC)) {
    $row['url'] = $dou->rewrite_url('research', $row['id']);
    $row['add_time'] = date("Y-m-d", $row['add_time']);
    $row['add_time_short'] = date("m-d", $row['add_time']);
    $row['image'] = $row['image'] ? ROOT_URL . $row['image'] : '';
    // 如果描述不存在则自动从详细介绍中截取
    $row['description'] = $row['description'] ? $row['description'] : $dou->dou_substr($row['content'], 200);
    $research_list[] = $row;
}

// 获取分类信息
$sql = "SELECT cat_id,cat_name,parent_id FROM ". $dou->table('research_category') ." WHERE cat_id='$cat_id'";
$cate_info = $dou->fetchRow($sql);

// 研发人员
$sql = sprintf('SELECT id,title,image,role from %s where cat_id=%d order by id limit 4',$dou->table('research'),$team_id);
$query = $dou->query($sql);
while ($row = $dou->fetch_array($query,MYSQL_ASSOC)) {
    $row['image'] = $row['image'] ? ROOT_URL . $row['image'] : '';
    $teams[] = $row;
}

// 最新研发成果
$sql = sprintf('SELECT id,title,content,image,add_time,description from %s %s order by add_time desc limit 3',$dou->table('research'),$where);
$query = $dou->query($sql);
while ($row = $dou->fetch_array($query,MYSQL_ASSOC)) {
    $row['title'] = $dou->dou_substr($row['title'],50);
    $row['add_time'] = date('Y年m月d日',$row['add_time']);
    $row['description'] = $row['description'] ? $row['description'] : $dou->dou_substr($row['content'], 200);
    $row['url'] = $dou->rewrite_url('research',$row['id']);
    if ($row['image']) {
        $thumb = explode('.', $row['image']);
        $row['thumb'] = ROOT_URL . $thumb[0] . "_thumb." . $thumb[1];
    }
    $fresh_research[] = $row;
}
// $dou->debug(count($fresh_research),1);

// 赋值给模板-meta和title信息
$smarty->assign('page_title', $dou->page_title('research_category', $cat_id));
$smarty->assign('keywords', $cate_info['keywords']);
$smarty->assign('description', $cate_info['description']);

// 赋值给模板-导航栏
// $smarty->assign('nav_top_list', $dou->get_nav('top'));
$smarty->assign('nav_middle_list', $dou->get_nav('middle', '0', 'research_category', $cat_id, $cate_info['parent_id']));
$smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

// 赋值给模板-数据
// $smarty->assign('ur_here', $dou->ur_here('research_category', $cat_id));
$smarty->assign('cate_info', $cate_info);
// $smarty->assign('research_category', $dou->get_category('research_category', 0, $cat_id));
$smarty->assign('research_list', $research_list);
$smarty->assign('teams', $teams);
$smarty->assign('fresh_research', $fresh_research);

$smarty->display('research.html');
?>
