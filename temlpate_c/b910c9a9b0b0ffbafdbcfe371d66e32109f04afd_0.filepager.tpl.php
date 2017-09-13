<?php
/* Smarty version 3.1.30, created on 2017-09-13 15:59:22
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\inc\pager.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8e55a10cf52_61267101',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b910c9a9b0b0ffbafdbcfe371d66e32109f04afd' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\inc\\pager.tpl',
      1 => 1505287723,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59b8e55a10cf52_61267101 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php if ($_smarty_tpl->tpl_vars['pager']->value['page_count'] > 1) {?>
<div class="page">
	<div class="page_con">
		 <a href="<?php echo $_smarty_tpl->tpl_vars['pager']->value['first'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['pager_first'];?>
</a>
		    <?php echo $_smarty_tpl->tpl_vars['pager']->value['pagep'];?>

		    <?php echo $_smarty_tpl->tpl_vars['pager']->value['current'];?>

		    <?php echo $_smarty_tpl->tpl_vars['pager']->value['pagen'];?>

	    <a href="<?php echo $_smarty_tpl->tpl_vars['pager']->value['last'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['pager_last'];?>
</a>
	</div>

</div>
<?php }
}
}
