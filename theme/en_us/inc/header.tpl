
<!--{include file='inc/head.tpl'}-->
<body>
    <!--头部导航-->
    <div class='header header-fixed'>
        <header id="header" class="navVisible">
            <div class="header-logo" style="display:none;"><a href="{$site.root_url}"><img src="sys/{$site.site_logo}" alt="{$site.site_name}" title="{$site.site_name}"></a></div>
            <div class="header-logo-hidden" style="display:inline-block;"><a href="{$site.root_url}"><img src="sys/{$site.site_logo}" alt="{$site.site_name}" title="{$site.site_name}"></a></div>
            <div class="header-body">
                <div class="header-buttons">
                    <button class="header-menu-button"></button>
                    <div class="header_gather_botton">
                        <div class="header-search-button"></div>
                        <!--{if $user}--><div class="header-shoppings-button"><a href="{$url.order}"></a></div><!--{/if}-->
                        <div class="header-message-button" ><a href="{$url.guestbook}"></a></div>
                        <div class="header-connect-button">
                                <a href="tel:15375299292"></a>
                                <div class="index_contact_us_con" style="display:none;">
                                    <h6><span class="img"><img src="img/iphone1.png"></span>Contact Us</h6>
                                    <div class="content"></div>
                                    <div class="lianxi">
                                        <p>{$site.tel}</p>
                                        <p>{$site.email}</p>
                                    </div>  
                                    <p class="dianji"><a href="{$url.guestbook}">Message</a></p>
                                </div>
                        </div>
                    </div>
                    <!--{if $open.user}-->
                    <div class="login">
                        <!--{if $user}-->
                        <a href="{$url.user}" class="login_in">{$user.user_name}</a>
                        <a href="{$url.logout}" class="register">Logout</a>
                        <!-- {else} -->
                        <a href="{$url.login}" class="login_in">Login</a>
                        <a href="{$url.register}" class="register">Register</a>
                        <!-- {/if} -->
                    </div>
                    <!--{/if}-->
                    <a href="{$site.root_url}?lchange={if $site.lang_type}$site.lang_type{else}1{/if}" class="header-toggle-button"><img src="img/guoqi.gif"></a>
                </div>
                <!--菜单导航-->
                <div class="header-menu" style="">
                    <button type="" class="header-menu-close-button"></button>
                    <div class="listPromo">
                        <div class="header_gather_bottom_botton">
                            <div class="header-search-button" type="submit"></div>
                            <!--{if $user}--><div class="header-shoppings-button"><a href="{$url.order}"></a></div><!-- {/if} -->
                            <div class="header-message-button" ><a href="{$url.guestbook}"></a></div>
                            <div class="header-connect-button"><a href="tel:15375299292"></a></div>
                        </div>
                        <ul class="listPromo-items">
                            <!-- {if !$site.cypro} -->
                            <li class="listpromo-items-item {if $index.cur}active{/if}">
                                <div class="listpromo-items-item-tit"><a href="{$site.root_url}">{$lang.home}</a></div>   
                            </li>
                            <!-- {/if} -->

                            <li class="listpromo-items-item listpromo-items-item-hasContent {if $product.cur}active{/if}">
                                <div class="listpromo-items-item-tit"><a href="{$url.product}">Products</a><span class="icon_x"></span></div>      
                                <ol class="hasContent"  style="display:none;">
                                    <!-- {foreach $nav_product $v} -->
                                    <!-- {if $site.cypro} -->
                                        <!-- {if in_array($v.cat_id,array(4,22))} -->
                                        <li>
                                            <div class="hasContent_three">
                                                <a href="{$v.url}">{$v.cat_name}</a>
                                                {if $v.child}<span class="icon_x"></span>{/if}
                                            </div>
                                            <ul class="hasContent_three_content" style="display:none">
                                                <!-- {foreach $v.child $t} -->
                                                <li><a {if $t.cur}class="active"{/if} href="{$t.url}">{$t.cat_name}</a></li>
                                                <!-- {/foreach} -->
                                            </ul>   
                                        </li>
                                        <!-- {else} -->
                                        <li></li>
                                        <!-- {/if} -->
                                    <!-- {else} -->
                                        <!-- {if in_array($v.cat_id,array(4,22))} -->
                                        <li>
                                            <div class="hasContent_three">
                                                <a href="{$v.url}">{$v.cat_name}</a>
                                            </div>
                                        </li>
                                        <!-- {else} -->
                                        <li>
                                            <div class="hasContent_three">
                                                <a href="{$v.url}">{$v.cat_name}</a>
                                                {if $v.child}<span class="icon_x"></span>{/if}
                                            </div>
                                            <ul class="hasContent_three_content" style="display:none">
                                                <!-- {foreach $v.child $t} -->
                                                <li><a {if $t.cur}class="active"{/if} href="{$t.url}">{$t.cat_name}</a></li>
                                                <!-- {/foreach} -->
                                            </ul>   
                                        </li>
                                        <!-- {/if} -->
                                    <!-- {/if} -->
                                    <!-- {/foreach} -->
                                </ol>
                            </li>

                            <!-- {if !$site.cypro} -->
                            <!-- {foreach $nav_middle_list $v} -->
                            <li class="listpromo-items-item listpromo-items-item-hasContent {if $v.cur}active{/if}">

                                <div class="listpromo-items-item-tit"><a href="{$v.url}">{$v.nav_name}</a>{if $v.child}<span class="icon_x"></span>{/if}</div>      
                                <ol class="hasContent"  style="display:none;">
                                    <!-- {foreach $v.child $s} -->
                                    <li>
                                        <div class="hasContent_three">
                                            <a href="{$s.url}">{$s.nav_name}</a>
                                            {if $s.child}<span class="icon_x"></span>{/if}
                                        </div>
                                        <ul class="hasContent_three_content" style="display:none">
                                            <!-- {foreach $s.child $t} -->
                                            <li><a {if $t.cur}class="active"{/if} href="{$t.url}">{$t.nav_name}</a></li>
                                            <!-- {/foreach} -->
                                        </ul>   
                                    </li>
                                    <!-- {/foreach} -->
                                </ol>
                            </li>
                            <!-- {/foreach} -->
                            <!-- {/if} -->
                        </ul>   
                    </div>
                </div>
            </div>
            <!-- 搜索 -->
            <div class="home_serach" style="display:none;">
                <button class="close"></button>
                <div class="home_serach_con">
                    <form action="search.php" method="post" accept-charset="{$site.dou_charset}" class="Search-form">
                        <!-- {if $site.cypro} -->
                        <input type="hidden" name="module" value="product">
                        <!-- {else} -->
                        <input type="hidden" name="module" value="article">
                        <!-- {/if} -->
                        <input class="Search-input" type="text" name="srcval" placeholder="{if $srcval}{$srcval}{else}Keyword{/if}">
                        <button style="border:1px solid #CCC;background-color:#EEE;padding:5px;" type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </header>
    </div>
