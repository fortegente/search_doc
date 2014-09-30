[{capture append="oxidBlock_pageBody"}]
    <div id="page" class="[{if $sidebar}] sidebar[{$sidebar}][{/if}]">
        <div id="wrapper">
            [{include file="layout/header.tpl"}]
            <div id="content">
                [{foreach from=$oxidBlock_content item="_block"}]
                    [{$_block}]
                [{/foreach}]
            </div>
        </div>
        [{include file="layout/footer.tpl"}]
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]