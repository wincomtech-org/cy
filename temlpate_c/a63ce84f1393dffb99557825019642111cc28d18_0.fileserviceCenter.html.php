<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:22:40
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\serviceCenter.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8ead0a21146_60831469',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a63ce84f1393dffb99557825019642111cc28d18' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\serviceCenter.html',
      1 => 1505290957,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8ead0a21146_60831469 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" type="text/css" href="http://tx.ext2/theme/en_us/css/main.css">

<!--主题内容-->
<div class="main-body">
	<div class="about">
		<div  class="about_content">
			<!--标题-->
			<div class="about_content_tit">
				<div class="about_conTit_div">
					<h3><span>Service Center</span></h3>
				</div>
			</div>
			<!--内容-->
			<div class="aboutCon_content">
				<div class="aboutCon_content_img notes_img">
					<img src="http://tx.ext2/theme/en_us/img/4.jpg" alt="">
					<div class="notes">
							<div class="notes_con">
								<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
">
									<span class="txt">Contact Us</span>
									<span class="img"><img src="http://tx.ext2/theme/en_us/img/iphone.png" alt=""></span>
								</a>
							</div>
					</div>	
				</div>
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['article_list']->value, 'v', false, 'k');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k']->value => $_smarty_tpl->tpl_vars['v']->value) {
?>
				<div class="the_latest_news mg-t-30 ">
					<!-- 标题 -->
					<div class="the_latest_news_tit mg-b-30">
						<h3><span><?php echo $_smarty_tpl->tpl_vars['k']->value;?>
</span></h3>
					</div>
					<!-- 内容 -->
					<div class="serviceCenter">
						<?php if (is_array($_smarty_tpl->tpl_vars['v']->value)) {?>
						<ul>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['v']->value, 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
							<li class="serviceCenter_items black_shadow">
								<div class="txt">
									<p class="tit"><?php echo $_smarty_tpl->tpl_vars['t']->value['title'];?>
</p>
									<p><?php echo $_smarty_tpl->tpl_vars['t']->value['description'];?>
</p>
								</div>
							</li>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

							<div class="clear"></div>
						</ul>
						<?php } else { ?>
						<?php echo $_smarty_tpl->tpl_vars['v']->value;?>

						<?php }?>
					</div>
				</div>
				<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

			</div>
		</div>
	</div>
	<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>

<?php echo '<script'; ?>
 src="http://tx.ext2/theme/en_us/js/easySlider.min.js"><?php echo '</script'; ?>
>
<?php }
}
