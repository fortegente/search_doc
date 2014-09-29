[{capture append="oxidBlock_content"}]
    <div id="partner-info-block">
        <h2>STANDART-INFO ПАРТНЕР</h2>
        <span>
            Гостьовий доступ
            Standart-info партнер не потребує реєстрації та передплати!
            Ви користуєтесь програмою пошуку інформації про нормативні документи та отримуєте інформацію про:</br>
            <span>
                - позначення нормативного документа;</br>
                - назву;</br>
                - стан (діє, не діє), а також користуватись іншою інформацією розміщеною на сайті.</br>
            </span>
        </span>
    </div>
    [{if $oView->getSaveStatus() }]
        [{assign var="_statusMessage" value="DOCS_THANKS_SAVE_MESSAGE"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{/if}]
    [{assign var="paymentExpired" value=$oView->checkExpiredDateForPayment($oxcmp_user->oxuser__zs_pay_date->value, $oxcmp_user->oxuser__zs_pay_duration->value) }]
    [{if !$filter}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="search-form">
            <input type="hidden" name="cl" value="documents"/>
            <input type="text" name="searchparam" value="[{$searchparam}]"/>
            <select name="search_category">
                <option value="0" [{if $search_category == 0}]selected[{/if}]>[{oxmultilang ident="DOC_SEARCH_SIGN_AND_NAME" }]</option>
                <option value="1" [{if $search_category == 1}]selected[{/if}]>[{oxmultilang ident="DOC_SEARCH_SIGN" }]</option>
                <option value="2" [{if $search_category == 2}]selected[{/if}]>[{oxmultilang ident="DOC_SEARCH_NAME" }]</option>
                <option value="3" [{if $search_category == 3}]selected[{/if}]>[{oxmultilang ident="DOC_SEARCH_TITLE_DOC" }]</option>
            </select>
            <input type="submit" value="[{oxmultilang ident="DOC_SEARCH"}]">
        </form>
    [{/if}]
    <form action="[{$oViewConf->getSelfActionLink() }]" method="post">
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="fnc" value="addFavouriteDocuments"/>
        <input type="hidden" name="cl" value="documents"/>
        <table id="documents_table">
            <tr>
                [{if $oxcmp_user && !$paymentExpired}]
                    <th></th>
                [{/if}]
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
                        <td><input type="checkbox" name="favourite_docs[]" value="[{$document->zsdocuments__oxid->value}]"></td>
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
        [{if $oxcmp_user && !$paymentExpired}]
            <input type="submit" value="[{oxmultilang ident="DOC_ADD_TO_ACCOUNT" }]">
        [{/if}]
    </form>
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation()}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]