[{assign var="template_title" value="LOGIN"|oxmultilangassign }]

[{capture append="oxidBlock_content"}]
    <div id="header-info-block">
        <h2>Вхід</h2>
        <span>
            Досі не маєте власного акаунту? ознайомитись з видами реєстрації
            та перевагами які вони надають Ви можете <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=registerinfo"}]">тут</a>
        </span>
    </div>
    <div class="accountLoginView">
        [{include file="form/login_account.tpl"}]
    </div>

    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]



