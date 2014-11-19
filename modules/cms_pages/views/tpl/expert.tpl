[{capture append="oxidBlock_content"}]
    <div id="header-info-block">
        <h2>STANDART-INFO експерт</h2>
        <span>
            На даній сторінці ви можете
        </span>
    </div>
    <div class="link-wrapper">
        <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" params='reg_type=expert'}]"><img src="[{$oViewConf->getImageUrl('registration.png')}]" /></a>
        <a href="#"><img src="[{$oViewConf->getImageUrl('description.png')}]" /></a>
        <a href="#"><img src="[{$oViewConf->getImageUrl('image.png')}]" /></a>
    </div>
    [{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]