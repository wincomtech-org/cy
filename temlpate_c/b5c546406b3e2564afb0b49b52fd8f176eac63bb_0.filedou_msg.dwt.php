<?php
/* Smarty version 3.1.30, created on 2017-09-13 17:25:19
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\dou_msg.dwt" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8f97fd40f29_91517798',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b5c546406b3e2564afb0b49b52fd8f176eac63bb' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\dou_msg.dwt',
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
function content_59b8f97fd40f29_91517798 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php if ($_smarty_tpl->tpl_vars['jumpurl']->value) {?>
<meta http-equiv="refresh" content="<?php echo $_smarty_tpl->tpl_vars['time']->value;?>
;URL=<?php echo $_smarty_tpl->tpl_vars['jumpurl']->value;?>
" />
<?php } else {
echo '<script'; ?>
 type="text/javascript">
    
    function go() {
        window.history.go(-1);
    }
    
    setTimeout("go()", <?php echo $_smarty_tpl->tpl_vars['time']->value;?>
*1000);
<?php echo '</script'; ?>
>
<?php }?>

<div class="main-body">
    <div class="landingPage">
        <div class="main-wrapper">
            <div class="wide-pc">
                <div id="wrapper">
                    <div id="douMsg" class="wrap about_content">
                        <dl style="padding:30px 0;">
                            <dt style="font-size:16px;text-align:center;line-height: 30px;"><?php echo $_smarty_tpl->tpl_vars['text']->value;?>
</dt>
                            <dd style="font-size:16px;text-align:center;line-height: 30px;"><?php echo $_smarty_tpl->tpl_vars['cue']->value;?>
<a href="<?php if ($_smarty_tpl->tpl_vars['jumpurl']->value) {
echo $_smarty_tpl->tpl_vars['jumpurl']->value;
} else { ?>javascript:history.go(-1);<?php }?>"><?php echo $_smarty_tpl->tpl_vars['lang']->value['dou_msg_back'];?>
</a></dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
