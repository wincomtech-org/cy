<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:25:34
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\recruitment.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8eb7ed742f8_88823610',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '63bbcb69fd142634780f1837b9f1e9e24ffcf6aa' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\recruitment.html',
      1 => 1505291013,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8eb7ed742f8_88823610 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/en_us/css/yhstyle.css">

<!--主题内容-->
<div class="main-body">
	<div class="main-wrapper">
		<div class="wide-container">
			<div class="head-wrapper">
				<div class="borderbg"></div>
				<span class="head-cont">Join Us</span>
			</div>
			<div class="slogan-img">
				<img src="http://tx.ext2/theme/en_us/img/recruit.jpg" alt="Join us" title="Join us">
			</div>
			<div class="head-wrapper">
				<div class="borderbg1"></div>
				<span class="head-cont1">Recruitment</span>
			</div>
			<div class="table-container">
				<table class="recruit-table">
					<tr>
						<th>Position</th>
						<th>Category</th>
						<th>Number</th>
						<th>Working Place</th>
						<th>Release Time</th>
					</tr>
					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['job_list']->value, 'job');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['job']->value) {
?>
					<tr>
						<td><a href="<?php echo $_smarty_tpl->tpl_vars['job']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['job']->value['title'];?>
</a></td>
						<td><?php echo $_smarty_tpl->tpl_vars['job']->value['type'];?>
</td>
						<td><?php echo $_smarty_tpl->tpl_vars['job']->value['num'];?>
</td>
						<td><?php echo $_smarty_tpl->tpl_vars['job']->value['addr'];?>
</td>
						<td><?php echo $_smarty_tpl->tpl_vars['job']->value['add_time'];?>
</td>
					</tr>
					<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

				</table>
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
