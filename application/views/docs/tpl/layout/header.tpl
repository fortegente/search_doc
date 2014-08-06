[{if $oView->showBetaNote()}]
    [{oxid_include_widget cl="oxwBetaNote" noscript=1 nocookie=1}]
[{/if}]
[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
<div id="header" class="clear">
  [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
      [{assign var="blAnon" value=0}]
      [{assign var="force_sid" value=$oView->getSidForWidget()}]
  [{else}]
      [{assign var="blAnon" value=1}]
  [{/if}]

  [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]

  [{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
  <a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img src="[{$oViewConf->getImageUrl($sLogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"></a>
    [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]

      [{if $oxcmp_basket->getProductsCount()}]
          [{assign var="blAnon" value=0}]
          [{assign var="force_sid" value=$oView->getSidForWidget()}]
      [{else}]
          [{assign var="blAnon" value=1}]
      [{/if}]
</div>
[{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
    <div class="oxSlider">
        [{include file="widget/promoslider.tpl" }]
    </div>
[{/if}]
