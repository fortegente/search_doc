[{capture append="oxidBlock_content"}]
    <div id="header-info-block">
        <h2>Реєстрація</h2>
        <span>
            Зареєструвавшись на standart-info Ви отримуєте унікальну можливість користуватись базою нормативних
документів України (ДСТУ, ГОСТ, РСТ).
Інтелектуальний інтерфейс дозволить Вам надзвичайно просто шукати інформацію про нормативні
документи, а унікальна можливість створити власну базу НД (обрати у власному кабінеті документи
якими ви часто користуєтесь та про які повинні мати оперативну та вичерпну інформацію), дозволить
завжди користуватись актуалізованими документами.
        </span>
    </div>
    <div class="register_block">
        <div class="left_block">
            <div class="account-type"><span>Standart-info</span> профі</div>
            <div class="pay-type"><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=zsprofessional"}]">Передплачений доступ</a></div>
            <a class="register_button" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" params='reg_type=profi' }]">зареєструватись</a>
        </div>
        <div class="right_block">
            <div class="account-type"><span>Standart-info</span> експерт</div>
            <div class="pay-type">Безоплатний доступ</div>
            <a class="register_button" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" params='reg_type=expert' }]">зареєструватись</a>
        </div>
    </div>
    [{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]