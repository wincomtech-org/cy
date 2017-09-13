<?php
/* Smarty version 3.1.30, created on 2017-09-13 17:25:20
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\user\personal.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8f980206012_00468021',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ee304f300b109d52754161e532c190ff231e270d' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\user\\personal.html',
      1 => 1505287723,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8f980206012_00468021 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/zh_cn/css/personal.css">

<div class="main-body">
	<div class="w12">
		<div class="head-wrapper">
			<div class="borderbg"></div>
			<span class="head-cont">个人中心</span>
		</div>
		<div class="clear"></div>
		<div class="per-main1">
			<div class="per-m1">
				<div class="per-m1-l lf">
					<p class="per-m1-lc"><span class="per-m1-lt">昵称：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['nickname'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">真实姓名：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['truename'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">手机号码：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['telephone'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">联系邮箱：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['email'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">收货地址：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['address'];?>
</span></p>
				</div>
				<div id="ff" class="per-m1-r rt">
					<div class="per-m1-rc"><img src="http://tx.ext2/theme/zh_cn/img/m-t.jpg"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="per-m1f">
				<a class="per-m1f-l lf" href="<?php echo $_smarty_tpl->tpl_vars['url']->value['edit'];?>
">修改个人资料</a>
				<a class="per-m1f-r rt" href="<?php echo $_smarty_tpl->tpl_vars['url']->value['password'];?>
">修改登录密码</a>
				<div class="clear"></div>
			</div>
		</div>
		<div class="per-m2">
			<div class="head-wrapper">
				<div class="borderbg1"></div>
				<span class="head-cont">购物车</span>
			</div>
			<ul class="per-list">
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['carts']->value['list'], 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
				<li class="per-li">
					<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['v']->value['image'];?>
" /></a>
					<p>名称：<span><?php echo $_smarty_tpl->tpl_vars['v']->value['name'];?>
</span></p><p>型号：<span>xxxx</span></p><p>价格：<span><?php echo $_smarty_tpl->tpl_vars['v']->value['price'];?>
</span></p>
				</li>
				<?php
}
} else {
?>

				<li><p>暂无……</p></li>
				<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

				<div class="clear"></div>
			</ul>
			<div class="per-m">
			<?php if ($_smarty_tpl->tpl_vars['carts']->value) {?>
				<a class="per-more" href="<?php echo $_smarty_tpl->tpl_vars['url']->value['order'];?>
">>> 查看更多</a>
			<?php } else { ?>
				<a class="per-more" href="<?php echo $_smarty_tpl->tpl_vars['url']->value['product'];?>
">>> 挑选产品</a>
			<?php }?>
			</div>
		</div>
	</div>
</div>

<!-- 底部 -->
<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
