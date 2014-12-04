[{assign var="template_title" value="LOGIN"|oxmultilangassign }]

[{capture append="oxidBlock_content"}]
    <div id="header-info-block">
        <h2 style="font-size: 20px">«Мій стандарт-інфо» - це абсолютна впевненість в тому, що Ви користується
            актуальними нормативними документами.</h2>
        <span>
            Все дуже просто:<br>
            &nbsp;&nbsp;&nbsp;&nbsp;- ви постійно користуєтесь актуальною інформацією;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;- обираєте необхідні Вам документи та створюєте власну базу стандартів;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;- на власну електронну пошту отримуйте повідомлення в разі наявності змін до будь-якого документу обраного Вами;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;- на Вашій власній сторінці документи в яких є зміни будуть виділені окремо – впродовж
            місяця з моменту внесення змін;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;- ви зможете переглядати всі зміни які внесені до бази за обраний вами період;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;- швидко та зручно знаходити стандарти за груповою ознакою за допомогою пошуку по
УКНД 004:2008.<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;Досі не маєте власного акаунту? Ознайомитись з видами реєстрації
            та перевагами які вони надають Ви можете <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=registerinfo"}]">тут</a>
        </span>
    </div>
    <div class="accountLoginView">
        [{include file="form/login_account.tpl"}]
    </div>

    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl"}]



