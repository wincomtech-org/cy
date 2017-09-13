<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';

if (isset($_POST['op'])) {
    // 安全处理用户输入信息
    $_POST = $firewall->dou_foreground($_POST);
    extract($dou->trim_arr($_POST));
    
    // 验证昵称
    if (isset($nickname) && $check->is_illegal_char($nickname))
        $wrong['nickname'] = $_LANG['user_nickname'] . $_LANG['illegal_char'];
    // 验证手机
    if (!$check->is_telephone($telephone))
        $wrong['telephone'] = $_LANG['user_telephone_cue'];
    // 验证联系人
    if (!$contact) {
        $wrong['contact'] = $_LANG['user_contact_empty'];
    } elseif ($check->is_illegal_char($contact)) {
        $wrong['contact'] = $_LANG['user_contact'] . $_LANG['illegal_char'];
    }
    // 验证地址
    if (!$address) {
        $wrong['address'] = $_LANG['user_address_empty'];
    } elseif ($check->is_illegal_char($address)) {
        $wrong['address'] = $_LANG['user_address'] . $_LANG['illegal_char'];
    }
    // 验证邮政编码
    // if (isset($_POST['postcode']) && !$check->is_postcode($_POST['postcode']))
    //     $wrong['postcode'] = $_LANG['user_postcode_cue'];
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
        $dou->dou_msg($wrong_format, $_URL['edit']);
    }

    // 图片上传
    if ($_FILES['avatar']['name'] != ''){
        include_once (ROOT_PATH . 'include/upload.class.php');
        $images_dir = 'images/user/'; // 文件上传路径，结尾加斜杠
        $thumb_dir = ''; // 缩略图路径（相对于$images_dir） 结尾加斜杠，留空则跟$images_dir相同
        $img = new Upload(ROOT_PATH . $images_dir, $thumb_dir); // 实例化类文件
        if (!file_exists(ROOT_PATH . $images_dir))
            mkdir(ROOT_PATH . $images_dir, 0777);
        $_CFG['thumb_width'] = 123;$_CFG['thumb_height'] = 123;
        $image_name = $img->upload_image('avatar', $img->create_file_name('user', $_POST['id'], 'avatar', 'user_id'));
        $image = $images_dir . $image_name;
        $img->make_thumb($image_name, $_CFG['thumb_width'], $_CFG['thumb_height']);
    }
    
    // 格式化自定义参数
    // $_POST['defined'] = str_replace("\r\n", ',', $_POST['defined']);

    // CSRF防御令牌验证
    $firewall->check_token($_POST['token'], 'user_edit');

    $data = array(
            'nickname'      => $nickname,
            'truename'      => $truename,
            'telephone'     => $telephone,
            'contact'       => $contact,
            'address'       => $address,
            // 'defined'       => $defined,
        );
    if ($image) 
        $data['avatar'] = $image;
    // $dou->debug($data,1);
    $res = $dou->update('user',$data,'user_id='.$gUid);
    if ($res) {
        $dou->dou_msg($_LANG['user_edit_success'], $_URL['user']);
    } else {
        $dou->dou_msg($_LANG['user_edit_failed'], $_URL['edit']);
    }

} else {

    $user_info = $dou_user->get_user_info($gUid);
    // 生成缩略图的文件名
    $image = explode('.', $user_info['avatar']);
    $user_info['thumb'] = ROOT_URL . $image[0] . "_thumb." . $image[1];
    // $user_info['avatar'] = ROOT_URL . $user_info['avatar'];
    // $dou->debug($user_info,1);
    // CSRF防御令牌生成
    $smarty->assign('token', $firewall->set_token('user_edit'));
    
    /*// 格式化自定义参数
    if ($_DEFINED['user'] || $user_info['defined']) {
        $defined = explode(',', $_DEFINED['user']);
        foreach ($defined as $row) {
            $defined_user .= $row . "：\n";
        }
        // 如果产品中已经写入自定义参数则调用已有的
        $user_info['defined'] = $user_info['defined'] ? str_replace(",", "\n", $user_info['defined']) : trim($defined_user);
        $user_info['defined_count'] = count(explode("\n", $user_info['defined'])) * 2;
    }*/

    // 赋值给模板
    $smarty->assign('page_title', $dou->page_title('user', 'user_edit'));
    // $smarty->assign('ur_here', $dou->ur_here('user', 'user_edit'));
    $smarty->assign('user_info', $user_info);

    $smarty->display('user/personal_details.html');
}
?>