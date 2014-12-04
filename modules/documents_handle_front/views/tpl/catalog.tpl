[{capture append="oxidBlock_content"}]
    [{assign var=pgrp value=''}]
    [{assign var=backTitle value=$oView->getBackTitle()}]
    [{assign var=lstdssu value=''}]
    [{assign var=catalogList value=$oView->getCatalogList()}]
    <div id="header-info-block">
        <h2>Опис</h2>
        <span>
            Розроблений нами пошук по класам та групам Українського класифікатора нормативних документів (УКНД) призначено для швидкого пошуку стандартів які
            відносяться до певного класу чи групи. Скориставшись пошуком Ви одразу бачите всі стандарти які класифікуються за об'єктом стандартизації.<br><br>
            Нормативні документи розміщуються в УКНД за трирівневою, ієрархічною класифікацією.
            В загальному випадку код позиції класифікатора має таку структуру:<br>
            <b>ХХ.ХХХ.ХХ</b>
            <div class="emphasise">
                де <b>ХХ</b> - клас (від 01 до 99)<br>
                <b>ХХ.ХХХ</b> - група,<br>
                <b>ХХ.ХХХ.ХХ</b> - підгрупа.
            </div>
            Клас кодують двозначним цифровим кодом. Всі класи зазначені на стартовій сторінці <b>УКНД 004:2008</b><br><br>
            Код групи складається з коду класу та тризначного цифрової групи, відокремлених крапкою.
            Код підгрупи складається з коду групи та двозначного цифрового коду, відокремлених крапкою.<br><br>
            <i>Приклад</i><br><br>
            Ми розшукуємо нормативні документи які стосуються виробництва молока<br>
            &nbsp;&nbsp;&nbsp;&nbsp;1. Обираємо клас № 67 <i class="underline_text">технологія виробництва харчових продуктів</i>  - відкриваємо його.<br>
            &nbsp;&nbsp;&nbsp;&nbsp;2.Ми переходимо на сторінку на якій розміщуються всі 17 груп  класу <i class="underline_text">технологія виробництва харчових продуктів</i>. Обираємо групу №67.100 молоко та молочні продукти  - відкриваємо її.<br>
            &nbsp;&nbsp;&nbsp;&nbsp;3. Переходимо на сторінку на якій зазначено 6 підгруп які класифікуються по назвам підгруп. Обравши пігрупу <i class="underline_text">молоко та продукти з переробленого молока</i> побачимо всі документи цієї підгрупи.<br>
        </span>
    </div>
    [{if $catalogList|@count}]
        [{if $oView->isCatalogAfterSearchAction()}]
            <a class="back_button" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
        [{elseif $backTitle}]
            <a class="back_button" href="javascript:history.back()">[{$backTitle}]</a>
        [{/if}]
        <table id="documents_table" class="catalogs_collection_table">
            <tr>
                <th>номер класу</th>
                <th>назва класу та його кількісний зміст</th>
            </tr>
            [{foreach from=$catalogList item=catalog}]
                [{assign var=catalogInfo value="."|explode:$catalog.id}]
                [{if $catalogInfo|@count == 2}]
                    [{assign var=pgrp value="&pgrp=$catalogInfo[1]"}]
                [{/if}]
                [{if $catalogInfo|@count == 3}]
                    [{assign var=pgrp value="&pgrp=$catalogInfo[1]"}]
                    [{assign var=lstdssu value="&lstdssu=$catalogInfo[2]"}]
                [{/if}]
                <tr>
                    <td>
                        [{if $catalog.qnt > 0}]
                            [{if $lstdssu || $catalog.runToDocuments}]
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents&nd="}][{$catalog.id}]">
                            [{else}]
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=catalog&grp="}][{$catalogInfo[0]}][{$pgrp}][{$lstdssu}]">
                            [{/if}]
                        [{/if}]
                        [{$catalog.id}]
                        [{if $catalog.qnt > 0}]
                            </a>
                        [{/if}]
                    </td>
                    <td>
                        [{if $catalog.qnt > 0}]
                        [{if $lstdssu || $catalog.runToDocuments}]
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents&nd="}][{$catalog.id}]">
                        [{else}]
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=catalog&grp="}][{$catalogInfo[0]}][{$pgrp}][{$lstdssu}]">
                                [{/if}]
                                [{/if}]
                                [{$catalog.title}]
                                [{if $catalog.qnt > 0}]
                            </a>
                        [{/if}]
                        </br><small>[{$catalog.text}] [{$catalog.qnt}]</small>
                    </td>
                </tr>
            [{/foreach}]
        </table>
        [{if $oView->isCatalogAfterSearchAction()}]
            <a class="back_button last" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
        [{elseif $backTitle}]
            <a class="back_button last" href="javascript:history.back()">[{$backTitle}]</a>
        [{/if}]
    [{else}]
        [{assign var="customMessage" value="DOCS_NO_CATEGORY"|oxmultilangassign}]
        [{include file="message/errors.tpl" customMessage=$customMessage}]
        <a class="back_button last" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=documents"}]">[{oxmultilang ident="BACK_TO_DOC" }]</a>
    [{/if}]
    [{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]