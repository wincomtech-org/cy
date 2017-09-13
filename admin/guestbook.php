<?php
define('IN_LOTHAR', true);
require (dirname(__FILE__) . '/include/init.php');
// 权限判断
$rbac->access_jump('guestbook',$_USER);

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

// 赋值给模板
$smarty->assign('rec', $rec);
$smarty->assign('cur', 'guestbook');

/**
 * +----------------------------------------------------------
 * 留言列表
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    $smarty->assign('ur_here', $_LANG['guestbook']);

    // SQL查询条件
    $where = " WHERE reply_id = '0'";
    
    // 验证并获取合法的分页ID
    $page = $check->is_number($_REQUEST['page']) ? $_REQUEST['page'] : 1;
    $limit = $dou->pager('guestbook', 15, $page, 'guestbook.php', $where);
    
    $sql = "SELECT id,title,toname,name,sex,country,email,telephone,if_show,if_read,ip,add_time FROM " . $dou->table('guestbook') . $where . " ORDER BY id DESC" . $limit;
    $query = $dou->query($sql);
    while ($row = $dou->fetch_array($query)) {
        $row['if_show'] = $row['if_show'] ? $_LANG['display'] : $_LANG['hidden'];
        $row['sex'] = $row['sex'] ? $_LANG['user_man'] : $_LANG['user_woman'];
        $row['add_time'] = date("Y-m-d", $row['add_time']);

        $book_list[] = $row;
    }
    
    $smarty->assign('book_list', $book_list);
    $smarty->display('guestbook.htm');
} 

/**
 * +----------------------------------------------------------
 * 留言查看
 * +----------------------------------------------------------
 */
elseif ($rec == 'read') {
    $smarty->assign('ur_here', $_LANG['guestbook_read']);
    $smarty->assign('action_link', array(
            'text' => $_LANG['guestbook_list'],
            'href' => 'guestbook.php' 
    ));
    
    $id = trim($_REQUEST['id']);
    
    // 获取留言信息
    $query = $dou->select($dou->table('guestbook'), '*', '`id`=\''. $id .'\'');
    $guestbook = $dou->fetch_array($query);
    $guestbook['sex'] = $guestbook['sex'] ? $_LANG['user_man'] : $_LANG['user_woman'];
    $guestbook['add_time'] = date("Y-m-d", $guestbook['add_time']);
    
    // 获取管理员回复
    $sql = "SELECT content, add_time FROM " . $dou->table('guestbook') . " WHERE reply_id='$id'";
    $query = $dou->query($sql);
    $reply = $dou->fetch_array($query);
    $reply['add_time'] = date("Y-m-d", $reply['add_time']);
    
    // 将留言信息更新为已读
    $read = "UPDATE " . $dou->table('guestbook') . " SET if_read = '1' WHERE id='$id'";
    $dou->query($read);
    
    $smarty->assign('guestbook', $guestbook);
    $smarty->assign('reply', $reply);
    $smarty->display('guestbook.htm');
} 

/**
 * +----------------------------------------------------------
 * 留言回复
 * +----------------------------------------------------------
 */
elseif ($rec == 'reply') {
    $name = time();
    $ip = $dou->get_ip();
    $add_time = time();
    
    $sql = "INSERT INTO " . $dou->table('guestbook') . " (id, name, content, ip, add_time, reply_id)" . " VALUES (NULL, '$_USER[user_name]', '$_POST[content]', '$ip', '$add_time', '$_POST[id]')";
    $dou->query($sql);
    
    $dou->create_admin_log($_LANG['guestbook_reply'] . ': ' . $_POST[title]);
    
    $dou->dou_msg($_LANG['guestbook_insert_success'], 'guestbook.php');
} 

/**
 * +----------------------------------------------------------
 * 显示或隐藏
 * +----------------------------------------------------------
 */
elseif ($rec == 'show_hidden') {
    $id = trim($_REQUEST['id']);
    $if_show = $dou->get_one("SELECT if_show FROM " . $dou->table('guestbook') . " WHERE id='$id'");
    $if_show = $if_show ? 0 : 1;
    
    // 更新留言信息显示状态
    $read = "UPDATE " . $dou->table('guestbook') . " SET if_show = '$if_show' WHERE id='$id'";
    $dou->query($read);
    
    echo "<em class=" . ($if_show ? 'd' : 'h') . "><b>$_LANG[display]</b><s>$_LANG[hidden]</s></em>";
} 

/**
 * +----------------------------------------------------------
 * 批量留言删除
 * +----------------------------------------------------------
 */
elseif ($rec == 'del_all') {
    if (is_array($_POST['checkbox'])) {
        $checkbox = $dou->create_sql_in($_POST['checkbox']);
        
        // 删除留言
        $sql = "DELETE FROM " . $dou->table('guestbook') . " WHERE id " . $checkbox;
        $dou->query($sql);
        
        $dou->create_admin_log($_LANG['guestbook_del'] . ": GUESTBOOK " . addslashes($checkbox));
        $dou->dou_msg($_LANG['del_succes'], 'guestbook.php');
    } else {
        $dou->dou_msg($_LANG['guestbook_select_empty'], 'guestbook.php');
    }
}
?>