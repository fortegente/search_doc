[{capture append="oxidBlock_content"}]
    <div id="header-info-block">
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
    [{assign var="documentsCollection" value=$oView->getDocumentsList()}]

    [{if $oxcmp_user}]
        [{assign var="isProfi" value=$oxcmp_user->inGroup('oxuser')}]
    [{/if}]

    [{if $oView->getSaveStatus() }]
        [{assign var="_statusMessage" value="DOCS_THANKS_SAVE_MESSAGE"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{/if}]
    [{include file="message/errors.tpl"}]

    [{if $documentsCollection}]
        [{assign var="paymentExpired" value=$oView->checkExpiredDateForPayment($oxcmp_user->oxuser__zs_pay_date->value, $oxcmp_user->oxuser__zs_pay_duration->value, $isProfi) }]
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
        [{else}]
             [{if $isAfterSearching}]
                <a class="back_button" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
             [{else}]
                <a class="back_button" href="javascript:history.back()">[{oxmultilang ident="BACK_TO_GROUP" }]</a>
             [{/if}]
        [{/if}]
        <form action="[{$oViewConf->getSelfActionLink() }]" method="post">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="fnc" value="addFavouriteDocuments"/>
            <input type="hidden" name="cl" value="documents"/>
            [{if $oxcmp_user && !$paymentExpired && $isProfi}]
                <input class="add_documents top" type="submit" value="[{oxmultilang ident="DOC_ADD_TO_ACCOUNT" }]">
            [{/if}]
            [{if $searchparam}]
                <a class="back_button" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
            [{/if}]
            <table id="documents_table">
                <tr>
                    [{if $oxcmp_user && !$paymentExpired && $isProfi}]
                        <th><input type="checkbox" class="check_all"></th>
                    [{/if}]
                    <th [{if !$oxcmp_user || $paymentExpired}] style="width: 13%"; [{/if}]>[{oxmultilang ident="DOC_PRIMARY_NUMBER" }]</th>
                    <th  [{if !$oxcmp_user || $paymentExpired}] style="width: 19%"; [{else}] style="width: 8%;" [{/if}]>[{oxmultilang ident="DOC_MARKING" }]</th>
                    <th [{if !$oxcmp_user || $paymentExpired}] style="width: 60%"; [{else}] style="width: 30%;" [{/if}]>[{oxmultilang ident="DOC_NAME" }]</th>
                    [{if $oxcmp_user && !$paymentExpired}]
                        <th style="width: 8%;">[{oxmultilang ident="DOC_CHANGING" }]</th>
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
                [{foreach from=$documentsCollection item=document}]
                    <tr>
                        [{if $oxcmp_user && !$paymentExpired && $isProfi}]
                            <td><input type="checkbox" name="favourite_docs[]" value="[{$document->zsdocuments__oxid->value}]"></td>
                        [{/if}]
                        [{assign var=itemsCollection value=";"|explode:$document->zsdocuments__marking->value}]
                        <td>
                            [{foreach from=$itemsCollection item=part}]
                                [{$part}]<br>
                            [{/foreach}]
                        </td>
                        <td>[{$document->zsdocuments__oxid->value}]</td>
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
            [{if $filter}]
                [{if $isAfterSearching}]
                    <a class="back_button last" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
                [{else}]
                    <a class="back_button last" href="javascript:history.back()">[{oxmultilang ident="BACK_TO_GROUP" }]</a>
                [{/if}]
            [{/if}]
            [{if $oxcmp_user && !$paymentExpired && $isProfi}]
                <input class="add_documents" type="submit" value="[{oxmultilang ident="DOC_ADD_TO_ACCOUNT" }]">
            [{/if}]
            [{if $searchparam}]
                <a class="back_button last" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
            [{/if}]
        </form>
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation()}]
    [{else}]
        [{assign var="customMessage" value="DOCS_SEARCH_EMPTY"|oxmultilangassign}]
        [{include file="message/errors.tpl" customMessage=$customMessage}]
        <a class="back_button last" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
<script>
    jQuery('#search-form input[type="submit"]').click(function() {
        var inputEl = jQuery('[name="searchparam"]');
        if (!inputEl.val()) {
            inputEl.css({"border-color": "red",
                         "border-width":"2px",
                         "border-style":"solid"
                         });

            return false;
        }
    });

    jQuery('.check_all').click(function() {
        if (jQuery(this).is(":checked")) {
            jQuery('[name^="favourite_docs"]').each(function(i, el) {
                jQuery(el).attr("checked",true);
            })
        } else {
            jQuery('[name^="favourite_docs"]').each(function(i, el) {
                jQuery(el).attr("checked", false);
            })
        }

    });

    jQuery('input[type="checkbox"]').click(function() {
        if (jQuery(this).is(":checked")) {
            jQuery('.add_documents').show();
        } else {
            jQuery('.add_documents').hide();
        }
    });
</script>
