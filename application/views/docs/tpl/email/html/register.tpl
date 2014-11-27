[{ assign var="shop"     value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="user"     value=$oEmailView->getUser() }]

[{include file="email/html/header.tpl" title=$shop->oxshops__oxname->value}]

Шановний [{if !$user->oxuser__is_company->value}][{$user->oxuser__oxfname->value }] [{/if}][{$user->oxuser__oxlname->value }]!<br>

[{if $regType == 'профі'}]
    Вашу заявку зареєстровано в системі [{$shop->oxshops__oxname->value }] [{$regType}]<br>
    Термін користування обраний вами становить [{$pay_period}] місяців<br>
    На Ваш е-mail відправлено рахунок на оплату інформаційних послуг за обраний Вами період<br>
    Підчас оплати обов’язково вкажіть номер рахунку - власне номер<br>
    Після отримання коштів Ви зможете користуватись усіма перевагами нашої системи.<br>
    [{if $user->oxuser__is_company->value}]
        <br><b>В разі потреби оформлення договору та актів виконаних робіт надішліть будь ласка Вашу адресу для листування.</b><br>
    [{/if}]
    <br>
[{else}]
    Ви успішно зареєструвалися в системі [{$shop->oxshops__oxname->value }] [{$regType}]<br>
    Ви отримуете можливість безкоштовного місячного користування пошуковою системою.<br>
    Памятайте що в будь який момент Ви можете змінити свій standart-info на профі.<br><br>
[{/if}]
Дякуємо що Ви скористались нашими послугами.<br>
Бажаємо успіхів в роботі з найсучаснішою інформаціно-пошуковою<br>
системою нормативних документів в Україні!<br><br>

З повагою, команда [{$shop->oxshops__oxname->value }]

[{include file="email/html/footer.tpl"}]