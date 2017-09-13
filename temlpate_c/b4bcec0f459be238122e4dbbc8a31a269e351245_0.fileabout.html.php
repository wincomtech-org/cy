<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:25:37
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\about.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8eb814fcc37_24860796',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b4bcec0f459be238122e4dbbc8a31a269e351245' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\about.html',
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
function content_59b8eb814fcc37_24860796 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" type="text/css" href="http://tx.ext2/theme/en_us/css/main.css">

<div class="main-body">
	<!--关于我们-->
	<div class="about">
		<div  class="about_content">
			<!--标题-->
			<div class="about_content_tit">
				<div class="about_conTit_div">
					<h3><span><?php echo $_smarty_tpl->tpl_vars['page']->value['page_name'];?>
</span></h3>
				</div>
			</div>
			<!--内容-->
			<div class="aboutCon_content">
				<div class="aboutCon_content_img notes_img">
					<img src="http://tx.ext2/theme/en_us/img/lb1.jpg" alt="">
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
				<div class="aboutCon_content_con">
					<?php echo $_smarty_tpl->tpl_vars['page']->value['content'];?>

				</div>
			</div>
		</div>
	</div>
	<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>

<?php }
}
