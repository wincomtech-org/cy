<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';
// $dou->debug($_POST,1);

if (isset($_POST['op'])) {
    extract($dou->trim_arr($_POST));
    // 验证并获取合法的邮箱
    if (!$email)
        $dou->dou_msg($_LANG['user_email_cue'], $_URL['login']);
    $email = $check->is_email($email) ? $email : '';
    $password = $check->is_password($password) ? $password : '';
    // 判断验证码
    $captcha = $check->is_captcha($captcha) ? strtoupper($captcha) : '';
    if ($_CFG['captcha'] && md5($captcha.DOU_SHELL) != $_SESSION['captcha'])
        $dou->dou_msg($_LANG['captcha_wrong'], $_URL['login']);

    // 如果用户名存在则获取用户信息
    $user = $dou->fetch_array($dou->select($dou->table('user'), '*', "email = '$email'"));
    // 验证用户是否存在和密码是否正确
    if (!is_array($user)) {
        $dou->dou_msg($_LANG['user_login_wrong'], $_URL['login']);
    } elseif (md5($password) != $user['password']) {
        $dou->dou_msg($_LANG['user_login_wrong'], $_URL['login']);
    }
    
    // 会员登录信息验证成功则写入SESSION
    $_SESSION[DOU_ID]['user_id'] = $user['user_id'];
    $_SESSION[DOU_ID]['shell'] = md5($user['email'] . $user['password'] . DOU_SHELL);
    $_SESSION[DOU_ID]['ontime'] = CTIME;
    
    $last_login = $dou_user->log_update($user['last_login'], CTIME);
    $last_ip = $dou_user->log_update($user['last_ip'], $dou->get_ip());
    $login_count = $user['login_count'] + 1;
    
    // CSRF防御令牌验证
    $firewall->check_token($_POST['token'], 'user_login');
    
    $dou->query("update ". $dou->table('user') ." SET login_count='$login_count', last_login='$last_login', last_ip='$last_ip' WHERE user_id=". $user['user_id']);
    
    $dou->dou_msg($_LANG['user_login_success'], urldecode($return_url));

} else {
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->set_token('user_login'));
    
    $return_url = $_REQUEST['return_url'] ? $_REQUEST['return_url'] : urlencode($_SERVER['HTTP_REFERER']);
    
    // 赋值给模板息
    $smarty->assign('page_title', $dou->page_title('user', 'user_login'));
    // $smarty->assign('ur_here', $dou->ur_here('user', 'user_login'));
    $smarty->assign('return_url', $return_url);
    
    $smarty->display('user/login.html');
}
?>