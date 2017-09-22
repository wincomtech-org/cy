<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';

// 安全验证
if (in_array($op,array('order_detail','excel','cancel','save'))) {
    $ids = $_REQUEST['ids'] ? $_REQUEST['ids'] : array();
    if (empty($ids)) $dou->dou_msg($_LANG['dou_msg_sel'],$_URL['order']);
}
// 引入和实例化订单功能
if (file_exists($order_file = ROOT_PATH . 'include/order.class.php')) {
    include_once ($order_file);
    $dou_order = new Order();
}

if ($op=='order_detail') {
    # 我的订单
    // 验证并获取合法的ID
    $order_sn = $check->is_number($_REQUEST['order_sn']) ? $_REQUEST['order_sn'] : '';

    $query = $dou->select($dou->table('order'), '*', "order_sn = '$order_sn' AND user_id = '$gUid'");
    $order = $dou->fetch_array($query);
    // 判断订单是否存在
    if (!$order) $dou->dou_header($_URL['order']);

    // 格式化订单信息
    $order['pay_name'] = $dou->get_one("SELECT name FROM " . $dou->table('plugin') . " WHERE unique_id = '$order[pay_id]'");
    $order['shipping_name'] = $dou->get_one("SELECT name FROM " . $dou->table('plugin') . " WHERE unique_id = '$order[shipping_id]'");
    $order['product_amount_format'] = $dou->price_format($order['product_amount']);
    $order['shipping_fee_format'] = $dou->price_format($order['shipping_fee']);
    $order['order_amount_format'] = $dou->price_format($order['order_amount']);
    $order['email'] = $dou->get_one("SELECT email FROM " . $dou->table('user') . " WHERE user_id = '$order[user_id]'");
    $order['add_time'] = date("Y-m-d h:i:s", $order['add_time']);
    $order['status_format'] = $_LANG['order_status_' . $order['status']];
    $order['product_list'] = $dou_order->get_order_product($order['order_id']);
    // 是否显示支付按钮
    if ($dou->get_plugin($order['pay_id'])) {
        $order['if_payment'] = true;
        // 生成付款按钮
        include_once (ROOT_PATH . 'include/plugin/' . $order['pay_id'] . '/work.plugin.php');
        $plugin = new Plugin($order_sn, $order['order_amount']);
        // 生成支付按钮
        $order['payment'] = $plugin->work();
    }
    // 赋值给模板
    $smarty->assign('page_title', $dou->page_title('user', 'order_view'));
    $smarty->assign('ur_here', $dou->ur_here('user', 'order_view'));
    $smarty->assign('order', $order);
    $smarty->display('user/personal_shop.html');

} elseif ($op=='excel') {
    # 导出Excel订单

    /**
     * +----------------------------------------------------------
     * 导出的会员的订单数据
     * +----------------------------------------------------------
     * $checkbox 所选的订单
     * +----------------------------------------------------------
     */
    function excel_order_list($checkbox = '') {
        global $gUinfos;
        // 需要导出的字段
        $field = array('id','name','model','price','number');
        $field_user = array('uname','usex','utel','uemail','ucountry','uaddress','ucompany');
        // 导出的字段名称
        $field_head = array_merge($field,$field_user);
        foreach ($field_head as $value) {
            $excel_list['head'][] = $GLOBALS['_LANG']['cart_' . $value];
        }

        // 导出列表
        $country = $GLOBALS['dou']->get_one('SELECT '. ($lang_type==2?'unique_id':'cat_name') .' FROM '. $GLOBALS['dou']->table('district') .' WHERE cat_id='. $gUinfos['country']);
        $list_user = array(
                $gUinfos['truename']?$gUinfos['truename']:$gUinfos['nickname'],
                $gUinfos['sex']?$GLOBALS['_LANG']['user_man']:$GLOBALS['_LANG']['user_woman'],
                $gUinfos['telephone'],
                $gUinfos['email'],
                $country,
                $gUinfos['address'],
                $gUinfos['company']
            );
        $carts = $GLOBALS['dou_order']->get_cart($_SESSION[DOU_ID]['cart'], $checkbox);
        foreach ($carts['list'] as $c) {
            $list = array();
            foreach ((array)$field as $v) {
                $list[] = $c[$v];
            }
            $excel_list['list'][] = array_merge($list,$list_user);
        }
        // $GLOBALS['dou']->debug($excel_list,1);
        return $excel_list;
    }

    // 判断是否安装会员导出功能
    if (file_exists($excel_file = ROOT_PATH . ADMIN_PATH . '/include/PHPExcel/excel.class.php')) {
        include_once($excel_file);
        $excel = new Excel();
    }
    // $data['head']   $data['list']
    $data = excel_order_list($ids);
    $excel->export_excel('order', $data);exit;

} elseif ($op=='cancel') {
    # 购物车删除
    foreach ($ids as $v) {
        unset($_SESSION[DOU_ID]['cart'][$v]);
    }
    $dou->dou_header($_URL['order']);

} elseif ($op=='save') {
    # 保存购物车数据
    // sort($ids);
    $ids = implode(',',$ids);
    $nids = $_POST['nids'] ? $_POST['nids'] : array();
    // sort($nids);
    $nids = implode(',', $nids);

    $data = array(
            'pro_ids'   => $ids,
            'num_ids'   => $nids,
            'uid'       => $gUid,
            'ip'        => $dou->get_ip()
        );
    $is_exist = $dou->get_one("SELECT id from ".$dou->table('cart')." WHERE uid={$gUid}");
    if ($is_exist) {
        $data['modtime'] = CTIME;
        $dou->update('cart',$data,'uid='.$gUid);
    } else {
        $data['addtime'] = CTIME;
        $dou->insert('cart',$data);
    }
    $dou->dou_msg($_LANG['dou_msg_success'],$_URL['order']);

} else {
    # 我的购物车
    $carts = $dou_order->user_cart($gUid);
    // $dou->debug($carts,1);
    // [list] => array()
    // [total] => 5
    // [product_amount] => 5
    // [product_amount_format] => ￥5.00 元
    // 赋值给模板
    $smarty->assign('page_title', $dou->page_title('user', 'order_cart'));
    // $smarty->assign('ur_here', $dou->ur_here('user', 'order_cart'));
    $smarty->assign('carts', $carts);

    $smarty->display('user/personal_shop.html');
}
?>