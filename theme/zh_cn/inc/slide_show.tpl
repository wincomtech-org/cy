<!--轮播-->
<!--{if $show_list}-->
<section class="indexCarousel _module">
    <div id="slider">
        <ul class="slides clearfix">
            <!--{foreach $show_list $v}-->
            <li><img class="responsive" src="{$v.show_img}"></li>
            <!--{/foreach}-->
        </ul>
        <ul class="pagination">
            <!--{foreach $show_list as $k=>$v}-->
            <li {if $k eq 0}class="active"{/if}></li>
            <!--{/foreach}-->
        </ul>
    </div>
</section>
<!--{/if}-->