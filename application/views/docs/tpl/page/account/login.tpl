[{assign var="template_title" value="LOGIN"|oxmultilangassign }]

[{capture append="oxidBlock_content"}]
    <div id="header-info-block">
        <h2>Сторінка входу</h2>
    </div>
    <div class="accountLoginView">
        [{include file="form/login_account.tpl"}]
    </div>
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]



