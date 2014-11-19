[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="BILLING_SHIPPING_SETTINGS"|oxmultilangassign }]
    <div id="header-info-block">
        <h2>Персональні дані</h2>
    </div>
[{block name="account_user_form"}]
    [{include file="form/user.tpl"}]
[{/block}]
[{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
	[{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]