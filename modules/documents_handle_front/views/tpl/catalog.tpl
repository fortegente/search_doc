[{capture append="oxidBlock_content"}]
    [{assign var=pgrp value=''}]
    [{assign var=lstdssu value=''}]
    <h1 class="pageHead">[{ oxmultilang ident="LINKS" }]</h1>
        <ul>
            [{foreach from=$oView->getCatalogList() item=catalog}]
                [{assign var=catalogInfo value="."|explode:$catalog->zscatalog__oxid->value}]
            [{if $catalogInfo|@count == 2}]
                [{assign var=pgrp value="&pgrp=$catalogInfo[1]"}]
            [{/if}]
            [{if $catalogInfo|@count == 3}]
                [{assign var=lstdssu value="&lstdssu=$catalogInfo[2]"}]
            [{/if}]
                <li>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=catalog&grp="}][{$catalogInfo[0]}][{$pgrp}][{$lstdssu}]">
                        [{$catalog->zscatalog__oxid->value}] [{$catalog->zscatalog__title->value}]
                    </a>
                    <span>[{$catalog->zscatalog__count_sub_cat}]</span>
                </li>
            [{/foreach}]
        </ul>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]