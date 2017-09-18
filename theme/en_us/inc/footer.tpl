<!-- 底部 -->
    <footer class="footer">
        <div class="footer1">
            <ul class="nav">
                <li><a href="#"></a></li>
            </ul>
            <div class="footer_search">
                <div class="footerSearch">
                    <div class="footerser">
                        <form action="search.php" method="POST" accept-charset="{$site.dou_charset}">
                            <!-- {if $site.cypro} -->
                            <input type="hidden" name="module" value="product">
                            <!-- {else} -->
                            <select name="module" style="height:30px;line-height:30px;border:none;">
                                <option {if $module eq 'project' || $module eq null}selected{/if} value="product">Product</option>
                                <option {if $module eq 'article'}selected{/if} value="article">Article</option>
                            </select>
                            <!-- {/if} -->
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