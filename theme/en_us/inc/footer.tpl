<!-- 底部 -->
<footer class="footer">
    <div class="footer1">
        <ul class="nav">
            <!-- {if $site.cypro} -->
            <li><a href="{$site.domain}">{$lang.homepage}</a></li>
            <!-- {else} -->
            <!-- {foreach $nav_bottom_list $v} -->
            <li><a href="{$v.url}">{$v.nav_name}</a></li>
            <!-- {/foreach} -->
            <!-- {/if} -->
        </ul>
        <div class="footer_search">
            <div class="footerSearch">
                <div class="footerser">
                    <form action="search.php" method="POST" accept-charset="{$site.dou_charset}">
                        <input type="hidden" name="module" value="product">
                        <input type="text" name="srcval" placeholder="{if $srcval}{$srcval}{else}Keyword{/if}">
                        <button type="submit"></button>
                    </form>
                </div>
            </div>
            <div class="footer_share">
                <span>Share</span>
                <div class="footer_share_btn">
                    <div class="bshare-custom">
                        <a title="ShareToFacebook" class="bshare-facebook"></a>
                        <a title="ShareToLinkedIn" class="bshare-linkedin"></a>
                        <a title="ShareToTwitter" class="bshare-twitter"></a>
                        <a title="ShareToNetvibes" class="bshare-netvibes"></a>
                        <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/button.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
                        <a class="bshareDiv" onclick="javascript:return false;"></a>
                        <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
                    </div>
                </div>
            </div>
        </div>
        <!-- </div> -->
    </footer>

    <footer class="footer2">
        <div class="footer2-content">
            <p>{$site.copyright} <br> {$site.icp}</p>
        </div>
    </footer>
    <div class="doc_up"><a href="#"></a></div>
</div>

<!--{if $site.code}-->
<div style="display:none">{$site.code}</div>
<!--{/if}-->
<!-- 底部生效JS -->
<script src="js/index.js"></script>
</body>
</html>