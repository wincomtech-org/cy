<?php
/* Smarty version 3.1.30, created on 2017-09-13 17:25:45
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\user\personal.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8f9990dae26_16282336',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '43e0ca2e747a1b1fdcd39b98417ede91a4cc6584' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\user\\personal.html',
      1 => 1505287722,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8f9990dae26_16282336 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/en_us/css/personal.css">

<div class="main-body">
	<div class="w9">
		<div class="head-wrapper">
			<div class="borderbg"></div>
			<span class="head-cont">Personal Center</span>
		</div>
		<div class="clear"></div>
		<div class="per-main1">
			<div class="per-m1">
				<div class="per-m1-l lf">
					<p class="per-m1-lc"><span class="per-m1-lt">nick name：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['nickname'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">real name：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['truename'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">phone：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['telephone'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">mailbox：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['email'];?>
</span></p>
					<p class="per-m1-lc"><span class="per-m1-lt">address：</span><span class="per-m1-lr"><?php echo $_smarty_tpl->tpl_vars['user_info']->value['address'];?>
</span></p>
				</div>
				<div id="ff" class="per-m1-r rt">
					<div class="per-m1-rc"><img src="http://tx.ext2/theme/en_us/img/m-t.jpg"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="per-m1f">
				<a class="per-m1f-l  lf" href="<?php echo $_smarty_tpl->tpl_vars['url']->value['edit'];?>
">Modify personal data</a>
				<a class="per-m1f-r  rt" href="<?php echo $_smarty_tpl->tpl_vars['url']->value['password'];?>
">Modify login password</a>
				<div class="clear"></div>
			</div>
		</div>
		<div class="per-m2">
			<div class="head-wrapper">
				<div class="borderbg1"></div>
				<span class="head-cont">Shopping Cart</span>
			</div>
			<ul class="per-list">
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['carts']->value['list'], 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
				<li class="per-li"><a href="#"><img src="http://tx.ext2/theme/en_us/img/p-1.jpg" /></a>
					<p>Name:<span><?php echo $_smarty_tpl->tpl_vars['v']->value['name'];?>
</span></p><p>Model:<span><?php echo $_smarty_tpl->tpl_vars['v']->value['model'];?>
</span></p><p>Price:<span><?php echo $_smarty_tpl->tpl_vars['v']->value['price'];?>
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
">View More >></a>
				<?php } else { ?>
				<a class="per-more" href="<?php echo $_smarty_tpl->tpl_vars['url']->value['product'];?>
">Product Choice >></a>
				<?php }?>
			</div>
		</div>
	</div>
</div>
<!-- 底部 -->
<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
