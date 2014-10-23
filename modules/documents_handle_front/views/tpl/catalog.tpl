[{capture append="oxidBlock_content"}]
    [{assign var=pgrp value=''}]
    [{assign var=lstdssu value=''}]
    [{assign var=catalogList value=$oView->getCatalogList()}]
    <div id="header-info-block">
        <h2>Список</h2>
    </div>
    [{if $catalogList|@count}]
    <table id="documents_table">
        [{foreach from=$catalogList item=catalog}]
            [{assign var=catalogInfo value="."|explode:$catalog.id}]
            [{if $catalogInfo|@count == 2}]
                [{assign var=pgrp value="&pgrp=$catalogInfo[1]"}]
            [{/if}]
            [{if $catalogInfo|@count == 3}]
                [{assign var=pgrp value="&pgrp=$catalogInfo[1]"}]
                [{assign var=lstdssu value="&lstdssu=$catalogInfo[2]"}]
            [{/if}]
            <tr>
                <td>
                    [{if $catalog.qnt > 0}]
                        [{if $lstdssu || $catalog.runToDocuments}]
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents&nd="}][{$catalog.id}]">
                        [{else}]
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=catalog&grp="}][{$catalogInfo[0]}][{$pgrp}][{$lstdssu}]">
                        [{/if}]
                    [{/if}]
                    [{$catalog.id}]
                    [{if $catalog.qnt > 0}]
                        </a>
                    [{/if}]
                </td>
                <td>
                    [{if $catalog.qnt > 0}]
                    [{if $lstdssu || $catalog.runToDocuments}]
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents&nd="}][{$catalog.id}]">
                    [{else}]
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=catalog&grp="}][{$catalogInfo[0]}][{$pgrp}][{$lstdssu}]">
                            [{/if}]
                            [{/if}]
                            [{$catalog.title}]
                            [{if $catalog.qnt > 0}]
                        </a>
                    [{/if}]
                    </br><small>[{$catalog.text}] [{$catalog.qnt}]</small>
                </td>
            </tr>
        [{/foreach}]
    </table>
    [{else}]
    [{oxmultilang ident="DOCS_NO_CATEGORY" }]
    [{/if}]
    [{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]