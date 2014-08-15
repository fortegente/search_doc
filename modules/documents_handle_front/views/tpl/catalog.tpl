[{capture append="oxidBlock_content"}]
    [{assign var=pgrp value=''}]
    [{assign var=lstdssu value=''}]
    [{assign var=catalogList value=$oView->getCatalogList()}]
    <h1 class="pageHead">[{oxmultilang ident="LINKS" }]</h1>
        [{if $catalogList|@count}]
            <ul>
                [{foreach from=$catalogList item=catalog}]
                    [{assign var=catalogInfo value="."|explode:$catalog.id}]
                [{if $catalogInfo|@count == 2}]
                    [{assign var=pgrp value="&pgrp=$catalogInfo[1]"}]
                [{/if}]
                [{if $catalogInfo|@count == 3}]
                    [{assign var=pgrp value="&pgrp=$catalogInfo[1]"}]
                    [{assign var=lstdssu value="&lstdssu=$catalogInfo[2]"}]
                [{/if}]
                    <li>
                        [{if $catalog.qnt > 0}]
                            [{if $lstdssu || $catalog.runToDocuments}]
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents&nd="}][{$catalog.id}]">
                            [{else}]
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=catalog&grp="}][{$catalogInfo[0]}][{$pgrp}][{$lstdssu}]">
                            [{/if}]
                        [{/if}]
                            [{$catalog.id}] [{$catalog.title}]
                        [{if $catalog.qnt > 0}]
                            </a>
                        [{/if}]
                        </br>[{$catalog.text}] <span>[{$catalog.qnt}]</span>
                    </li>
                [{/foreach}]
            </ul>
        [{else}]
            [{oxmultilang ident="DOCS_NO_CATEGORY" }]
        [{/if}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]