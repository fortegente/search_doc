[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MESSAGE_WELCOME_REGISTERED_USER"|oxmultilangassign }]
    <div id="header-info-block">
        <h2>Реєстрація пройшла успішно</h2>
        <span>
            Дякуємо за реєстрацію на нашому сайті.
        </span>
    </div>
    [{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]