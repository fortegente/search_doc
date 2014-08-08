[{assign var="template_title" value="MY_ACCOUNT"|oxmultilangassign }]
[{capture append="oxidBlock_content"}]
    <div class="accountDashboardView">
        <h1 id="accountMain" class="pageHead">[{ oxmultilang ident="MY_ACCOUNT" }] - "[{ $oxcmp_user->oxuser__oxusername->value }]"</h1>
        <div class="col">
            [{block name="account_dashboard_col1"}]
                <dl>
                    <dt><a id="linkAccountBillship" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user" }]" rel="nofollow">[{ oxmultilang ident="BILLING_SHIPPING_SETTINGS" }]</a></dt>
                    <dd>[{ oxmultilang ident="UPDATE_YOUR_BILLING_SHIPPING_SETTINGS" }]</dd>
                    <dt><a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=zsaccount_documents" }]" rel="nofollow">[{oxmultilang ident="DOC_ACCOUNT_DOCUMENTS" }]</a></dt>
                    <dd>[{ oxmultilang ident="UPDATE_YOUR_BILLING_SHIPPING_SETTINGS" }]</dd>
                </dl>
            [{/block}]
        </div>
        <div class="clear"></div>
    </div>
    <a href="[{ $oViewConf->getLogoutLink() }]" class="submitButton largeButton">[{ oxmultilang ident="LOGOUT" }]</a>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]