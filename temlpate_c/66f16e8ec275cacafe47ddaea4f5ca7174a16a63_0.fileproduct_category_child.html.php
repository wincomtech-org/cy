<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:30:24
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\product_category_child.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8eca08f45f8_91991990',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '66f16e8ec275cacafe47ddaea4f5ca7174a16a63' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\product_category_child.html',
      1 => 1505291054,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8eca08f45f8_91991990 (Smarty_Internal_Template $_smarty_tpl) {
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
					<div class="prodcts_detail_tit endoscope notes_img">
						<div class="img ">
							<a href="javascript:void(0);"><img src="<?php echo $_smarty_tpl->tpl_vars['cate_info']->value['thumb'];?>
" alt=""></a>
						</div>
						<div class="txt">
							<h6><?php echo $_smarty_tpl->tpl_vars['cate_info']->value['keywords'];?>
</h6>
							<p><?php echo $_smarty_tpl->tpl_vars['cate_info']->value['description'];?>
</p>
						</div>
						<div class="notes">
							<div class="notes_con">
								<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
">
									<span class="txt">Contact Us</span>
									<span class="img"><img src="http://tx.ext2/theme/en_us/img/iphone.png" alt=""></span>
								</a>
							</div>
						</div>
						<div class="clear"></div>
					</div>

					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['product_list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
					<div class="the_latest_news mg-t-30">
						<!-- 标题 -->
						<div class="the_latest_news_tit mg-b-30">
							<div >
								<h3><span><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</span></h3>
							</div>
						</div>
						<!--分类对应产品-->
						<div class="product_endoscope">
							<ul class="product_endoscope_item">
								<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['v']->value['list'], 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
								<li class="product_endoscope_items">
									<div class="img"><a href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['t']->value['thumb'];?>
" alt="image"></a></div>
									<div class="txt"><a href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['t']->value['name'];?>
</a></div>
								</li>
								<?php
}
} else {
?>

								<li>暂无……</li>
								<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

								<div class="clear"></div>
							</ul>
							<p class="more">
								<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['cat_url'];?>
" class="btn-view-red">view more</a>
							</p>
						</div>
					</div>
					<?php
}
} else {
?>

					<div class="the_latest_news mg-t-30"><p>No Resource……</p></div>
					<?php
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
