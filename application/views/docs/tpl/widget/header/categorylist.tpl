[{oxscript include="js/widgets/oxtopmenu.js" priority=10 }]
[{oxscript add="$('#navigation').oxTopMenu();"}]
[{oxstyle include="css/libs/superfish.css"}]
[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
    [{/if}]
[{assign var="oxcmp_categories" value=$oxcmp_categories }]
<ul id="navigation" class="sf-menu">
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="DOCS_HOME"}]</a></li>
    [{oxifcontent ident="oximpressum" object="_cont"}]
        <li><a href="[{$_cont->getLink() }]">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
    [{/oxifcontent}]
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="DOCS_NEWS"}]</a></li>
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="DOCS_LINKS"}]</a></li>
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="DOCS_REGISTER"}]</a></li>
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=zsaccount_documents"}]">[{oxmultilang ident="DOCS_MY_BASE"}]</a></li>
</ul>
[{oxscript widget=$oView->getClassName()}]
[{oxstyle widget=$oView->getClassName()}]