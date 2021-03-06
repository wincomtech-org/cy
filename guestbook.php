<?php
define('IN_LOTHAR', true);

$sub = 'insert|del';
$subbox = array(
        "module" => 'guestbook',
        "sub" => $sub
);
require (dirname(__FILE__) . '/include/init.php');
require ROOT_PATH .'public.php';

// rec操作项的初始化
$rec = $check->is_rec($_REQUEST['rec']) ? $_REQUEST['rec'] : 'default';

/**
 * +----------------------------------------------------------
 * 留言板
 * +----------------------------------------------------------
 */
if ($rec == 'default') {
    // // SQL查询条件
    // $where = " WHERE if_show = '1'";

    // // 获取分页信息
    // $page = $check->is_number($_REQUEST['page']) ? trim($_REQUEST['page']) : 1;
    // $limit = $dou->pager('guestbook', 10, $page, $dou->rewrite_url('guestbook'), $where);

    // $sql = "SELECT * FROM " . $GLOBALS['dou']->table('guestbook') . $where . " ORDER BY id DESC" . $limit;
    // $query = $GLOBALS['dou']->query($sql);
    // while ($row = $GLOBALS['dou']->fetch_array($query)) {
    //     $add_time = date("Y-m-d", $row['add_time']);
    //     // 获取管理员回复
    //     $reply = "SELECT content, add_time FROM " . $dou->table('guestbook') . " WHERE reply_id = '$row[id]'";
    //     $reply = $dou->fetch_array($dou->query($reply));
    //     $reply_time = date("Y-m-d", $reply['add_time']);
    //     $guestbook[] = array(
    //             "id" => $row['id'],
    //             "title" => $row['title'],
    //             "name" => $row['name'],
    //             "content" => $row['content'],
    //             "add_time" => $add_time,
    //             "reply" => $reply['content'],
    //             "reply_time" => $reply_time
    //     );
    // }

    // // 初始化回复方式
    // $contact_type = array('email', 'tel', 'qq');
    // foreach ($contact_type as $value) {
    //     $selected = ($value == $post['contact_type']) ? ' selected="selected"' : '';
    //     $option .= "<option value=" . $value . $selected . ">" . $_LANG['guestbook_' . $value] . "</option>";
    // }

    // // CSRF防御令牌生成
    $smarty->assign('token', $firewall->set_token('guestbook'));

    // 赋值给模板-meta和title信息
    $smarty->assign('page_title', $dou->page_title('guestbook'));
    $smarty->assign('keywords', $_CFG['site_keywords']);
    $smarty->assign('description', $_CFG['site_description']);

    // // 赋值给模板-导航栏
    // $smarty->assign('nav_top_list', $dou->get_nav('top'));
    $smarty->assign('nav_middle_list', $dou->get_nav('middle', 0, 'guestbook', 0));
    $smarty->assign('nav_bottom_list', $dou->get_nav('bottom'));

    // // 赋值给模板-数据
    // $smarty->assign('ur_here', $dou->ur_here('guestbook'));
    // $smarty->assign('rec', $rec);
    // $smarty->assign('insert_url', $_URL['insert']);
    // $smarty->assign('option', $option);
    // $smarty->assign('guestbook', $guestbook);
    $smarty->assign('countrys', $countrys);
    $smarty->assign('Inquiry_Type', $Inquiry_Type);

    $smarty->display('consultation.html');
}

/**
 * +----------------------------------------------------------
 * 留言添加
 * +----------------------------------------------------------
 */
if ($rec == 'insert') {
    // 安全处理用户输入信息
    $_POST = $firewall->dou_foreground($_POST);
    extract($_POST);
    $ip = $dou->get_ip();
    // 如果限制必须输入中文则修改错误提示
    $include_chinese = $_CFG['guestbook_check_chinese'] ? $_LANG['guestbook_include_chinese'] : '';

    // 验证联系人
    $uname = $lastname . $firstname;
    if ($check->is_illegal_char($uname)) {
        $wrong['name'] = $_LANG['guestbook_name'] . $_LANG['illegal_char'];
    } elseif (!check_guestbook($uname, 200)) {
        $wrong['name'] = preg_replace('/d%/Ums', $include_chinese, $_LANG['guestbook_name_wrong']);
    }

    // 验证邮编
    // if (!$check->is_postcode($postcode)) {
    //     $wrong['postcode'] = '邮编格式不正确';
    // }

    // 验证邮箱
    if (!$check->is_email($email)) {
        $wrong['email'] = '邮箱格式不正确';
    }

    // 验证主题
    if ($check->is_illegal_char($title)) {
        $wrong['title'] = $_LANG['guestbook_title'] . $_LANG['illegal_char'];
    } elseif (!check_guestbook($title, 200)) {
        $wrong['title'] = preg_replace('/d%/Ums', $include_chinese, $_LANG['guestbook_title_wrong']);
    }

    // 验证留言内容
    if ($check->is_illegal_char($content)) {
        $wrong['content'] = $_LANG['guestbook_content'] . $_LANG['illegal_char'];
    } elseif (!check_guestbook($content, 300)) {
        $wrong['content'] = preg_replace('/d%/Ums', $include_chinese, $_LANG['guestbook_content_wrong']);
    }

    // 判断验证码
    // $captcha = $check->is_captcha($_POST['captcha']) ? strtoupper($_POST['captcha']) : '';
    // if ($_CFG['captcha'] && md5($captcha . DOU_SHELL) != $_SESSION['captcha'])
    //     $wrong['captcha'] = $_LANG['captcha_wrong'];

    // AJAX验证表单
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
        $dou->dou_msg($wrong_format, $_URL['guestbook']);
    }

    // 检查IP是否频繁留言
    if (is_water($ip))
        $dou->dou_msg($_LANG['guestbook_is_water'], $_URL['guestbook']);

    // CSRF防御令牌验证
    $firewall->check_token($token, 'guestbook');

    $data = array(
            'toname'    => $toname,
            'name'      => $uname,
            'sex'       => $sex,
            // 'organisation' => $organisation,
            'country'   => $country,
            // 'address'   => $address,
            // 'postcode'  => $postcode,
            'telephone' => $telephone,
            'email'     => $email,
            'title'     => $title,
            'content'   => $content,
            'ip'        => $ip,
            'add_time'  => CTIME,
        );
    $res = $dou->insert('guestbook',$data);
    if ($res) {
        // 发送留言成功告知邮件
        $body = $_LANG['guestbook_body_0'] . $email . $_LANG['guestbook_body_1'] . $_CFG['site_name'] .'. '. $site_url;
        $dou->send_mail($email, $_LANG['guestbook_send_title'], $body);
        // if ($dou->send_mail($email, $_LANG['guestbook_send_title'], $body)) {
        //     $dou->dou_msg($_LANG['user_password_mail_success'] . $user['email'], ROOT_URL, 30);
        // } else {
        //     $dou->dou_msg($_LANG['mail_send_fail'], $_URL['password_reset'], 30);
        // }
        $dou->dou_msg($_LANG['guestbook_insert_success'], $_CFG['root_url']);
    } else {
        $dou->dou_msg($_LANG['guestbook_insert_failed'], $_URL['guestbook']);
    }

}

/**
 * +----------------------------------------------------------
 * 防灌水
 * +----------------------------------------------------------
 */
function is_water($ip) {
    $unread_messages = $GLOBALS['dou']->get_one("SELECT COUNT(*) FROM " . $GLOBALS['dou']->table('guestbook') . " WHERE ip='$ip' AND if_read=0 AND reply_id=0");

    // 如果管理员未回复的留言数量大于3
    if ($unread_messages >= '3')
        return true;
}

/**
 * +----------------------------------------------------------
 * 检查是否包含中文字符且长度符合要求
 * +----------------------------------------------------------
 */
function check_guestbook($value, $length) {
    $check_chinese = $GLOBALS['_CFG']['guestbook_check_chinese'] ? $GLOBALS['check']->if_include_chinese($value) : true;

    if ($check_chinese && $GLOBALS['check']->ch_length($value, $length)) {
        return true;
    }
}
?>