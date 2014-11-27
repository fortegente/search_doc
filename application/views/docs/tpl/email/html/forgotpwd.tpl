[{ assign var="shop"      value=$oEmailView->getShop() }]
[{ assign var="oViewConf" value=$oEmailView->getViewConfig() }]
[{ assign var="user"      value=$oEmailView->getUser() }]


[{include file="email/html/header.tpl" title=$shop->oxshops__oxname->value}]

    <p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">
        Для того щоб згенерувати новий пароль для [{ $shop->oxshops__oxname->value }] перейдіть по наступному посиланню:<br />
        <a href="[{$oViewConf->getBaseDir() }]index.php?cl=forgotpwd&uid=[{ $user->getUpdateId() }]&lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]">[{ $oViewConf->getBaseDir() }]index.php?cl=forgotpwd&uid=[{ $user->getUpdateId()}]&lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]</a>
        <br />
        Ви можете використати це посилання на протязі [{ $user->getUpdateLinkTerm()/3600 }] годин.<br />
        З повагою команда [{ $shop->oxshops__oxname->value }]<br />
    </p>

[{include file="email/html/footer.tpl"}]
