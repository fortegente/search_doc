[{capture append="oxidBlock_content"}]
    [{assign var="paymentExpired" value=$oView->checkExpiredDateForPayment($oxcmp_user->oxuser__zs_pay_date->value, $oxcmp_user->oxuser__zs_pay_duration->value) }]
    <h1 class="pageHead">[{ oxmultilang ident="LINKS" }]</h1>

    <table>
        <tr>
            <th>[{oxmultilang ident="DOC_PRIMARY_NUMBER" }]</th>
            <th>[{oxmultilang ident="DOC_MARKING" }]</th>
            <th>[{oxmultilang ident="DOC_NAME" }]</th>
            [{if $oxcmp_user && !$paymentExpired}]
                <th>[{oxmultilang ident="DOC_CHANGING" }]</th>
                <th>[{oxmultilang ident="DOC_PAGES" }]</th>
            [{/if}]
            <th>[{oxmultilang ident="DOC_STATE" }]</th>
            [{if $oxcmp_user && !$paymentExpired}]
                <th>[{oxmultilang ident="DOC_CANCEL" }]</th>
                <th>[{oxmultilang ident="DOC_REPLACE" }]</th>
                <th>[{oxmultilang ident="DOC_AVAILABLE_FROM" }]</th>
                <th>[{oxmultilang ident="DOC_AVAILABLE_TO" }]</th>
                <th>[{oxmultilang ident="DOC_DECREE" }]</th>
            [{/if}]
        </tr>
        [{foreach from=$oView->getDocumentsList() item=document}]
            <tr>
                [{if $oxcmp_user && !$paymentExpired && $oxcmp_user->oxuser__oxrights->value == 'user'}]
                    <td><input type="checkbox" name="xxx"></td>
                [{/if}]
                <td>[{$document->zsdocuments__oxid->value}]</td>
                <td>[{$document->zsdocuments__marking->value}]</td>
                <td>[{$document->zsdocuments__name->value}]</td>
                [{if $oxcmp_user && !$paymentExpired}]
                    <td>[{$document->zsdocuments__changing->value}]</td>
                    <td>[{$document->zsdocuments__pages->value}]</td>
                [{/if}]
                <td>[{$document->zsdocuments__state->value}]</td>
                [{if $oxcmp_user && !$paymentExpired}]
                    <td>[{$document->zsdocuments__replace_cancel->value}]</td>
                    <td>[{$document->zsdocuments__replace_name->value}]</td>
                    <td>[{$document->zsdocuments__available_from->value}]</td>
                    <td>[{$document->zsdocuments__available_to->value}]</td>
                    <td>[{$document->zsdocuments__decree->value}]</td>
                [{/if}]
            </tr>
        [{/foreach}]
    </table>
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation()}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]