[{block name="footer_main"}]
    <div id="footer">
        <div id="panel">

            [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1}]

            [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1}]

            [{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1}]

            [{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]

        </div>
    </div>
[{/block}]