[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
<form class="js-oxValidate" action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post">
  [{ $oViewConf->getHiddenSid() }]
  [{ $oViewConf->getNavFormParams() }]
  <input type="hidden" name="fnc" value="forgotpassword">
  <input type="hidden" name="cl" value="forgotpwd">
  <input type="hidden" name="actcontrol" value="forgotpwd">
  <ul class="form clear">
    <li>
        <label class="forgot_passw">[{ oxmultilang ident="EMAIL_ADDRESS"}]</label>
        <input id="forgotPasswordUserLoginName[{$idPrefix}]" type="text" name="lgn_usr" value="[{$oView->getActiveUsername()}]" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email">
        <p class="oxValidateError">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            <span class="js-oxError_email">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL" }]</span>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        </p>
    </li>
    <li class="formSubmit">
        <button class="forgot_pass_button" id="loginButton" type="submit">[{ oxmultilang ident="REQUEST_PASSWORD"}]</button>
    </li>
  </ul>
</form>
<div class="empty_doc_block">
    Вы отримаєте лист в якому Ви повинні перйти по ссилці для того щоб скинути старий пароль.
    Якщо Ви не отримали листа будь ласка перевірте чи Ви були зареєстровані у нас.
    Якщо Ви все ще маєте проблеми з отриманням нового паролю будь ласка напишіть нам за адресою test@test.ru
</div>
<br><br>
[{oxifcontent ident="oxforgotpwd" object="oCont"}]
    [{ $oCont->oxcontents__oxcontent->value }]
[{/oxifcontent}]