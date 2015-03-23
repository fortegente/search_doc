[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="DOCS_NEWS"|oxmultilangassign}]
    <div>
    [{assign var="oNews" value=$oView->getNews() }]
        <div id="header-info-block">
            <h2>[{oxmultilang ident="DOCS_NEWS"}]</h2>
        </div>
        [{if !empty($oNews)}]
        [{foreach from=$oNews item=oNewsEntry}]
        [{assign var="oNewsDescr" value=$oNewsEntry->getLongDesc()}]
            [{if !empty($oNewsEntry) && !empty($oNewsEntry->oxnews__oxshortdesc->value)}]
                <div class="news_block">
                    <h1>
                        <span>[{$oNewsEntry->oxnews__oxdate->value|date_format:"%d.%m.%Y"}] - </span> [{$oNewsEntry->oxnews__oxshortdesc->value}]
                    </h1>
                    <span class="content">
                        <span class="short_descr">[{$oNewsDescr|strip_tags|oxtruncate:200}]</span>
                        <a class="show_news" href="javascript:void()"}] class="readMore">[{oxmultilang ident="MORE_NEWS"}]</a>
                        <span class="hidden_text">
                            [{$oNewsDescr}]
                            <a class="hide_news" href="javascript:void()"}] class="readMore">[{oxmultilang ident="HIDE_NEWS"}]</a>
                        </span>
                    </span>
                </div>
            [{/if}]
        [{/foreach}]
        [{else}]
            [{assign var="customMessage" value="LATEST_NEWS_NOACTIVENEWS"|oxmultilangassign}]
            [{include file="message/errors.tpl" customMessage=$customMessage}]
        [{/if}]
    </div>
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
    [{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
<script>
    jQuery('.news_block .show_news').click(function() {
        jQuery(this).hide();
        jQuery(this).prev().hide();
        jQuery(this).next().show();
        jQuery(this).next().find('.hide_news').show();;
    });
    jQuery('.news_block .hide_news').click(function() {
        jQuery(this).hide();
        jQuery(this).parents('span.content').find('.show_news').show();
        jQuery(this).parents('span.content').find('.short_descr').show();
        jQuery(this).parent('.hidden_text').hide();

    });
</script>
