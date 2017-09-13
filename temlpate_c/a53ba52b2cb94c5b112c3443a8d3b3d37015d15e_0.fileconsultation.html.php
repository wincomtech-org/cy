<?php
/* Smarty version 3.1.30, created on 2017-09-13 17:20:10
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\consultation.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8f84ad86816_34625408',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a53ba52b2cb94c5b112c3443a8d3b3d37015d15e' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\consultation.html',
      1 => 1505294404,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8f84ad86816_34625408 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/zh_cn/css/yhstyle.css">

<div class="main-body">
	<div class="landingPage">
		<div class="main-wrapper">
			<div class="wide-pc">
				<div class="head-wrapper">
					<div class="borderbg"></div>
					<span class="head-cont">留言</span>
				</div>
				<p class="infor-cont">感谢您关注成运医疗，如果您有任何问题或建议请直接电话或邮件我们或在下表留言！</p>
			</div>
			<div class="rc-container">
				<form action="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
" method="post" class="rc-form" id="cons-form">
					<div class="rc-row">
						<p class="h-cont">收件人<span class="error">err</span></p>
						<select name="toname">
							<option value="HUGER研发部">HUGER研发部</option>
							<option value="HUGER客服部">HUGER客服部</option>
						</select>
					</div>
					<div class="rc-row">
						<p class="h-cont">名称<span class="error"></span></p>
						<div class="s-w">
							<label>姓氏<sub class="red">*</sub></label><input type="text" name="lastname" value="" class="lastname" id="lastname">
							<label>名字<sub class="red">*</sub></label><input type="text" name="firstname" value="" class="firstname" id="firstname">
						</div>					
					</div>
					<div class="rc-row">
						<p class="h-cont">性别<sub class="red">*</sub><span class="error"></span></p>
						<div class="s-w slabel">
							<input type="radio" checked name="sex" value="0" id="female"><label for="female">女</label>
							<input type="radio" name="sex" value="1" id="male"><label for="male">男</label>	
						</div>
					</div>
					<!-- <div class="rc-row">
						<p class="h-cont">所属机构名称<span class="error"></span></p>
						<input type="text" name="organisation" value="">
					</div> -->
					<div class="rc-row">
						<p class="h-cont">国家<span class="error"></span></p>
						<select name="country">
							<option value="">请选择</option>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['countrys']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
							<option value="<?php echo $_smarty_tpl->tpl_vars['v']->value['cat_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</option>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

						</select>
					</div>
					<!-- <div class="rc-row">
						<p class="h-cont">地址*<span class="error"></span></p>
						<input type="text" name="address" value="" id="address">
					</div>
					<div class="rc-row">
						<p class="h-cont">邮编<span class="error"></span></p>
						<input type="text" name="postcode" value="">
					</div> -->
					<div class="rc-row">
						<p class="h-cont">电话<sub class="red">*</sub><span class="error"></span></p>
						<input type="text" name="telephone" value="" id="telephone">
					</div>
					<div class="rc-row">
						<p class="h-cont">邮箱<sub class="red">*</sub><span class="error"></span></p>
						<input type="text" name="email" value="" id="email">
					</div>
					<div class="rc-row">
						<p class="h-cont">职位/职称<span class="error"></span></p>
						<input type="text" name="title" value="">
					</div>
					<div class="rc-row">
						<p class="h-cont">留言<sub class="red">*</sub><span class="error"></span></p>
						<textarea name="content" id="message" cols="30" rows="10"></textarea>
					</div>
					<div>
						<div class="btominfor-cont">
							<p><sub class="red">*</sub>为必填项，请务必填写有效有效地址。</p> 
							<p class="error"></p>
						</div>
						<input type="hidden" name="rec" value="insert">
						<input type="hidden" name="token" value="<?php echo $_smarty_tpl->tpl_vars['token']->value;?>
">
						<input type="submit" value="发送表格" id="consultate">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 底部 -->
<?php echo '<script'; ?>
 src="http://tx.ext2/theme/zh_cn/js/yhvalidate.js"><?php echo '</script'; ?>
>
<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
