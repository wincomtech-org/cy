<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';

if (isset($_POST['op'])) {
    extract($dou->trim_arr($_POST));

    // 安全处理用户输入信息
    $email = $firewall->dou_foreground($email);
    // 验证用户名
    if (!$check->is_email($email)) {
        $wrong['email'] = $_LANG['user_email_cue'];
    } elseif ($dou->value_exist('user', 'email', $email)) {
        $wrong['email'] = $_LANG['user_email_exists'];
    }
    // 验证密码
    if (!$check->is_password($password))
        $wrong['password'] = $_LANG['user_password_cue'];
    // 验证确认密码
    if (!isset($wrong['password']) && ($password_confirm!==$password))
        $wrong['password_confirm'] = $_LANG['user_password_confirm_cue'];
    // AJAX验证表单 需要设置语言包
    if ($_REQUEST['do'] == 'callback') {
        if ($wrong) {
            foreach ($_POST as $key => $value) {
                $wrong_json[$key] = $wrong[$key];
            }
            echo json_encode($wrong_json);
        }
        exit;
    }
    if ($wrong) {
        foreach ($wrong as $key => $value) {
            $wrong_format .= $wrong[$key] . '<br>';
        }
        $dou->dou_msg($wrong_format, $_URL['register']);
    }

    // 格式化数据
    // $nickname = $lastname . $firstname;
    $truename = $lastname . $firstname;
    $password = md5($password);
    $sex = intval($sex);
    $last_login = CTIME;
    $last_ip = $dou->get_ip();
    $login_count = $user['login_count'] + 1;
    
    // CSRF防御令牌验证
    $firewall->check_token($token, 'user_register');
    
    // 保存到数据库
    $data = array(
            'email'         => $email,
            'password'      => $password,
            'sex'           => $sex,
            'truename'      => $truename,
            'telephone'     => $telephone,
            'country'       => $country,
            'company'       => $company,
            'post'          => $post,
            'industry'      => $industry,
            'add_time'      => CTIME,
            'login_count'   => $login_count,
            'last_login'    => $last_login,
            'last_ip'       => $last_ip
        );
    $res = $dou->insert('user',$data);

    if ($res) {
        // 注册成功后直接登录
        $user = $dou->fetch_array($dou->select($dou->table('user'), '*', "email='$email'"),MYSQL_ASSOC);
        // $user = $dou->fetchRow(sprintf('SELECT * from %s where email=%s',$dou->table('user'),"'$email'"));
        // 将会员登录信息写入SESSION
        $_SESSION[DOU_ID]['user_id'] = $user['user_id'];
        $_SESSION[DOU_ID]['shell'] = md5($user['email'] . $user['password'] . DOU_SHELL);
        $_SESSION[DOU_ID]['ontime'] = CTIME;

        $dou->dou_msg($_LANG['user_insert_success'], $_URL['user']);
    } else {
        $dou->dou_msg($_LANG['user_insert_error'], $_URL['register']);
    }

} else {
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->set_token('user_register'));
    
    // 赋值给模板
    $smarty->assign('page_title', $dou->page_title('user', 'user_register'));
    $smarty->assign('countrys', $countrys);
    $smarty->assign('industrys', $industrys);
    $smarty->assign('posts', $posts);
    // $smarty->assign('ur_here', $dou->ur_here('user', 'user_register'));
    
    $smarty->display('user/register.html');
}
?>