<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';

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
    if (!$order) $dou->dou_header($_URL['order_list']);
    
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

} elseif ($op=='cancel') {

    # 订单删除
    // 验证并获取合法的ID
    $order_sn = $check->is_number($_REQUEST['order_sn']) ? $_REQUEST['order_sn'] : '';

    // 获取订单信息
    $order = $dou->fetch_array($dou->select($dou->table('order'), 'order_sn, status', "order_sn = '$order_sn' AND user_id = '$gUid'"));

    if (!$order || $order['status'] != 0)
        exit;
    
    if ($_REQUEST['if_check']) {
        $doubox .= '<div id="douBox"><div class="boxBg"></div><div class="boxFrame">';
        $doubox .= '<h2><a href="javascript:void(0)" class="close" onclick="douRemove('."'douBox'".')">X</a>提示</h2>';
        $doubox .= '<div class="boxCon"><dt>您确定要删除该订单吗？</dt><dd>删除后，您可以在订单回收站还原该订单，也可以做永久删除。</dd><dd><a href="' . $_URL['order_cancel'] . '&order_sn=' . $order_sn . '">确定</a><a href="javascript:void(0)" onclick="douRemove('."'douBox'".')">取消</a></dd></div>';
        $doubox .= '</div></div>';
        echo $doubox;
    } else {
        // 取消订单
        $dou->query("UPDATE " . $dou->table('order') . " SET status = '-1' WHERE order_sn = '$order_sn' AND user_id = '$gUid'");
        $dou->dou_header($_URL['order_list']);
    }

} else {

    // $carts = $dou_order->get_cart($_SESSION[DOU_ID]['cart']);
    // $dou->debug($carts,1);


    # 我的订单
    // 公用SQL查询条件，分页中也使用
    $where = " WHERE user_id='$gUid'";
    // 验证并获取合法的分页ID
    $page = $check->is_number($_REQUEST['page']) ? $_REQUEST['page'] : 1;
    $limit = $dou->pager('order', 15, $page, $_URL['order'], $where);
    
    $query = $dou->query("SELECT * FROM " . $dou->table('order') . $where . " ORDER BY order_id DESC" . $limit);
    while ($row = $dou->fetch_array($query)) {
        $email = $dou->get_one("SELECT email FROM " . $dou->table('user') . " WHERE user_id = '$row[user_id]'");
        $add_time = date("Y-m-d h:i:s", $row['add_time']);
        $status_format = $_LANG['order_status_' . $row['status']];
        $order_amount_format = $dou->price_format($row['order_amount']);
        $product_list = $dou_order->get_order_product($row['order_id']);

        // 是否显示支付按钮
        if ($dou->get_plugin($row['pay_id']))
            $if_payment = true;
        
        $order_list[] = array(
                "order_id" => $row['order_id'],
                "order_sn" => $row['order_sn'],
                "email" => $email,
                "telephone" => $row['telephone'],
                "contact" => $row['contact'],
                "order_amount" => $row['order_amount'],
                "order_amount_format" => $order_amount_format,
                "status" => $row['status'],
                "status_format" => $status_format,
                "if_payment" => $if_payment,
                "add_time" => $add_time,
                "product_list" => $product_list
        );
    }

    // 赋值给模板
    $smarty->assign('page_title', $dou->page_title('user', 'order_my'));
    $smarty->assign('ur_here', $dou->ur_here('user', 'order_my'));
    $smarty->assign('order_list', $order_list);

    $smarty->display('user/personal_shop.html');

}
?>