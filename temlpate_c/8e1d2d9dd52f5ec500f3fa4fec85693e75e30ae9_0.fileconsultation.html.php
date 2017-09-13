<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:48:14
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\consultation.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8f0ceeb8208_50174216',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8e1d2d9dd52f5ec500f3fa4fec85693e75e30ae9' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\consultation.html',
      1 => 1505292492,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8f0ceeb8208_50174216 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/en_us/css/yhstyle.css">

	<!--主题内容-->
	<div class="main-body">		
		<!--consultation-->
		<div class="main-wrapper">
			<div class="wide-container">
				<div class="head-wrapper">
					<div class="borderbg"></div>
					<span class="head-cont">Message</span>
				</div>
				<p class="infor-cont">Thank you for your interest in Huger. If you have any comments or questions, please fill in the contact form below.</p>
			</div>
			<div class="rc-container">
				<form action="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
" method="post" class="rc-form" id="cons-form">
					<div class="rc-row">
						<p class="h-cont">Subject<span class="error">err</span></p>
						<select name="toname">
							<option value="HUGER Research Dept">HUGER Research Deparment</option>
							<option value="HUGER Service Dept">HUGER Service Department</option>
						</select>
					</div>
					<div class="rc-row">
						<p class="h-cont">Name<span class="error"></span></p>
						<div class="s-w">
							<label>First Name*</label><input type="text" name="firstname" class="firstname" id="firstname">
							<label>Last Name*</label><input type="text" name="lastname" class="lastname" id="lastname">	
						</div>					
					</div>
					<div class="rc-row">
						<p class="h-cont">Appellation*<span class="error"></span></p>
						<div class="s-w slabel">
							<input type="radio" checked name="sex" value="0" id="female"><label for="female">Mr.</label>
							<input type="radio" name="sex" value="1" id="male"><label for="male">Mrs./Ms.</label>	
						</div>					
					</div>
					<!-- <div class="rc-row">
						<p class="h-cont">Name of Affiliated Institution<span class="error"></span></p>
						<input type="text" name="organisation" value="">
					</div> -->
					<div class="rc-row">
						<p class="h-cont">Country<span class="error"></span></p>
						<select name="country">
							<option value="0">please select</option>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['countrys']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
							<option value="<?php echo $_smarty_tpl->tpl_vars['v']->value['cat_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['unique_id'];?>
</option>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

						</select>
					</div>
					<!-- <div class="rc-row">
						<p class="h-cont">Address<span class="error"></span></p>
						<input type="text" name="address" id="address">
					</div>
					<div class="rc-row">
						<p class="h-cont">Postcode<span class="error"></span></p>
						<input type="text" name="postcode">
					</div> -->
					<div class="rc-row">
						<p class="h-cont">Tel<span class="error"></span></p>
						<input type="text" name="telephone" id="telephone">
					</div>
					<div class="rc-row">
						<p class="h-cont">E-mail*<span class="error"></span></p>
						<input type="text" name="email" id="email">
					</div>
					<div class="rc-row">
						<p class="h-cont">Title<span class="error"></span></p>
						<input type="text" name="title">
					</div>
					<div class="rc-row">
						<p class="h-cont">Your Message<span class="error"></span></p>
						<textarea name="content" id="message" cols="30" rows="10"></textarea>
					</div>
					<div>
						<div class="btominfor-cont">
							<p>* Mandatory fields.</p> 
							<p class="error"></p>
						</div>
						<!-- <p>Convert within 24 hours </p> -->
						<input type="hidden" name="rec" value="insert">
						<input type="hidden" name="token" value="<?php echo $_smarty_tpl->tpl_vars['token']->value;?>
">
						<input type="submit" value="Submit" id="consultate">
					</div>
				</form>
			</div>
		</div>
		<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

	</div>
<!-- 底部 -->
<?php echo '<script'; ?>
 src="http://tx.ext2/theme/en_us/js/yhvalidate.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="http://tx.ext2/theme/en_us/js/easySlider.min.js"><?php echo '</script'; ?>
>
<?php }
}
