[{capture append="oxidBlock_content"}]
    <div id="header-info-block">
        <h2>Мій STANDART-INFO</h2>
        <span>
            На даній сторінці ви можете
        </span>
    </div>
    [{if $oView->getRemoveStatus() }]
        [{assign var="_statusMessage" value="DOCS_REMOVE_MESSAGE"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{/if}]
    [{assign var=aDocuments value=$oView->getUserDocumentsList()}]
    <div class="account_info_block">
        <a class="back_button account-back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_user"}]">[{oxmultilang ident="BILLING_SHIPPING_SETTINGS" }]</a>
    </div>
    [{if count($aDocuments) > 0}]
         <form action="[{$oViewConf->getSelfActionLink() }]" method="post">
            [{$oViewConf->getHiddenSid() }]
            <input type="hidden" name="fnc" value="removeFromFavouriteDocuments"/>
            <input type="hidden" name="cl" value="zsaccount_documents"/>
             <a class="back_button account-back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
             <a class="back_button account-back logout" href="[{ $oViewConf->getLogoutLink() }]">[{oxmultilang ident="LOGOUT" }]</a>
            <table id="documents_table">
                <tr>
                    <th>[{oxmultilang ident="DOC_REMOVE_DOC" }]</th>
                    <th>[{oxmultilang ident="DOC_PRIMARY_NUMBER" }]</th>
                    <th style="width: 12%;">[{oxmultilang ident="DOC_MARKING" }]</th>
                    <th style="width: 30%">[{oxmultilang ident="DOC_NAME" }]</th>
                    <th style="width: 8%;">[{oxmultilang ident="DOC_CHANGING" }]</th>
                    <th>[{oxmultilang ident="DOC_PAGES" }]</th>
                    <th>[{oxmultilang ident="DOC_STATE" }]</th>
                    <th>[{oxmultilang ident="DOC_CANCEL" }]</th>
                    <th>[{oxmultilang ident="DOC_REPLACE" }]</th>
                    <th>[{oxmultilang ident="DOC_AVAILABLE_FROM" }]</th>
                    <th>[{oxmultilang ident="DOC_AVAILABLE_TO" }]</th>
                    <th>[{oxmultilang ident="DOC_DECREE" }]</th>
                </tr>
                [{foreach from=$aDocuments item=document}]
                    <tr [{if $oView->isDocumentChangeFromLastVisit($document->zsdocuments__last_seen->value, $document->zsdocuments__last_update->value)}]style="background-color:rgb(255, 132, 132)"[{/if}]>
                        <td>
                            <input class="remove_doc" type="submit" name="remove_docs[]" value="x">
                            <input type="hidden" name="document_id" value="[{$document->zsdocuments__oxid->value}]">
                        </td>
                        [{assign var=itemsCollection value=";"|explode:$document->zsdocuments__marking->value}]
                        <td>
                            [{foreach from=$itemsCollection item=part}]
                                [{$part}]<br>
                            [{/foreach}]
                        </td>
                        <td>[{$document->zsdocuments__oxid->value}]</td>
                        <td>[{$document->zsdocuments__name->value}]</td>
                        <td>[{$document->zsdocuments__changing->value}]</td>
                        <td>[{$document->zsdocuments__pages->value}]</td>
                        <td>[{$document->zsdocuments__state->value}]</td>
                        <td>[{$document->zsdocuments__replace_cancel->value}]</td>
                        <td>[{$document->zsdocuments__replace_name->value}]</td>
                        <td>[{$document->zsdocuments__available_from->value}]</td>
                        <td>[{$document->zsdocuments__available_to->value}]</td>
                        <td>[{$document->zsdocuments__decree->value}]</td>
                    </tr>
                [{/foreach}]
            </table>
             <input type="hidden" name="remove_doc" value="" />
        </form>
        <a class="back_button account-back" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation()}]
    [{/if}]
<script>
    window.onload=function() {
        $(".remove_doc").on("click", function() {
            var value = $(this).next('input').val();
            $("[name='remove_doc']").val(value);
        })
    };
</script>

    [{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]