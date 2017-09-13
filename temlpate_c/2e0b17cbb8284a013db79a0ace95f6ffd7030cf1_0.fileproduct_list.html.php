<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:30:32
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\product_list.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8eca8b3c234_04949611',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2e0b17cbb8284a013db79a0ace95f6ffd7030cf1' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\product_list.html',
      1 => 1505291024,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/pager.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8eca8b3c234_04949611 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/en_us/css/main.css">
<!--主题内容-->
<div class="main-body">
	<!-- 产品上级分类信息 -->
	<div class="about">
		<div class="about_content">
			<!--标题-->
			<div class="about_content_tit">
				<div class="about_conTit_div">
					<h3><span><?php echo $_smarty_tpl->tpl_vars['cate_info']->value['cat_name'];?>
</span></h3>
				</div>
			</div>
			<!--简介-->
			<div class="prodcts_detail_content">
				<div class="the_latest_news mg-t-30 ">
					<!--分类对应产品-->
					<div class="product_endoscope">
						<ul class="product_endoscope_item">
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['product_list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
							<li class="product_endoscope_items">
								<div class="img"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['v']->value['thumb'];?>
" alt="image"></a></div>
								<div class="txt"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['name'];?>
</a></div>
							</li>
							<?php
}
} else {
?>

							<li>No Resource……</li>
							<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

							<div class="clear"></div>
						</ul>
						<?php $_smarty_tpl->_subTemplateRender("file:inc/pager.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

					</div>
				</div>
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
