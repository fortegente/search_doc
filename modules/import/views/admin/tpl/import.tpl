[{if $Errors.docimport}]
    <div class="errorbox">
        [{foreach from=$Errors.docimport item=oEr key=key }]
        <p>[{ $oEr->getOxMessage()}]</p>
        [{/foreach}]
    </div>
<br>
[{/if}]
[{if $result}]
    <div class="errorbox">
        Заимпортировано [{$result}]
    </div>
    <br>
[{/if}]
<form name="myedit" id="myedit" enctype="multipart/form-data" action="[{$oViewConf->getSelfLink()}]" method="post">
    <input type="hidden" name="cl" value="import" />
    <input type="hidden" name="fnc" value="" />
    <input type="text" value='"' name="string_delimeter" /><br/>
    <input type="text" value='#' name="field_delimeter" /><br/>
    <input type="file" value="choose file for import" name="csvfile" /><br/>
    <input type="submit" value="Save" name="run" class="edittext">
</form>