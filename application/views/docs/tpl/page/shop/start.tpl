[{oxscript include="js/widgets/oxcenterelementonhover.js" priority=10 }]
[{oxscript add="$( '#specCatBox' ).oxCenterElementOnHover();" }]
[{capture append="oxidBlock_content"}]
    <div class="homecontainer">
        <p>Мы працюємо - ви користуєтесь.</p>
        <p>"СТАНДАРТ-ІНФО" лідер на ринку послуг інформаційного забезпечення в сфері стандартизації.</p>
        <h1>Інформаційно-пошукова система онлайн</h1>
        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">Вхід</a>
    </div>
    <div class="homebox">
        <h2><b>STANDART-INFO</b></h2>
        <h3><b>Партнер</b></h3>
        <hr class="short-line">
        <hr>
        <div class="homebox-content">
            Простий та зручний пошук.</br>
            Загальний доступ
        </div>
        <div class="overlay">
            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">Переглянути</a>
        </div>
    </div>
    <div class="homebox">
        <h2><b>STANDART-INFO</b></h2>
        <h3><b>Експерт</b></h3>
        <hr class="short-line">
        <hr>
        <div class="homebox-content">
            Вичерпна інформація про стан нормативних документів.</br>
            Постійне оновлення.</br>
            Для зареєстрованих користувачів.
        </div>
        <div class="overlay">
            <a href="#">Переглянути</a>
        </div>
    </div>
    <div class="homebox last">
        <h2><b>STANDART-INFO</b></h2>
        <h3><b>Профі</b></h3>
        <hr class="short-line">
        <hr>
        <div class="homebox-content">
            <b>УВАГА!</b></br>
            Унікальна пропозиція.</br>
            Можливість легко створювати</br>
            власну базу нормативних</br>
            документів та отримувати оперативну</br>
            інформацію про будь-які зміни</br>
            зручним способом.</br>
            Для зареєстрованих користувачів</br>
            з проплаченим доступом.
        </div>
        <div class="overlay">
            <a href="#">Переглянути</a>
        </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Right"}]
<script>
    jQuery('.homebox').mouseenter(function() {
        jQuery(this).find('.overlay').slideDown(200);
    })
    jQuery('.homebox').mouseleave(function() {
        jQuery(this).find('.overlay').slideUp(200);
    })
</script>