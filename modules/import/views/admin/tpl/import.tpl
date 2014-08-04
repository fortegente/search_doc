<form name="myedit" id="myedit" enctype="multipart/form-data" action="[{$oViewConf->getSelfLink()}]" method="post">
    <input type="hidden" name="cl" value="import">
    <input type="file" value="choose file for import">
    <input type="submit" onclick="Javascript:document.myedit.fnc.value='save'" value="Save" name="save" class="edittext">
</form>