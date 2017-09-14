
<!--{include file='inc/head.tpl'}-->
<body>
<!--头部导航S-->
<div class="header-top">
    <div class="header-body">
        <div class="header-buttons">
            <!--{if $open.user}-->
            <!--{if $user}-->
                <div class="login">
                    <a href="{$url.user}">{$user.user_name}<!-- ，{*$lang.user_welcom_top*} --></a><a href="{$url.logout}">{$lang.user_logout}</a>
                </div>
                <div class="header-shoppings-button"><a href="{$url.order}"></a></div>
            <!--{else}-->
                <div class="login">
                    <a href="{$url.login}">{$lang.user_login_nav}</a><a>/</a><a href="{$url.register}">{$lang.user_register_nav}</a>
                </div>
            <!--{/if}-->
            <!--{/if}-->
            <div class="header-connect-button">
                <a href="tel:15375299292"></a>
                <div class="index_contact_us_con" style="display:none;">
                    <h6><span class="img"><img src="img/iphone1.png"></span>联系我们</h6>
                    <div class="content"></div>
                    <div class="lianxi">
                        <p>{$site.tel}</p>
                        <p>{$site.email}</p>
                    </div>  
                    <p class="dianji"><a href="{$url.guestbook}">留言</a></p>
                </div>
            </div>
            <div class="header-message-button" ><a href="{$url.guestbook}"></a></div>
            <button class="header-search-button"></button>
            <a class="header-toggle-button" href="{$site.root_url}?lchange={$site.lang_type}">中/ENG</a>
        </div>
    </div>
</div>
<!--搜索框-->
<div class="header-top-search">
    <div class="headerTop_serCon">
        <form action="search.php" method="POST" accept-charset="{$site.dou_charset}">
            <!-- {if $site.cypro} -->
            <input type="hidden" name="module" value="product">
            <!-- {else} -->
            <select name="module" style="height:30px;line-height:30px;border:none;">
                <option {if $module eq 'project' || $module eq null}selected{/if} value="product">产品</option>
                <option {if $module eq 'article'}selected{/if} value="article">文章</option>
            </select>
            <!-- {/if} -->
            <input type="text" name="srcval" placeholder="{if $srcval}{$srcval}{else}请输入搜索内容{/if}">
            <button type="submit"></button>
        </form>
        <button type="" class="close"></button>
    </div>
</div>
<!--头部导航E-->

<!--主导航S-->
<header class="china_header ">
    <div class="header_back">
        <div class="logo"><h1><a href="{$site.root_url}"><img src="sys/{$site.site_logo}" alt="{$site.site_name}" title="{$site.site_name}"></a></h1></div>
        <div class="header-button">
            <button class="header-menu-button header-menu-button-toggle" type="submit"></button>
        </div>
    </div>
    <!--菜单导航-->
    <div class="china_nav">
        <ul class="chinaNav_header ">
            <!-- {if !$site.cypro} -->
            <li class="{if $index.cur}active on{/if}">
                <div class="headerContent_item">
                    <a href="{$site.root_url}">{$lang.home}</a>
                </div>
            </li>
            <!-- {/if} -->

            <li class="header_hasContent {if $product.cur}active{/if}">
                <div class="headerContent_item arr1">
                    <a href="{$url.product}">产品</a>
                </div>
                <div class="china_nav_content " style="display:none;">
                    <ol class="chinaNav_content_item">
                        <!-- {foreach $nav_product $v} -->
                        <!-- {if $site.cypro} -->
                            <!-- {if in_array($v.cat_id,array(4,22))} -->
                            <li class="chinaNav_content_items">
                                <p class="arr1"><a href="{$v.url}">{$v.cat_name}</a></p>
                                <ul class="chinaNav_content">
                                    <!-- {foreach $v.child $t} -->
                                    <li><a href="{$t.url}">{$t.cat_name}</a></li>
                                    <!-- {/foreach} -->
                                </ul>
                            </li>
                            <!-- {else} -->
                            <li></li>
                            <!-- {/if} -->
                        <!-- {else} -->
                            <!-- {if in_array($v.cat_id,array(4,22))} -->
                            <li class="chinaNav_content_items">
                                <p class="arr1"><a href="{$v.url}">{$v.cat_name}</a></p>
                            </li>
                            <!-- {else} -->
                            <li class="chinaNav_content_items">
                                <p class="arr1"><a href="{$v.url}">{$v.cat_name}</a></p>
                                <ul class="chinaNav_content">
                                    <!-- {foreach $v.child $t} -->
                                    <li><a href="{$t.url}">{$t.cat_name}</a></li>
                                    <!-- {/foreach} -->
                                </ul>
                            </li>
                            <!-- {/if} -->
                        <!-- {/if} -->
                        <!-- {/foreach} -->
                    </ol>
                </div>
            </li>

            <!-- {if !$site.cypro} -->
            <!-- {foreach $nav_middle_list $f} -->
            <li class="header_hasContent {if $f.cur}active{/if}" >
                <div class="headerContent_item arr1">
                    <a href="{$f.url}">{$f.nav_name}</a>
                </div>
                <!-- {if $f.child} -->
                <div class="china_nav_content" style="display:none;">
                    <ol class="chinaNav_content_item">
                        <!-- {foreach $f.child $s} -->
                        <li class="chinaNav_content_items">
                            <p class="arr1"><a href="{$s.url}">{$s.nav_name}</a></p>
                            <ul class="chinaNav_content">
                                <!-- {foreach $s.child $t} -->
                                <li><a href="{$t.url}">{$t.nav_name}</a></li>
                                <!-- {/foreach} -->
                            </ul>
                        </li>
                        <!-- {/foreach} -->
                    </ol>
                </div>
                <!-- {/if} -->
            </li>
            <!-- {/foreach} -->
            <!-- {/if} -->
        </ul>
    </div>
</header>
<!--主导航E-->
