<?php
/* Smarty version 3.1.30, created on 2017-09-13 17:25:17
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\user\login.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8f97d78b7b3_47003462',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '02c6f6fd871c6f67673cbab0f23fa4df94cab73c' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\user\\login.html',
      1 => 1505287723,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8f97d78b7b3_47003462 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/zh_cn/css/yhstyle.css">
<?php echo '<script'; ?>
 src="http://tx.ext2/theme/zh_cn/js/global.js"><?php echo '</script'; ?>
>

<!--登录-->
<div class="main-body">
	<div class="landingPage">
		<div class="main-wrapper">
			<div class="wide-pc">
				<div class="head-wrapper">
					<div class="borderbg"></div>
					<span class="head-cont">登录</span>
				</div>
				<p class="infor-cont"></p>
				<div class="lr-container">
					<form action="<?php echo $_smarty_tpl->tpl_vars['url']->value['login'];?>
" method="post" class="lr-form" id="loginform">
						<label for="email">邮箱:</label>
						<input type="text" id="email" class="email" name="email" value="915273691@qq.com" placeholder="请输入邮箱">
						<p class="error"></p>

						<label for="password">密码:</label>
						<input type="password" id="password" class="password" name="password" value="111111" placeholder="请输入密码">
						<p class="error"></p>
						
						<?php if ($_smarty_tpl->tpl_vars['site']->value['captcha']) {?>
						<label for="captcha">验证码:</label>
						<input type="text" id="captcha" class="captcha" name="captcha" placeholder="请输入验证码">
						<a href="javascript:refreshimage();" class="captcha"><img id="vcode" src="captcha.php" alt=""></a>
						<!-- <img onclick="refreshimage()" id="vcode" src="captcha.php" alt=""> -->
						<p class="error"></p>
						<?php } else { ?>
						<input type="hidden" id="captcha" class="captcha" name="captcha" value="captcha">
						<?php }?>

						<div class="lr-link">
							<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['register'];?>
">注册</a>
							<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['password_reset'];?>
">忘记密码?</a>
							<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
">咨询</a>
						</div>
						
						<input type="hidden" name="op" value="1">
						<input type="hidden" name="token" value="<?php echo $_smarty_tpl->tpl_vars['token']->value;?>
">
						<input type="hidden" name="return_url" value="<?php echo $_smarty_tpl->tpl_vars['return_url']->value;?>
">
						<input type="submit" value="登录" class="signup" id="login">
					</form>
				</div>
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
