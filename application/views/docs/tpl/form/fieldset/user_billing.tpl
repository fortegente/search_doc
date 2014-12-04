<table class="form refister_block physical">
    <tbody>
    <tr>
        <td>
            <label [{if $oView->isFieldRequired(oxuser__oxfname) }]class="req"[{/if}]>[{ oxmultilang ident="FIRST_NAME"}]*</label>
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
            <label [{if $oView->isFieldRequired(oxuser__oxlname) }]class="req"[{/if}]>[{ oxmultilang ident="LAST_NAME"}]*</label>
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
            <label [{if $oView->isFieldRequired(oxuser__oxprivfon) }]class="req"[{/if}]>[{ oxmultilang ident="PERSONAL_PHONE"}]</label>
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
        <td colspan="3"><button id="accUserSaveTop" type="submit" name="save" class="register">[{ oxmultilang ident="SAVE_ACCOUNT_INFO" }]</button></td>
    </tr>
    </tbody>
</table>

<table class="form refister_block physical">
    <tbody>
    <tr>
        [{if $oView->inGroup('oxuser')}]
            <td>
                <label class="req">[{ oxmultilang ident="PROLONG_PERIOD"}]</label>
            </td>
        [{else}]
            <td>
                <label class="req">[{ oxmultilang ident="PAY_PERIOD"}]</label>
            </td>
        [{/if}]
        <td colspan="2">
            <label class="pay_checkbox"><div><input type="radio" name="pay_period[]" value="3" /></div> 3 міс</label>
            <label class="pay_checkbox"><div><input type="radio" name="pay_period[]" value="6" /></div> 6 міс</label>
            <label class="pay_checkbox"><div><input type="radio" name="pay_period[]" value="12" /></div> 12 міс</label>
        </td>
    </tr>
    [{if $oView->inGroup('oxuser')}]
        <tr>
            <td colspan="3"><button  style="width: 190px" id="accUserSaveTop" type="submit" name="save" value="prolong" class="register">[{ oxmultilang ident="PROLONG_ACCOUNT" }]</button></td>
        </tr>
    [{else}]
        <tr>
            <td colspan="3"><button  style="width: 200px" id="accUserSaveTop" type="submit" name="save" value="create_account" class="register">[{ oxmultilang ident="WANT_TO_CREATE_ACCOUNT" }]</button></td>
        </tr>
    [{/if}]
    </tbody>
</table>

[{if !$noFormSubmit}]
    <li class="formSubmit">
        <button id="accUserSaveTop" type="submit" name="save" class="register">[{ oxmultilang ident="SAVE" }]</button>
    </li>
[{/if}]