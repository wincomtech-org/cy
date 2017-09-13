<?php
/* Smarty version 3.1.30, created on 2017-09-13 15:59:47
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\inc\footer.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8e573604537_80165711',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '97ebeaa8015cdf8e45e1805e86a896db4851ac67' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\inc\\footer.tpl',
      1 => 1505287722,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59b8e573604537_80165711 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!-- 底部 -->
    <footer class="footer">
        <div class="footer1">
            <ul class="nav">
                <?php if ($_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
                <li><a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['cyurl'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['homepage'];?>
</a></li>
                <?php } else { ?>
                <li><a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['cyprourl'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['product_category'];?>
</a></li>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['nav_bottom_list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                <li><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['nav_name'];?>
</a></li>
                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                <?php }?>
            </ul>
            <div class="footer_search">
                <div class="footerSearch">
                    <div class="footerser">
                        <form action="search.php" method="POST" accept-charset="<?php echo $_smarty_tpl->tpl_vars['site']->value['dou_charset'];?>
">
                            <?php if ($_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
                            <input type="hidden" name="module" value="product">
                            <?php } else { ?>
                            <select name="module" style="height:30px;line-height:30px;border:none;">
                                <option <?php if ($_smarty_tpl->tpl_vars['module']->value == 'project' || $_smarty_tpl->tpl_vars['module']->value == null) {?>selected<?php }?> value="product">Product</option>
                                <option <?php if ($_smarty_tpl->tpl_vars['module']->value == 'article') {?>selected<?php }?> value="article">Article</option>
                            </select>
                            <?php }?>
                            <input type="text" name="srcval" placeholder="<?php if ($_smarty_tpl->tpl_vars['srcval']->value) {
echo $_smarty_tpl->tpl_vars['srcval']->value;
} else { ?>Keyword<?php }?>">
                            <button type="submit"></button>
                        </form>
                    </div>
                </div>
                <div class="footer_share">
                    <span>Share
                    </span>
                    <div class="footer_share_btn">
                        <div class="bshare-custom">
                            <a title="ShareToFacebook" class="bshare-facebook"></a>
                            <a title="ShareToLinkedIn" class="bshare-linkedin"></a>
                            <a title="ShareToTwitter" class="bshare-twitter"></a>
                            <a title="ShareToNetvibes" class="bshare-netvibes"></a>
                            <?php echo '<script'; ?>
 type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"><?php echo '</script'; ?>
>
                            <?php echo '<script'; ?>
 type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"><?php echo '</script'; ?>
>
                        </div>
                    </div>
                </div>
            </div>
        <!-- </div> -->
    </footer>

    <footer class="footer2">
        <div class="footer2-content">
            <p><?php if ($_smarty_tpl->tpl_vars['site']->value['icp']) {?><a href="http://www.miibeian.gov.cn/" target="_blank"><?php echo $_smarty_tpl->tpl_vars['site']->value['icp'];?>
</a><?php }?></p>
            <p><?php echo $_smarty_tpl->tpl_vars['lang']->value['powered_by'];?>
 <br> <?php echo $_smarty_tpl->tpl_vars['lang']->value['copyright'];?>
</p>
            <p>The Shanghai public network 3101170200224</p>
        </div>
    </footer>
    <div class="doc_up"><a href="#"></a></div>
    </div>

    <?php if ($_smarty_tpl->tpl_vars['site']->value['code']) {?>
    <div style="display:none"><?php echo $_smarty_tpl->tpl_vars['site']->value['code'];?>
</div>
    <?php }?>
    <!-- 底部生效JS -->
    <?php echo '<script'; ?>
 src="http://tx.ext2/theme/en_us/js/index.js"><?php echo '</script'; ?>
>
</body>
</html><?php }
}
