<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:31:58
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\product_category.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8ecfe5555f3_88101122',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0676dcc696789b56ced67afc08dcae47302ab7cd' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\product_category.html',
      1 => 1505291079,
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
function content_59b8ecfe5555f3_88101122 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/en_us/css/main.css">

	<!--主题内容-->
	<div class="main-body">
		<div class="about">
			<div  class="about_content">
				<!--标题-->
				<div class="about_content_tit">
					<div class="about_conTit_div">
						<h3><span><?php echo $_smarty_tpl->tpl_vars['cate_info']->value['cat_name'];?>
</span></h3>
					</div>
				</div>
				<!--内容-->
				<div class="aboutCon_content">
					<div class="aboutCon_content_img notes_img">
						<img src="http://tx.ext2/theme/en_us/img/3.jpg" alt="">
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
					<div class="news_items_new">
						<ul>
							<li class="news_items_new_item">
								<div class="img"><a href="javascript:void(0);"><img src="http://tx.ext2/theme/en_us/img/nt1.jpg" alt=""></a></div>
								<div class="txt"><a href="javascript:void(0);">Advantage: safe and reliable</a></div>
							</li>
							<li class="news_items_new_item">
								<div class="img"><a href="javascript:void(0);"><img src="http://tx.ext2/theme/en_us/img/nt1.jpg" alt=""></a></div>
								<div class="txt"><a href="javascript:void(0);">Advantage: simple and quick</a></div>
							</li>
							<li class="news_items_new_item">
								<div class="img"><a href="javascript:void(0);"><img src="http://tx.ext2/theme/en_us/img/nt1.jpg" alt=""></a></div>
								<div class="txt"><a href="javascript:void(0);">Advantage: after-sales service</a></div>
							</li>
							<div class="clear"></div>
						</ul>
					</div>
					<!-- 产品列表 -->
					<div class="product_item">
						<ul>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['product_category']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
							<?php if ($_smarty_tpl->tpl_vars['site']->value['cypro'] && in_array($_smarty_tpl->tpl_vars['v']->value['cat_id'],array(4,22))) {?>
							<li class="product_item_items">
								<div class="img">
									<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><img src="<?php if ($_smarty_tpl->tpl_vars['v']->value['thumb']) {
echo $_smarty_tpl->tpl_vars['v']->value['thumb'];
} else { ?>images/nopic_s_100x100.jpg<?php }?>" alt=""></a>
								</div>
								<div class="txt">
									<h3><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a></h3>
									<div class="products_content">
										<p><?php echo $_smarty_tpl->tpl_vars['v']->value['description'];?>
</p>
									</div>
									<p class="view"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
">View Categories</a></p>
								</div>
							</li>
							<?php } elseif (!$_smarty_tpl->tpl_vars['site']->value['cypro'] && !in_array($_smarty_tpl->tpl_vars['v']->value['cat_id'],array(4,22))) {?>
							<li class="product_item_items">
								<div class="img">
									<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><img src="<?php if ($_smarty_tpl->tpl_vars['v']->value['thumb']) {
echo $_smarty_tpl->tpl_vars['v']->value['thumb'];
} else { ?>images/nopic_s_100x100.jpg<?php }?>" alt=""></a>
								</div>
								<div class="txt">
									<h3><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a></h3>
									<div class="products_content">
										<p><?php echo $_smarty_tpl->tpl_vars['v']->value['description'];?>
</p>
									</div>
									<p class="view"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
">View Categories</a></p>
								</div>
							</li>
							<?php }?>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

						</ul>
						<?php $_smarty_tpl->_subTemplateRender("file:inc/pager.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

					</div>
				</div>
			</div>
		</div>
	<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

	</div>
<!-- footer -->
<?php echo '<script'; ?>
 src="http://tx.ext2/theme/en_us/js/easySlider.min.js"><?php echo '</script'; ?>
>
<?php }
}
