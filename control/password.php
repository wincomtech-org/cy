<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';

if (isset($_POST['op'])) {
    extract($dou->trim_arr($_POST));

    // 获取旧密码
    $old_pwd = $dou->get_one("SELECT password FROM " . $dou->table('user') . " WHERE user_id='$gUid'");
    // 验证原始密码密码
    if (md5($old_password) != $old_pwd)
        $dou->dou_msg($_LANG['user_old_password_cue'], $_URL['password']);
    // 验证密码
    if (!$check->is_password($password))
        $dou->dou_msg($_LANG['user_password_cue'], $_URL['password']);
    if ($old_password == $password) 
        $dou->dou_msg('原密码与新密码一样',$_URL['password']);
    // 验证确认密码
    if (!isset($wrong['password']) && ($password_confirm !== $password))
        $dou->dou_msg($_LANG['user_password_confirm_cue'], $_URL['password']);
    
    // CSRF防御令牌验证
    $firewall->check_token($token, 'user_password');
    
    // $sql = "UPDATE " . $dou->table('user') . " SET password = '" . md5($password) . "' WHERE user_id='$gUid'";
    $sql = sprintf("UPDATE %s SET password='%s' WHERE user_id=%d",$dou->table('user'),md5($password),$gUid);
    $dou->query($sql);

    $dou->dou_msg($_LANG['user_password_success'], $_URL['user']);

} else {

    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->set_token('user_password'));

    // 赋值给模板
    $smarty->assign('page_title', $dou->page_title('user', 'user_password_edit'));
    // $smarty->assign('ur_here', $dou->ur_here('user', 'user_password_edit'));
    $smarty->assign('formurl', $_URL['password']);

    $smarty->display('user/password.html');
}
?>