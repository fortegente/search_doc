<?php
class catalog extends oxUBase
{
    protected $_sThisTemplate = 'catalog.tpl';

    protected $_oCatalogList = null;

    public function getCatalogList()
    {
        if ( $this->_oCatalogList === null ) {
            $oDocumentsList = oxNew("zsCataloglist");
            $oDocumentsList->init("zsCatalog");

           // if ($iCnt = $oDocumentsList->getCount()) {
            //    $this->_iCntPages = ceil($iCnt / $this->_oCatalogList);

                $oDocumentsList->getCatalogList();
                $this->_oDocumentsList = $oDocumentsList->_aArray;
           // }
        }

        return $this->_oCatalogList;
    }
}