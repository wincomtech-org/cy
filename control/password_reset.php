<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';

// 密码重置
if (isset($_POST['op'])) {
    extract($dou->trim_arr($_POST));
    // action 为reset时，说明用户已通过邮箱打开了验证
    $action = $action=='reset' ? 'reset' : 'default';
    
    if ($action == 'default') {
        // 验证用户名
        if (!$dou->value_exist('user', 'email', $email))
            $dou->dou_msg($_LANG['user_email_no_exist'], $_URL['password_reset']);
    
        // 判断验证码
        $captcha = $check->is_captcha($captcha) ? strtoupper($captcha) : '';
        if ($_CFG['captcha'] && md5($captcha . DOU_SHELL) != $_SESSION['captcha'])
            $dou->dou_msg($_LANG['captcha_wrong'], $_URL['password_reset']);
        
        // CSRF防御令牌验证
        $firewall->check_token($token, 'user_password_reset');
        
        // 生成密码找回码
        $user = $dou->fetch_array($dou->select($dou->table('user'), '*', "email='$email'"));
        $time = CTIME;
        $code = substr(md5($user['email'] . $user['password'] . $time . $user['last_login'] . DOU_SHELL) , 0 , 16) . $time;
        $site_url = rtrim(ROOT_URL, '/');
        $mark = strpos($_URL['password_reset'], '?') !== false ? '&' : '?';
        
        $body = $user['email'] . $_LANG['user_password_reset_body_0'] . $_URL['password_reset'] . $mark . 'uid=' . $user['user_id'] .'&code='. $code . $_LANG['user_password_reset_body_1'] . $_CFG['site_name'] .'. '. $site_url;
        // $dou->debug($body,1);
        /*d4dsr@qq.com您好！
        您正在进行密码找回操作,请点击下面的链接重置您的密码(如无法打开，可以直接复制地址到您的浏览器)：
        http://tx.ext2/user.php?rec=password_reset&uid=2&code=c6f581dcb9a1080c1502356633
        (此链接有效期为24小时，如果您没有提交密码重置的请求，请忽略这封邮件)
        成运网站. http://tx.ext2*/
        
        // 发送密码重置邮件
        if ($dou->send_mail($email, $_LANG['user_password_reset_title'], $body)) {
            $dou->dou_msg($_LANG['user_password_mail_success'] . $user['email'], ROOT_URL, 30);
        } else {
            $dou->dou_msg($_LANG['mail_send_fail'], $_URL['password_reset'], 30);
        }
    } elseif ($action == 'reset') {
        // 验证密码
        if (!$check->is_password($password)) {
            $dou->dou_msg($_LANG['user_password_cue']);
        } elseif (($password_confirm !== $password)) {
            $dou->dou_msg($_LANG['user_password_confirm_cue']);
        }

        $user_id = $check->is_number($user_id) ? $user_id : '';
        $code = preg_match("/^[a-zA-Z0-9]+$/", $code) ? $code : '';
        
        if ($dou_user->check_password_reset($user_id, $code)) {
            // 重置密码
            $sql = "UPDATE " . $dou->table('user') . " SET password = '" . md5($password) . "' WHERE user_id = '$user_id'";
            $dou->query($sql);
            $dou->dou_msg($_LANG['user_password_reset_success'], $_URL['login'], 15);
        } else {
            $dou->dou_msg($_LANG['user_password_reset_fail'], ROOT_URL, 30);
        }
    }

} else {
    // uid和code 是区分是否是用户通过 邮箱打开 传过来的验证数据
    $user_id = $check->is_number($_REQUEST['uid']) ? $_REQUEST['uid'] : '';
    $code = preg_match("/^[a-zA-Z0-9]+$/", $_REQUEST['code']) ? $_REQUEST['code'] : '';

    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->set_token('user_password_reset'));
    
    // 赋值给模板
    $smarty->assign('page_title', $dou->page_title('user', 'user_password_reset'));
    // $smarty->assign('ur_here', $dou->ur_here('user', 'user_password_reset'));
    
    if ($user_id && $code) {
        if (!$dou_user->check_password_reset($user_id, $code)) {
            $dou->dou_msg($_LANG['user_password_reset_fail'], ROOT_URL, 30);
        }
        $smarty->assign('user_id', $user_id);
        $smarty->assign('code', $code);
        $smarty->assign('action', 'reset');
        $smarty->assign('formurl', $_URL['password_reset']);
        $smarty->display('user/password.html');
    } else {
        $smarty->assign('action', 'default');
        $smarty->display('user/password_reset.html');
    }
}
?>