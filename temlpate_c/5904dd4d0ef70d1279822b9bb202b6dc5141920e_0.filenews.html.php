<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:27:19
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\news.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8ebe7ccd732_34093653',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5904dd4d0ef70d1279822b9bb202b6dc5141920e' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\news.html',
      1 => 1505291237,
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
function content_59b8ebe7ccd732_34093653 (Smarty_Internal_Template $_smarty_tpl) {
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
					<h3><span>News Information</span></h3>
				</div>
			</div>
			<!--内容-->
			<div class="aboutCon_content ">
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
				<!-- <div class="news_items_new">
					<ul>
						<li class="news_items_new_item">
							<div class="img"><a href="javascript:void(0);"><img src="http://tx.ext2/theme/en_us/img/nt1.jpg" alt=""></a></div>
							<div class="txt"><a href="javascript:void(0);">latest news1</a></div>
						</li>
						<li class="news_items_new_item">
							<div class="img"><a href="javascript:void(0);"><img src="http://tx.ext2/theme/en_us/img/nt1.jpg" alt=""></a></div>
							<div class="txt"><a href="javascript:void(0);">latest news2</a></div>
						</li>
						<li class="news_items_new_item">
							<div class="img"><a href="javascript:void(0);"><img src="http://tx.ext2/theme/en_us/img/nt1.jpg" alt=""></a></div>
							<div class="txt"><a href="javascript:void(0);">latest news3</a></div>
						</li>
						<div class="clear"></div>
					</ul>
				</div> -->
				<!-- 最新动态 -->
				<div class="the_latest_news mg-t-30 ">
					<!-- 标题 -->
					<div class="the_latest_news_tit mg-b-30">
						<div >
							<h3><span>The Latest News</span></h3>
						</div>
					</div>
					<!-- 内容 -->
					<div class="the_latest_news_con "> 
						<ul>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['fresh_news']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
							<li>
								<div class="img"><img src="http://tx.ext2/theme/en_us/img/2.png" alt=""></div>
								<div class="txt">
									<span class="date"><?php echo $_smarty_tpl->tpl_vars['v']->value['add_time'];?>
</span>
									<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['title'];?>
</a>
								</div>
							</li>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

							<div class="clear"></div>
						</ul>
					</div>
				</div>

				<!-- 新闻资讯 -->
				<div class="the_latest_news mg-t-30 ">
					<!-- 标题 -->
					<div class="the_latest_news_tit mg-b-30">
						<div >
							<h3><span>News Information</span></h3>
						</div>
					</div>
					<!-- 内容 -->
					<div class="the_latest_news_con newsInfo"> 
						<ul>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['article_list']->value, 'v', false, 'k');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k']->value => $_smarty_tpl->tpl_vars['v']->value) {
?>
							<li>
								<div class="txt">
									<span class="order"><?php echo $_smarty_tpl->tpl_vars['k']->value+1;?>
</span>
									<a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['title'];?>
</a>
								</div>
							</li>
							<?php
}
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
