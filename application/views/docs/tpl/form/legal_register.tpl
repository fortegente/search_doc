<form class="js-oxValidate" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="registeruser">
    <input type="hidden" name="cl" value="register">
    <input type="hidden" name="lgn_cook" value="0">
    <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
    <input type="hidden" name="option" value="3">
    <input type="hidden" name="reg_type" value="[{$reg_type}]">
    <input type="hidden" name="is_company" value="0">
    <table class="form refister_block legal" style="display: none">
        <tbody>
            <tr>
                <td>
                    <label [{if $oView->isFieldRequired(oxuser__oxfname) }]class="req"[{/if}]>[{ oxmultilang ident="ORGANIZATION_NAME"}]*</label>
                </td>
                <td>
                    <input [{if $oView->isFieldRequired(oxuser__oxfname) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]type="text" size="37" maxlength="255" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{ $invadr.oxuser__oxfname }][{else }][{ $oxcmp_user->oxuser__oxfname->value }][{/if}]">
                    [{if $oView->isFieldRequired(oxuser__oxfname) }]
                        <p class="oxValidateError">
                                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
                        </p>
                    [{/if}]
                </td>
                <td>
                    Повна назва необхідна для формування рахунку.
                </td>
            </tr>
            <tr>
                <td>
                    <label class="req">[{ oxmultilang ident="EMAIL_ADDRESS"}]*</label>
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
                    <label [{if $oView->isFieldRequired(oxuser__oxlname) }]class="req"[{/if}]>[{ oxmultilang ident="CONTACT_NAME"}]*</label>
                </td>
                <td>
                    <input [{if $oView->isFieldRequired(oxuser__oxlname) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]type="text" size="37" maxlength="255" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{ $invadr.oxuser__oxlname }][{else }][{ $oxcmp_user->oxuser__oxlname->value }][{/if}]">
                    [{if $oView->isFieldRequired(oxuser__oxlname) }]
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxlname}]
                    </p>
                    [{/if}]
                </td>
                <td>
                    Стане в нагоді для оперативного зв'язку з користувачем, якщо в оформленні
                    документів виникнуть питання.
                </td>
            </tr>
            <tr>
                <td>
                    <label [{if $oView->isFieldRequired(oxuser__oxprivfon) }]class="req"[{/if}]>[{ oxmultilang ident="CONTACT_PHONE"}]</label>
                </td>
                <td>
                    <input [{if $oView->isFieldRequired(oxuser__oxfon) }]class="js-oxValidate js-oxValidate_notEmpty" [{/if}]type="text" size="37" maxlength="128" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon ) }][{ $invadr.oxuser__oxfon }][{else }][{ $oxcmp_user->oxuser__oxfon->value }][{/if}]">
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
                    <label class="req">[{ oxmultilang ident="PASSWORD"}]*</label>
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
                    <label class="req">[{ oxmultilang ident="CONFIRM_PASSWORD"}]*</label>
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
            [{if $reg_type == 'profi' }]
                <tr>
                    <td>
                        <label class="req">[{ oxmultilang ident="PAY_PERIOD"}]</label>
                    </td>
                    <td colspan="2">
                        <label class="pay_checkbox"><div><input checked type="radio" name="pay_period[]" value="3" /></div> 3 міс</label>
                        <label class="pay_checkbox"><div><input type="radio" name="pay_period[]" value="6" /></div> 6 міс</label>
                        <label class="pay_checkbox"><div><input type="radio" name="pay_period[]" value="12" /></div> 12 міс</label>
                    </td>
                </tr>
            [{/if}]
            <tr>
                <td colspan="3"><button id="accUserSaveTop" type="submit" name="save" class="register">[{ oxmultilang ident="REGISTER" }]</button></td>
            </tr>
        </tbody>
    </table>
</form>