[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
<form class="js-oxValidate" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="registeruser">
    <input type="hidden" name="cl" value="register">
    <input type="hidden" name="lgn_cook" value="0">
    <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
    <input type="hidden" name="option" value="3">
    <table class="form">
        <tbody>
            <tr>
                <td>
                    <label [{if $oView->isFieldRequired(oxuser__oxfname) }]class="req"[{/if}]>[{ oxmultilang ident="FIRST_NAME"}]</label>
                </td>
                <td>
                    <input [{if $oView->isFieldRequired(oxuser__oxfname) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]type="text" size="37" maxlength="255" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{ $invadr.oxuser__oxfname }][{else }][{ $oxcmp_user->oxuser__oxfname->value }][{/if}]">
                    [{if $oView->isFieldRequired(oxuser__oxfname)}]
                        <p class="oxValidateError">
                            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
                        </p>
                    [{/if}]
                </td>
                <td>
                    Можна вказати довільні дані. Мы будемо спілкуватися з Вами за вказаним ім'ям.
                </td>
            </tr>
            <tr>
                <td>
                    <label [{if $oView->isFieldRequired(oxuser__oxlname) }]class="req"[{/if}]>[{ oxmultilang ident="LAST_NAME"}]</label>
                </td>
                <td>
                    <input [{if $oView->isFieldRequired(oxuser__oxlname) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]type="text" size="37" maxlength="255" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{ $invadr.oxuser__oxlname }][{else }][{ $oxcmp_user->oxuser__oxlname->value }][{/if}]">
                    [{if $oView->isFieldRequired(oxuser__oxlname)}]
                        <p class="oxValidateError">
                            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxlname}]
                        </p>
                    [{/if}]
                </td>
                <td>
                    Можна вказати довільні дані. Мы будемо спілкуватися з Вами за вказаним ім'ям.
                </td>
            </tr>
            <tr>
                <td>
                    <label class="req">[{ oxmultilang ident="EMAIL_ADDRESS"}]</label>
                </td>
                <td>
                    <input id="userLoginName" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" type="text" name="lgn_usr" value="[{ $oView->getActiveUsername()}]" size="37" >
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        <span class="js-oxError_email">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL" }]</span>
                        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
                    </p>
                </td>
                <td>
                    На E-mail передаються конфіденційні дані: відомості про платежі і т.ін.
                </td>
            </tr>
            <tr>
                <td>
                    <label [{if $oView->isFieldRequired(oxuser__oxprivfon) }]class="req"[{/if}]>[{ oxmultilang ident="PERSONAL_PHONE"}]</label>
                </td>
                <td>
                    [{if $oView->isFieldRequired(oxuser__oxprivfon) }]
                        <p class="oxValidateError">
                            <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxprivfon}]
                        </p>
                    [{/if}]
                </td>
                <td>
                    Необов'язково, але може стати в нагоді для оперативного зв'язку з користувачем, якщо в його платежі є якісь незрозумілості.
                </td>
            </tr>
            <tr>
                <td>
                    <label class="req">[{ oxmultilang ident="PASSWORD"}]</label>
                </td>
                <td>
                    <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
                    <input id="userPassword" class="textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd" value="[{$lgn_pwd}]" size="37">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        <span class="js-oxError_length">[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_TOO_SHORT" }]</span>
                        <span class="js-oxError_match">[{ oxmultilang ident="ERROR_MESSAGE_USER_PWDDONTMATCH" }]</span>
                        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
                    </p>
                </td>
                <td>
                    Пароль, який Ві будете використовувати для входу в систему
                </td>
            </tr>
            <tr>
                <td>
                    <label class="req">[{ oxmultilang ident="CONFIRM_PASSWORD" suffix="COLON" }]</label>
                </td>
                <td>
                    <input id="userPasswordConfirm" class="textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" size="37">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        <span class="js-oxError_length">[{ oxmultilang ident="ERROR_MESSAGE_PASSWORD_TOO_SHORT" }]</span>
                        <span class="js-oxError_match">[{ oxmultilang ident="ERROR_MESSAGE_USER_PWDDONTMATCH" }]</span>
                        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
                    </p>
                </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>

    <ul class="form">
        [{ include file="form/fieldset/user_account.tpl" }]
        [{if $oView->isActive('PsLogin') }]
            <li>
                <label for="orderConfirmAgbBottom">[{ oxmultilang ident="TERMS_AND_CONDITIONS" }]</label>
                <input type="hidden" name="ord_agb" value="0">
                <input id="orderConfirmAgbBottom" type="checkbox" class="checkbox" name="ord_agb" value="1">
                <span class="inputNote agb">
                    [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                    [{ $oContent->oxcontents__oxcontent->value }]
                    [{/oxifcontent}]
                </span>
            </li>
        [{/if}]
    </ul>

    <ul class="form">[{ include file="form/fieldset/user_billing.tpl" }]</ul>
</form>
[{if $oView->isActive('PsLogin') }]
    <div id="popup1" class="popupBox corners FXgradGreyLight glowShadow">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxagb" object="oContent"}]
            [{ $oContent->oxcontents__oxcontent->value }]
         [{/oxifcontent}]
    </div>
    <div id="popup2" class="popupBox corners FXgradGreyLight glowShadow">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
            [{ $oContent->oxcontents__oxcontent->value }]
         [{/oxifcontent}]
    </div>
[{/if}]