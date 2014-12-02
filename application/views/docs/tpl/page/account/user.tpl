[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="BILLING_SHIPPING_SETTINGS"|oxmultilangassign }]
    [{assign var="paymentExpired" value=$oView->checkExpiredDateForPayment($oxcmp_user->oxuser__zs_pay_date->value, $oxcmp_user->oxuser__zs_pay_duration->value, $oView->inGroup('oxuser')) }]
    <div id="header-info-block" xmlns="http://www.w3.org/1999/html">
        <h2>Персональні дані</h2>
        <span>
            [{if $oView->inGroup('oxuser')}]
                [{if !$paymentExpired}]
                    Ваш standart-info профі діє до <b>[{$oView->getPaymentExpiredDate(true)}]</b>
                [{else}]
                    Дія standart-info профі закінчилася. Ви можете в будь-який момент пролонгувати свій акаунт
                    і користуватися усіма перевагами standart-info профі.
                [{/if}]
            [{else}]
                [{if !$paymentExpired}]
                    Ваш standart-info експерт діє до <b>[{$oView->getPaymentExpiredDate(false)}]</b></br>
                    Памятайте що в будь який момент Ви моежете змінити свій standart-info акаунт на профі!
                [{else}]
                    Дія standart-info експерт закінчилася. Ви можете в будь-який момент перейти на standart-info профі.
                [{/if}]
            [{/if}]
        </span>
    </div>
    [{if $isUpdated }]
        [{assign var="_statusMessage" value="UPDATE_ACCOUNT_MESSAGE"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{/if}]
[{block name="account_user_form"}]
    [{include file="form/user.tpl"}]
[{/block}]
[{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
	[{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]