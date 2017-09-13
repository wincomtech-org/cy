<?php
/* Smarty version 3.1.30, created on 2017-09-13 15:59:47
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\inc\header.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8e5735a6923_83109779',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0f6618e37fd391de65e06bc611fcc78b0963b892' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\inc\\header.tpl',
      1 => 1505287722,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/head.tpl' => 1,
  ),
),false)) {
function content_59b8e5735a6923_83109779 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php $_smarty_tpl->_subTemplateRender("file:inc/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<body>
    <!--头部导航-->
    <div class='header header-fixed'>
        <header id="header" class="navVisible">
            <div class="header-logo" style="display:none;"><a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['root_url'];?>
"><img src="http://tx.ext2/theme/en_us/sys/<?php echo $_smarty_tpl->tpl_vars['site']->value['site_logo'];?>
" alt="<?php echo $_smarty_tpl->tpl_vars['site']->value['site_name'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['site']->value['site_name'];?>
"></a></div>
            <div class="header-logo-hidden" style="display:inline-block;"><a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['root_url'];?>
"><img src="http://tx.ext2/theme/en_us/sys/<?php echo $_smarty_tpl->tpl_vars['site']->value['site_logo'];?>
" alt="<?php echo $_smarty_tpl->tpl_vars['site']->value['site_name'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['site']->value['site_name'];?>
"></a></div>
            <div class="header-body">
                <div class="header-buttons">
                    <button class="header-menu-button"></button>
                    <div class="header_gather_botton">
                        <div class="header-search-button"></div>
                        <?php if ($_smarty_tpl->tpl_vars['user']->value) {?><div class="header-shoppings-button"><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['order'];?>
"></a></div><?php }?>
                        <div class="header-message-button" ><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
"></a></div>
                        <div class="header-connect-button">
                                <a href="tel:15375299292"></a>
                                <div class="index_contact_us_con" style="display:none;">
                                    <h6><span class="img"><img src="http://tx.ext2/theme/en_us/img/iphone1.png"></span>Contact Us</h6>
                                    <div class="content"></div>
                                    <div class="lianxi">
                                        <p><?php echo $_smarty_tpl->tpl_vars['site']->value['tel'];?>
</p>
                                        <p><?php echo $_smarty_tpl->tpl_vars['site']->value['email'];?>
</p>
                                    </div>  
                                    <p class="dianji"><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
">Guestbook</a></p>
                                </div>
                        </div>
                    </div>
                    <?php if ($_smarty_tpl->tpl_vars['open']->value['user']) {?>
                    <div class="login">
                        <?php if ($_smarty_tpl->tpl_vars['user']->value) {?>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['user'];?>
" class="login_in"><?php echo $_smarty_tpl->tpl_vars['user']->value['user_name'];?>
</a>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['logout'];?>
" class="register">Logout</a>
                        <?php } else { ?>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['login'];?>
" class="login_in">Login</a>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['register'];?>
" class="register">Register</a>
                        <?php }?>
                    </div>
                    <?php }?>
                    <a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['root_url'];?>
?langchange=<?php echo $_smarty_tpl->tpl_vars['site']->value['lang_type'];?>
" class="header-toggle-button"><img src="http://tx.ext2/theme/en_us/img/guoqi.gif"></a>
                </div>
                <!--菜单导航-->
                <div class="header-menu" style="">
                    <button type="" class="header-menu-close-button"></button>
                    <div class="listPromo">
                        <div class="header_gather_bottom_botton">
                            <div class="header-search-button" type="submit"></div>
                            <?php if ($_smarty_tpl->tpl_vars['user']->value) {?><div class="header-shoppings-button"><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['order'];?>
"></a></div><?php }?>
                            <div class="header-message-button" ><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
"></a></div>
                            <div class="header-connect-button"><a href="tel:15375299292"></a></div>
                        </div>
                        <ul class="listPromo-items">
                            <?php if (!$_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
                            <li class="listpromo-items-item <?php if ($_smarty_tpl->tpl_vars['index']->value['cur']) {?>active<?php }?>">
                                <div class="listpromo-items-item-tit"><a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['root_url'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['home'];?>
</a></div>   
                            </li>
                            <?php }?>

                            <li class="listpromo-items-item listpromo-items-item-hasContent <?php if ($_smarty_tpl->tpl_vars['product']->value['cur']) {?>active<?php }?>">
                                <div class="listpromo-items-item-tit"><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['product'];?>
">Products</a><span class="icon_x"></span></div>      
                                <ol class="hasContent"  style="display:none;">
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['nav_product']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                                    <?php if ($_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
                                        <?php if (in_array($_smarty_tpl->tpl_vars['v']->value['cat_id'],array(4,22))) {?>
                                        <li>
                                            <div class="hasContent_three">
                                                <a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a>
                                                <?php if ($_smarty_tpl->tpl_vars['v']->value['child']) {?><span class="icon_x"></span><?php }?>
                                            </div>
                                            <ul class="hasContent_three_content" style="display:none">
                                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['v']->value['child'], 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
                                                <li><a <?php if ($_smarty_tpl->tpl_vars['t']->value['cur']) {?>class="active"<?php }?> href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['t']->value['cat_name'];?>
</a></li>
                                                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                                            </ul>   
                                        </li>
                                        <?php } else { ?>
                                        <li></li>
                                        <?php }?>
                                    <?php } else { ?>
                                        <?php if (in_array($_smarty_tpl->tpl_vars['v']->value['cat_id'],array(4,22))) {?>
                                        <li>
                                            <div class="hasContent_three">
                                                <a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a>
                                            </div>
                                        </li>
                                        <?php } else { ?>
                                        <li>
                                            <div class="hasContent_three">
                                                <a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a>
                                                <?php if ($_smarty_tpl->tpl_vars['v']->value['child']) {?><span class="icon_x"></span><?php }?>
                                            </div>
                                            <ul class="hasContent_three_content" style="display:none">
                                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['v']->value['child'], 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
                                                <li><a <?php if ($_smarty_tpl->tpl_vars['t']->value['cur']) {?>class="active"<?php }?> href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['t']->value['cat_name'];?>
</a></li>
                                                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                                            </ul>   
                                        </li>
                                        <?php }?>
                                    <?php }?>
                                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                                </ol>
                            </li>

                            <?php if (!$_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['nav_middle_list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                            <li class="listpromo-items-item listpromo-items-item-hasContent <?php if ($_smarty_tpl->tpl_vars['v']->value['cur']) {?>active<?php }?>">

                                <div class="listpromo-items-item-tit"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['nav_name'];?>
</a><?php if ($_smarty_tpl->tpl_vars['v']->value['child']) {?><span class="icon_x"></span><?php }?></div>      
                                <ol class="hasContent"  style="display:none;">
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['v']->value['child'], 's');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['s']->value) {
?>
                                    <li>
                                        <div class="hasContent_three">
                                            <a href="<?php echo $_smarty_tpl->tpl_vars['s']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['s']->value['nav_name'];?>
</a>
                                            <?php if ($_smarty_tpl->tpl_vars['s']->value['child']) {?><span class="icon_x"></span><?php }?>
                                        </div>
                                        <ul class="hasContent_three_content" style="display:none">
                                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['s']->value['child'], 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
                                            <li><a <?php if ($_smarty_tpl->tpl_vars['t']->value['cur']) {?>class="active"<?php }?> href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['t']->value['nav_name'];?>
</a></li>
                                            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                                        </ul>   
                                    </li>
                                    <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                                </ol>
                            </li>
                            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

                            <?php }?>
                        </ul>   
                    </div>
                </div>
            </div>
            <!-- 搜索 -->
            <div class="home_serach" style="display:none;">
                <button class="close"></button>
                <div class="home_serach_con">
                    <form action="search.php" method="post" accept-charset="<?php echo $_smarty_tpl->tpl_vars['site']->value['dou_charset'];?>
" class="Search-form">
                        <?php if ($_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
                        <input type="hidden" name="module" value="product">
                        <?php } else { ?>
                        <input type="hidden" name="module" value="article">
                        <?php }?>
                        <input class="Search-input" type="text" name="srcval" placeholder="<?php if ($_smarty_tpl->tpl_vars['srcval']->value) {
echo $_smarty_tpl->tpl_vars['srcval']->value;
} else { ?>Keyword<?php }?>">
                        <button style="border:1px solid #CCC;background-color:#EEE;padding:5px;" type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </header>
    </div>
<?php }
}
