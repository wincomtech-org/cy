<?php
// define('IN_LOTHAR', true);
// require (dirname(__FILE__) . '/include/init.php');
// require ROOT_PATH .'public.php';

// 安全验证
if (in_array($op,array('order_detail','excel','cancel','save'))) {
    $ids = $_REQUEST['ids'] ? $_REQUEST['ids'] : array();
    if (empty($ids)) $dou->dou_msg('您未做任何选择',$_URL['order']);
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
    // $dou->debug($ids,1);
    // $dou->debug($gUinfos,1);

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
        // 导出的字段名称
        foreach ((array) $field as $value) {
            $excel_list['head'][] = $GLOBALS['_LANG']['user_' . $value];
        }
        $excel_list['head'] = array('产品编号','产品名称及型号','单价','数量','客户姓名','性别','电话','邮箱','国家','详细住址','公司名称');

        // 导出列表
        $carts = $GLOBALS['dou_order']->get_cart($_SESSION[DOU_ID]['cart'], $checkbox);
        foreach ($carts['list'] as $c) {
            foreach ((array)$field as $v) {
                $list[] = $c[$v];
            }
            $list['4'] = $gUinfos['nickname'];
            $list['5'] = $gUinfos['sex'];
            $list['6'] = $gUinfos['contact'];
            $list['7'] = $gUinfos['telephone'];
            $list['8'] = $gUinfos['address'];
            $excel_list['list'][] = $list;
        }
        
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
            'addtime'   => CTIME,
            'ip'        => $dou->get_ip()
        );
    $is_exist = $dou->get_one("SELECT id from ".$dou->table('cart')." WHERE uid={$gUid}");
    if ($is_exist) {
        $dou->update('cart',$data,'uid='.$gUid);
    } else {
        $dou->insert('cart',$data);
    }
    $dou->dou_msg('保存成功！',$_URL['order']);

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