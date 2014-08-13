[{oxscript include="js/widgets/oxtopmenu.js" priority=10 }]
[{oxscript add="$('#navigation').oxTopMenu();"}]
[{oxstyle include="css/libs/superfish.css"}]
[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
    [{/if}]
[{assign var="oxcmp_categories" value=$oxcmp_categories }]
<ul id="navigation" class="sf-menu">
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a></li>
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents" }]">[{oxmultilang ident="DOCS_BASE"}]</a></li>
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=catalog" }]">[{oxmultilang ident="DOCS_CATALOG"}]</a></li>
</ul>
[{oxscript widget=$oView->getClassName()}]
[{oxstyle widget=$oView->getClassName()}]