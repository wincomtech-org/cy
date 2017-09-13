<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:11:43
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\inc\slide_show.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8e83f013873_30381124',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4e367bdb7b3d7a911bb6c8fe467edd2f0831d15c' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\inc\\slide_show.tpl',
      1 => 1505287722,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59b8e83f013873_30381124 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['show_list']->value) {?>
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
