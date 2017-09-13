<?php
/* Smarty version 3.1.30, created on 2017-09-13 15:54:58
  from "D:\phpStudy\WWW\GitHub\cy\theme\zh_cn\inc\header.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8e4527e7540_79755693',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '40d0591fa17c0830cbd8d7f0c59d53a3835a1add' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\zh_cn\\inc\\header.tpl',
      1 => 1505287723,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/head.tpl' => 1,
  ),
),false)) {
function content_59b8e4527e7540_79755693 (Smarty_Internal_Template $_smarty_tpl) {
?>

<?php $_smarty_tpl->_subTemplateRender("file:inc/head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<body>
<!--头部导航S-->
<div class="header-top">
    <div class="header-body">
        <div class="header-buttons">
            <?php if ($_smarty_tpl->tpl_vars['open']->value['user']) {?>
            <?php if ($_smarty_tpl->tpl_vars['user']->value) {?>
                <div class="login">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['user'];?>
"><?php echo $_smarty_tpl->tpl_vars['user']->value['user_name'];?>
</a><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['logout'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['user_logout'];?>
</a>
                </div>
                <div class="header-shoppings-button"><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['order'];?>
"></a></div>
            <?php } else { ?>
                <div class="login">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['login'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['user_login_nav'];?>
</a><a>/</a><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['register'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['user_register_nav'];?>
</a>
                </div>
            <?php }?>
            <?php }?>
            <div class="header-connect-button">
                <a href="tel:15375299292"></a>
                <div class="index_contact_us_con" style="display:none;">
                    <h6><span class="img"><img src="http://tx.ext2/theme/zh_cn/img/iphone1.png"></span>Contact Us</h6>
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
            <div class="header-message-button" ><a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
"></a></div>
            <button class="header-search-button"></button>
            <a class="header-toggle-button" href="<?php echo $_smarty_tpl->tpl_vars['site']->value['root_url'];?>
?langchange=<?php echo $_smarty_tpl->tpl_vars['site']->value['lang_type'];?>
">中/ENG</a>
        </div>
    </div>
</div>
<!--搜索框-->
<div class="header-top-search">
    <div class="headerTop_serCon">
        <form action="search.php" method="POST" accept-charset="<?php echo $_smarty_tpl->tpl_vars['site']->value['dou_charset'];?>
">
            <?php if ($_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
            <input type="hidden" name="module" value="product">
            <?php } else { ?>
            <select name="module" style="height:30px;line-height:30px;border:none;">
                <option <?php if ($_smarty_tpl->tpl_vars['module']->value == 'project' || $_smarty_tpl->tpl_vars['module']->value == null) {?>selected<?php }?> value="product">产品</option>
                <option <?php if ($_smarty_tpl->tpl_vars['module']->value == 'article') {?>selected<?php }?> value="article">文章</option>
            </select>
            <?php }?>
            <input type="text" name="srcval" placeholder="<?php if ($_smarty_tpl->tpl_vars['srcval']->value) {
echo $_smarty_tpl->tpl_vars['srcval']->value;
} else { ?>请输入搜索内容<?php }?>">
            <button type="submit"></button>
        </form>
        <button type="" class="close"></button>
    </div>
</div>
<!--头部导航E-->

<!--主导航S-->
<header class="china_header ">
    <div class="header_back">
        <div class="logo"><h1><a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['root_url'];?>
"><img src="http://tx.ext2/theme/zh_cn/sys/<?php echo $_smarty_tpl->tpl_vars['site']->value['site_logo'];?>
" alt="<?php echo $_smarty_tpl->tpl_vars['site']->value['site_name'];?>
" title="<?php echo $_smarty_tpl->tpl_vars['site']->value['site_name'];?>
"></a></h1></div>
        <div class="header-button">
            <button class="header-menu-button header-menu-button-toggle" type="submit"></button>
        </div>
    </div>
    <!--菜单导航-->
    <div class="china_nav">
        <ul class="chinaNav_header ">
            <?php if (!$_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
            <li class="<?php if ($_smarty_tpl->tpl_vars['index']->value['cur']) {?>active on<?php }?>">
                <div class="headerContent_item">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['site']->value['root_url'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['home'];?>
</a>
                </div>
            </li>
            <?php }?>

            <li class="header_hasContent <?php if ($_smarty_tpl->tpl_vars['product']->value['cur']) {?>active<?php }?>">
                <div class="headerContent_item arr1">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['product'];?>
">产品</a>
                </div>
                <div class="china_nav_content " style="display:none;">
                    <ol class="chinaNav_content_item">
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['nav_product']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                        <?php if ($_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
                            <?php if (in_array($_smarty_tpl->tpl_vars['v']->value['cat_id'],array(4,22))) {?>
                            <li class="chinaNav_content_items">
                                <p class="arr1"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a></p>
                                <ul class="chinaNav_content">
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['v']->value['child'], 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
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
                            <li class="chinaNav_content_items">
                                <p class="arr1"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a></p>
                            </li>
                            <?php } else { ?>
                            <li class="chinaNav_content_items">
                                <p class="arr1"><a href="<?php echo $_smarty_tpl->tpl_vars['v']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['v']->value['cat_name'];?>
</a></p>
                                <ul class="chinaNav_content">
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['v']->value['child'], 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
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
                </div>
            </li>

            <?php if (!$_smarty_tpl->tpl_vars['site']->value['cypro']) {?>
            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['nav_middle_list']->value, 'f');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['f']->value) {
?>
            <li class="header_hasContent <?php if ($_smarty_tpl->tpl_vars['f']->value['cur']) {?>active<?php }?>" >
                <div class="headerContent_item arr1">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['f']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['f']->value['nav_name'];?>
</a>
                </div>
                <?php if ($_smarty_tpl->tpl_vars['f']->value['child']) {?>
                <div class="china_nav_content" style="display:none;">
                    <ol class="chinaNav_content_item">
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['f']->value['child'], 's');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['s']->value) {
?>
                        <li class="chinaNav_content_items">
                            <p class="arr1"><a href="<?php echo $_smarty_tpl->tpl_vars['s']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['s']->value['nav_name'];?>
</a></p>
                            <ul class="chinaNav_content">
                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['s']->value['child'], 't');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['t']->value) {
?>
                                <li><a href="<?php echo $_smarty_tpl->tpl_vars['t']->value['url'];?>
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
                </div>
                <?php }?>
            </li>
            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

            <?php }?>
        </ul>
    </div>
</header>
<!--主导航E-->
<?php }
}
