[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="LATEST_NEWS_AND_UPDATES_AT"|oxmultilangassign}]
    <div>
    [{assign var="oNews" value=$oView->getNews() }]
        <div id="header-info-block">
            <h2>[{oxmultilang ident="DOCS_NEWS"}]</h2>
        </div>
        [{if !empty($oNews)}]
        [{foreach from=$oNews item=oNewsEntry}]
            [{if !empty($oNewsEntry) && !empty($oNewsEntry->oxnews__oxshortdesc->value)}]
                <div class="news_block">
                    <h1>
                        <span>[{$oNewsEntry->oxnews__oxdate->value|date_format:"%d.%m.%Y"}] - </span> [{$oNewsEntry->oxnews__oxshortdesc->value}]
                    </h1>
                    <span class="content">[{$oNewsEntry->getLongDesc() force=1}]</span>
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
