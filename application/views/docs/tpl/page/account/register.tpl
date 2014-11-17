[{capture append="oxidBlock_pageBody"}]
    [{if $oView->isEnabledPrivateSales()}]
        [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_content"}]
    [{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
    [{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
    [{assign var="template_title" value="OPEN_ACCOUNT"|oxmultilangassign }]
    [{if $oView->isActive('PsLogin') }]
        [{include file="message/errors.tpl" }]
    [{/if}]
    <div id="header-info-block">
        <h2>Реєстрація</h2>
    </div>
    <div class="reg_switcher_block">
        <div class="reg_type_switcher"><a class="physical" href="javascript:void()">Для фізичних осіб</a></div>
        <div class="reg_type_switcher"><a class="legal" href="javascript:void()">Для юридичних осіб</a></div>
    </div>
        [{include file="form/physical_register.tpl"}]
        [{include file="form/legal_register.tpl"}]
    [{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{if $oView->isActive('PsLogin') }]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]
<script>
    jQuery('.reg_switcher_block a').click(function () {
        if (jQuery(this).attr('class') == 'physical') {
            jQuery('table.physical').show();
            jQuery('table.legal').hide();
        }else {
            jQuery('table.physical').hide();
            jQuery('table.legal').show();            }
    });
</script>