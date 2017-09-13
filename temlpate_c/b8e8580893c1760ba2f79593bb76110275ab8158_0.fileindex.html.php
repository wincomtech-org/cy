<?php
/* Smarty version 3.1.30, created on 2017-09-13 15:54:58
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\index.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8e45275e9a3_64433249',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b8e8580893c1760ba2f79593bb76110275ab8158' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\index.html',
      1 => 1505287723,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/slide_show.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8e45275e9a3_64433249 (Smarty_Internal_Template $_smarty_tpl) {
if (!is_callable('smarty_modifier_truncate')) require_once 'D:\\phpStudy\\WWW\\GitHub\\cy\\include\\smarty\\plugins\\modifier.truncate.php';
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php echo '<script'; ?>
 src="http://tx.ext2/theme/zh_cn/js/ZoomPic.js"><?php echo '</script'; ?>
>
<!--主题内容-->
<div class="main-body">
	<!--主题内容-->
	<div class="landingPage">
		<!--轮播-->
		<?php $_smarty_tpl->_subTemplateRender("file:inc/slide_show.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>


		<!-- 主题内容：新闻 无规律不可以直接循环-->
		<?php if ($_smarty_tpl->tpl_vars['recommend_article']->value) {?>
		<section class="gridPromo-module">
			<ul class="gridPromo-items">
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['recommend_article']->value, 'v', false, 'k');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k']->value => $_smarty_tpl->tpl_vars['v']->value) {
?>
				<?php if ($_smarty_tpl->tpl_vars['k']->value == 0) {?>
				<li class="gridPromo-items-item">
					<div class="gridSpanTwoPromo">
						<div class="gridSpanTwoPromo-media">
							<div class="figure-image">
								<span class="Image"><img src="<?php echo $_smarty_tpl->tpl_vars['v']->value['image'];?>
" alt=""></span>
							</div>
						</div>
						<div class="gridSpanTwoPromo-text">
							<div class="gridSpanTwoPromo-tit">
								<span class="MediaPromo-category"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['v']->value['title'],26,"...");?>
</a></span>
								<span class="MediaPromo-date"><?php echo $_smarty_tpl->tpl_vars['v']->value['add_time'];?>
</span>
							</div>
							<p><?php echo $_smarty_tpl->tpl_vars['v']->value['description'];?>
</p>
							<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
" class="more">查看更多</a>
						</div>
					</div>
				</li>
				<?php } else { ?>
				<li class="gridPromo-items-item">
					<div class="MediaPromo">
						<div class="MediaPromo-media">
							<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['image'];?>
"><span class="Image"><img src="<?php echo $_smarty_tpl->tpl_vars['v']->value['image'];?>
" alt=""></span></a>
						</div>
						<div class="MediaPromo-category-wrapper">
							<span class="MediaPromo-category"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo smarty_modifier_truncate($_smarty_tpl->tpl_vars['v']->value['title'],26,"...");?>
</a></span>
							<span class="MediaPromo-date"><?php echo $_smarty_tpl->tpl_vars['v']->value['add_time'];?>
</span>
						</div>
						<div class="MediaPromo-title">
							<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['description'];?>
</a>
						</div>
					</div>
				</li>
				<?php }?>
				<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

			</ul>
		</section>
		<?php }?>

		<!--轮播-->
		<section class="lunbo">
			<div>
				<div id="focus_Box">
					<span class="prev">&nbsp;</span>
					<span class="next">&nbsp;</span>
					<ul>
						<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['show_list2']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
						<li>
							<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['show_link'];?>
"><img width="445" height="308" alt="<?php echo $_smarty_tpl->tpl_vars['v']->value['show_name'];?>
" src="<?php echo $_smarty_tpl->tpl_vars['v']->value['show_img'];?>
" /></a>	
						</li>
						<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

					</ul>
				</div>

			</div>
		</section>
		<section class="lunbo2">
			<div id="slider">
				<ul class="slides clearfix">
					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['show_list2']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
					<li><img class="responsive" src="<?php echo $_smarty_tpl->tpl_vars['v']->value['show_img'];?>
"></li>
					<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

				</ul>
				<ul class="pagination">
					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['show_list2']->value, 'v', false, 'k');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k']->value => $_smarty_tpl->tpl_vars['v']->value) {
?>
					<li class="<?php if ($_smarty_tpl->tpl_vars['k']->value == 0) {?>active<?php }?>"></li>
					<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

				</ul>
			</div>
		</section>

		<!--公司活动/关于我们-->
		<section class="activeAbout">
			<div class="activeAbout-content">
				<div class="active-content">
					<div class="active-content-tit">公司活动</div>
					<div class="active-con">
						<ul>
							<!-- thumb缩略图 -->
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['article_activity']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
							<li>
								<div class="active-img">
									<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['v']->value['image'];?>
" alt=""></a>
								</div>
								<div class="activeContent">
									<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['description'];?>
</a>
								</div>
								<div class="active-date"><?php echo $_smarty_tpl->tpl_vars['v']->value['add_time'];?>
</div>
							</li>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

						</ul>
					</div>
				</div>
				<div class="about-content">
					<div class="about-content-tit"><?php echo $_smarty_tpl->tpl_vars['index']->value['about_name'];?>
</div>
					<div class="about-con">
						<?php if ($_smarty_tpl->tpl_vars['index']->value['image']) {?><div class="about-img"><img src="<?php echo $_smarty_tpl->tpl_vars['index']->value['image'];?>
" alt=""></div><?php }?>
						<div class="about-zi">
							<a href="<?php echo $_smarty_tpl->tpl_vars['index']->value['about_link'];?>
">
								<?php echo $_smarty_tpl->tpl_vars['index']->value['about_content'];?>

							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<!-- 底部 -->
<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
