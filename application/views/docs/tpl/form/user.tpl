[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
<form class="js-oxValidate" action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
<div class="addressCollumns clear">
    <div>
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="changeuser_testvalues">
        <input type="hidden" name="cl" value="account_user">
        <input type="hidden" name="CustomError" value='user'>
        <input type="hidden" name="blshowshipaddress" value="1">
    </div>
    [{ include file="form/fieldset/user_billing.tpl" noFormSubmit=true }]
</div>
</form>

