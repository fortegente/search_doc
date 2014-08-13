[{capture append="oxidBlock_content"}]
    <h1 class="pageHead">[{ oxmultilang ident="LINKS" }]</h1>
        <table>
            [{foreach from=$oView->getCatalogList() item=catalog}]
                <tr>
                    <td>[{$catalog->zsdocuments__oxid->value}]</td>
                    <td>[{$catalog->zsdocuments__title->value}]</td>
                </tr>
            [{/foreach}]
        </table>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]