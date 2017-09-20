<!-- 底部 -->
    <footer class="footer">
    <div class="footer1">
        <ul class="nav">
            <!--{if $site.cypro}-->
            <li><a href="{$site.domain}">{$lang.homepage}</a></li>
            <!--{else}-->
            <!--{foreach $nav_bottom_list $v}-->
            <li><a href="{$v.url}">{$v.nav_name}</a></li>
            <!--{/foreach}-->
            <!--{/if}-->
        </ul>
        <div class="footer_search">
            <div class="footerSearch">
                <span>搜索</span>
                <div class="footerser">
                    <form action="search.php" method="POST" accept-charset="{$site.dou_charset}">
                        <!--{if $site.cypro}-->
                        <input type="hidden" name="module" value="product">
                        <!--{else}-->
                        <select name="module" style="height:30px;line-height:30px;border:none;">
                            <option {if $module eq 'project' || $module eq null}selected{/if} value="product">产品</option>
                            <option {if $module eq 'article'}selected{/if} value="article">文章</option>
                            <span class="module_arr"></span>
                        </select>
                        <!--{/if}-->
                        <input type="text" name="srcval" placeholder="{if $srcval}{$srcval}{else}关键词{/if}">
                        <button type="submit"></button>
                    </form>
                </div>
            </div>
            <div class="footer_share">
                <span>分享与关注</span>
                <div class="footer_share_btn">
                    <div class="bshare-custom icon-medium">
                        <a title="分享到Facebook" class="bshare-facebook"></a>
                        <a title="分享到LinkedIn" class="bshare-linkedin"></a>
                        <a title="分享到Twitter" class="bshare-twitter"></a>
                        <a title="分享到Netvibes" class="bshare-netvibes"></a>
                        <a title="分享到微信" class="bshare-weixin"></a>
                    </div>
                    <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/button.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
                    <a class="bshareDiv" onclick="javascript:return false;"></a>
                    <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
                </div>
            </div>
        </div>
    <!-- </div> -->
    </footer>

    <footer class="footer2">
        <div class="footer2-content">
            <p><!--{if $site.icp}--><a href="http://www.miibeian.gov.cn/" target="_blank">{$site.icp}</a><!--{/if}--></p>
            <p>{$site.copyright}</p>
        </div>
    </footer>
    <div class="doc_up"><a href="#"></a></div>

    <!--{if $site.code}-->
    <div style="display:none">{$site.code}</div>
    <!--{/if}-->
    <!-- 底部生效JS -->
    <script src="js/easySlider.min.js"></script>
    <script src="js/common.js"></script>
    <script src="js/index.js"></script>
</body>
</html>