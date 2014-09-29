[{if $oView->showBetaNote()}]
    [{oxid_include_widget cl="oxwBetaNote" noscript=1 nocookie=1}]
[{/if}]
[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
<div id="header" class="clear">
    <a id="logo" href="[{$oViewConf->getHomeLink()}]"><img src="[{$oViewConf->getImageUrl('logo-icon.png')}]""></a>
  [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
      [{assign var="blAnon" value=0}]
      [{assign var="force_sid" value=$oView->getSidForWidget()}]
  [{else}]
      [{assign var="blAnon" value=1}]
  [{/if}]


    [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]

      [{if $oxcmp_basket->getProductsCount()}]
          [{assign var="blAnon" value=0}]
          [{assign var="force_sid" value=$oView->getSidForWidget()}]
      [{else}]
          [{assign var="blAnon" value=1}]
      [{/if}]
</div>
