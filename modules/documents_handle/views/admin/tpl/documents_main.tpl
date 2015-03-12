[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

<script type="text/javascript">
    <!--
//    function chkInsert()
//    {
//        if( document.myedit.elements["editval[zsdocuments__oxid]"].value == "")
//        {
//            alert("Bitte eMail Adresse eingeben!");
//            document.myedit.elements["editval[zsdocuments__oxid]"].focus();
//            return false;
//        }
//        return true;
//    }

    //-->
</script>

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<form name="transfer" id="transfer" action="[{$oViewConf->getSelfLink() }]" method="post">
    [{$oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="documents_main">
</form>

<form name="myedit" id="myedit" action="[{$oViewConf->getSelfLink() }]" method="post" onSubmit="return chkInsert()">
    [{$oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="documents_main">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="oxid" value="[{ $oxid }]">

    <table cellspacing="0" cellpadding="0" border="0" width="98%">
        [{if $sSaveError}]
            <tr>
                <td style="padding: 15px" class="errorbox">[{oxmultilang ident=$sSaveError}]</td>
            </tr>
        [{/if}]
        <tr>
            <td valign="top" class="edittext">
                <table cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_PRIMARY_NUMBER" }]
                        </td>
                        <td class="edittext" id="primary_key">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__marking]" value='[{$edit->zsdocuments__marking->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_MARKING" }]
                        </td>
                        <td class="edittext">
                           <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__oxid]" value='[{$edit->zsdocuments__oxid->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_NAME" }]
                        </td>
                        <td class="edittext">
                            <textarea style="width: 300px; height: 60px; font-size: 15px; margin-bottom: 7px" class="editinput" name="editval[zsdocuments__name]" [{$readonly}]>[{$edit->zsdocuments__name->value}]</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_CHANGING" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__changing]" value='[{$edit->zsdocuments__changing->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_PAGES" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__pages]" value='[{$edit->zsdocuments__pages->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_STATE" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__state]" value='[{$edit->zsdocuments__state->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_CANCEL" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__replace_cancel]" value='[{$edit->zsdocuments__replace_cancel->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_REPLACE" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__replace_name]" value='[{$edit->zsdocuments__replace_name->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_AVAILABLE_FROM" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__available_from]" value='[{$edit->zsdocuments__available_from->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_AVAILABLE_TO" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__available_to]" value='[{$edit->zsdocuments__available_to->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext" width="90">
                            [{oxmultilang ident="DOC_DECREE" }]
                        </td>
                        <td class="edittext">
                            <input style="width: 300px; height: 22px; font-size: 15px; margin-bottom: 7px" class="editinput" type="text" name="editval[zsdocuments__decree]" value='[{$edit->zsdocuments__decree->value}]' [{$readonly }]>
                        </td>
                    </tr>
                    <tr>
                        <td class="edittext">
                        </td>
                        <td class="edittext"><br>
                            <input type="submit" class="editinput" name="save" value="[{ oxmultilang ident="DOC_SAVE" }]" onClick="Javascript:document.myedit.fnc.value='save'"" [{ $readonly }]>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
[{include file="bottomnaviitem.tpl"}]
[{include file="bottomitem.tpl"}]
<script>
    console.log(jQuery('.editinput').size())
</script>
