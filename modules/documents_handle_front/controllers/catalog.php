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

           // if ($iCnt = $oDocumentsList->getCount()) {
            //    $this->_iCntPages = ceil($iCnt / $this->_oCatalogList);
            $group = oxConfig::getParameter('grp');
            $subgroup = oxConfig::getParameter('pgrp');
            $documents = oxConfig::getParameter('lstdssu');

            $this->_aCatalogList = $oCatalogList->getCatalogList($group, $subgroup, $documents);
           // }
        }

        return $this->_aCatalogList;
    }
}