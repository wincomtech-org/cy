<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:29:49
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\application.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8ec7dc6bd04_69952853',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9ab0183f6cc34a3550d497345a60a6be1e67720a' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\application.html',
      1 => 1505291385,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8ec7dc6bd04_69952853 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/en_us/css/yhstyle.css">
<!--主题内容-->
<div class="main-body">
	<!--application-->
	<div class="main-wrapper">
		<div class="wide-container">
			<div class="head-wrapper">
				<div class="borderbg"></div>
				<span class="head-cont">Application</span>
			</div>
			<div class="slogan-img notes_img">
				<img src="http://tx.ext2/theme/en_us/img/appli.jpg" alt="Make Health Visible" title="Make Health Visible">
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
			<div class="rowlist-cont">
				<span><img src="http://tx.ext2/theme/en_us/img/appli1-1.jpg" alt=""></span>
				<span>Advantage: safe and reliable</span>
				<span><img src="http://tx.ext2/theme/en_us/img/appli1-1.jpg" alt=""></span>
				<span>Advantage: simple and quick</span>
				<span><img src="http://tx.ext2/theme/en_us/img/appli1-1.jpg" alt=""></span>
				<span>Advantage: after-sales service</span>
			</div>
			<div>
				<ul class="columnlist-cont">
					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['apply_list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
					<li>
						<span><img src="<?php echo $_smarty_tpl->tpl_vars['v']->value['image'];?>
" alt=""></span>
						<span>
							<p class="cont-title"><?php echo $_smarty_tpl->tpl_vars['v']->value['title'];?>
</p>
							<div class="cont-charac"><?php echo $_smarty_tpl->tpl_vars['v']->value['description'];?>
</div>
							<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
">[MORE]</a>
						</span>
					</li>
					<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

				</ul>
			</div>
		</div>
	</div>
	<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
	<?php echo '<script'; ?>
 src="http://tx.ext2/theme/en_us/js/yhvalidate.js"><?php echo '</script'; ?>
>
<?php }
}
