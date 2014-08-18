<form name="myedit" id="myedit" enctype="multipart/form-data" action="[{$oViewConf->getSelfLink()}]" method="post">
    <input type="hidden" name="cl" value="import" />
    <input type="hidden" name="fnc" value="run" />
    <input type="text" value=";" name="string_delimeter" /><br/>
    <input type="text" value='"' name="field_delimeter" /><br/>
    <input type="file" value="choose file for import" name="csvfile" /><br/>
    <input type="submit" value="Save" name="save" class="edittext">
</form>