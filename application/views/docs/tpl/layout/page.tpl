[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{ include file="rdfa/rdfa.tpl" }]
    [{/if}]
    <div id="page" class="[{if $sidebar}] sidebar[{$sidebar}][{/if}]">
        <div id="wrapper">
            [{include file="layout/header.tpl"}]
            [{if $oView->getClassName() ne "start" && !$blHideBreadcrumb}]
               [{ include file="widget/breadcrumb.tpl"}]
            [{/if}]
            <div id="content">
                [{include file="message/errors.tpl"}]
                [{foreach from=$oxidBlock_content item="_block"}]
                    [{$_block}]
                [{/foreach}]
            </div>
        </div>
        [{include file="layout/footer.tpl"}]
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]