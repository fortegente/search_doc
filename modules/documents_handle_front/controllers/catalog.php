<?php
class catalog extends oxUBase
{
    protected $_sThisTemplate = 'catalog.tpl';

    protected $_aCatalogList = null;

    public function getCatalogList()
    {
        if ( $this->_oCatalogList === null ) {
            $oCatalogList = oxNew("zsCataloglist");
            $oCatalogList->init("zsCatalog");
            $group = oxConfig::getParameter('grp');
            $subgroup = oxConfig::getParameter('pgrp');
            $documents = oxConfig::getParameter('lstdssu');
            $this->_aCatalogList = $oCatalogList->getCatalogList($group, $subgroup, $documents);
        }

        return $this->_aCatalogList;
    }

    public function getBackTitle()
    {
        $group = oxConfig::getParameter('grp');
        $subgroup = oxConfig::getParameter('pgrp');
        $documents = oxConfig::getParameter('lstdssu');

        if ($group && !$subgroup && !$documents) {
            return oxRegistry::getLang()->translateString('BACK_TO_CATALOG', oxRegistry::getLang()->getBaseLanguage(), false );
        } else if ($group && $subgroup) {
            return oxRegistry::getLang()->translateString('BACK_TO_GROUP', oxRegistry::getLang()->getBaseLanguage(), false );
        }
    }

    public function isCatalogAfterSearchAction()
    {
        return (oxConfig::getParameter('redirected')) ? true : false;
    }
}