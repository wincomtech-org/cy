<?php
/* Smarty version 3.1.30, created on 2017-09-13 15:54:58
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\inc\slide_show.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8e452825d50_33428843',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '14fb97812a80bbdab9dd99cfc5e723ea3ba355bd' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\inc\\slide_show.tpl',
      1 => 1505287723,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59b8e452825d50_33428843 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!--轮播-->
<?php if ($_smarty_tpl->tpl_vars['show_list']->value) {?>
<section class="indexCarousel _module">
    <div id="slider">
        <ul class="slides clearfix">
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['show_list']->value, 'v');
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
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['show_list']->value, 'v', false, 'k');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k']->value => $_smarty_tpl->tpl_vars['v']->value) {
?>
            <li <?php if ($_smarty_tpl->tpl_vars['k']->value == 0) {?>class="active"<?php }?>></li>
            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

        </ul>
    </div>
</section>
<?php }
}
}
