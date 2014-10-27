<?php
class zsDocumentslist extends oxList
{
    public function __construct( $sObjectsInListName = 'zsdocuments')
    {
        parent::__construct( 'zsdocuments');
    }

    public function getDocumentsList($iFrom = 0, $iLimit = 20, $filter = null)
    {
        if ($iLimit) {
            $this->setSqlLimit($iFrom, $iLimit);
        }

        $oListObject =$this->getBaseObject();
        $sFieldList = $oListObject->getSelectFields();
        $sQ = "select $sFieldList from " . $oListObject->getViewName();
        if ($filter) {
            $sQ .= ' where marking = "' . $filter .
            '" OR REPLACE(marking, " ", "") LIKE "' . $filter . ';%"
              OR REPLACE(marking, " ", "") LIKE "%;' . $filter . ';%"
              OR REPLACE(marking, " ", "") LIKE "%;' . $filter . '%"';
        }

        $sQ .= " ORDER BY marking";

        $this->selectString($sQ);

        return $this;
    }

    public function getCount($sFilterParam = null)
    {
        $oDb = oxDb::getDb();
        $sQ = "select COUNT(*) from zsdocuments";

        if ($sFilterParam) {
            $sQ .= ' where marking = "' . $sFilterParam .
                '" OR REPLACE(marking, " ", "") LIKE "' . $sFilterParam . ';%"
              OR REPLACE(marking, " ", "") LIKE "%;' . $sFilterParam . ';%"
              OR REPLACE(marking, " ", "") LIKE "%;' . $sFilterParam . '%"';
        }

        return $oDb->getOne($sQ);
    }

    public function getSearchCount($sSearchParam, $sSearchCategory)
    {
        $sQ = $this->_getSuitableSqlQuery($sSearchParam, $sSearchCategory);
        $oDb = oxDb::getDb( oxDb::FETCH_MODE_ASSOC );
        $rs = $oDb->select($sQ);

        return $rs->recordCount();
    }

    public function getSearchDocumentsList($sSearchParam, $sSearchCategory, $iFrom = 0, $iLimit = 20)
    {
        //if search by category
        if ($sSearchCategory == 3) {
            $this->_redirectToSuitableCategoryList($sSearchParam);
        }

        if ($iLimit) {
            $this->setSqlLimit($iFrom, $iLimit);
        }

        $sQ = $this->_getSuitableSqlQuery($sSearchParam, $sSearchCategory);

        $this->selectString($sQ);

        return $this;
    }

    private function _redirectToSuitableCategoryList($sSearchParam)
    {
        $categoryNumbers = explode('.', $sSearchParam);

        switch(count($categoryNumbers)) {
            case 1:
                oxRegistry::getUtils()->redirect( oxRegistry::getConfig()->getShopUrl() . 'index.php?cl=catalog&grp=' . $categoryNumbers[0]);
            case 2:
                if ($this->_hasCategoryDocuments($sSearchParam)) {
                    oxRegistry::getUtils()->redirect( oxRegistry::getConfig()->getShopUrl() . 'index.php?cl=documents&nd=' . $sSearchParam);
                } else {
                    oxRegistry::getUtils()->redirect( oxRegistry::getConfig()->getShopUrl() . 'index.php?cl=catalog&grp=' . $categoryNumbers[0] . '&pgrp=' . $categoryNumbers[1]);
                }
            case 3:
                oxRegistry::getUtils()->redirect( oxRegistry::getConfig()->getShopUrl() . 'index.php?cl=documents&nd=' . $sSearchParam);
                return;
        }
    }

    private function _hasCategoryDocuments($categoryMark)
    {
        $oDb = oxDb::getDb();
        $sQ = "SELECT count(*) FROM zscatalog WHERE oxid LIKE '" . $categoryMark . "%'";

        if ($oDb->getOne($sQ) == 1) {
            return true;
        }
    }

    private function _getSuitableSqlQuery($sSearchParam, $sSearchCategory)
    {
        switch($sSearchCategory) {
            //search by sign and name
            case 0:
                return "select zsdocuments.* from zsdocuments WHERE name LIKE '%" . $sSearchParam . "%' OR oxid LIKE '%" . $sSearchParam . "%' ORDER BY marking";
                break;
            //search by sign
            case 1:
                return "select zsdocuments.* from zsdocuments WHERE oxid LIKE '%" . $sSearchParam . "%' ORDER BY marking";
                break;
            //search by name
            case 2:
                return "select zsdocuments.* from zsdocuments WHERE name LIKE '%" . $sSearchParam . "%' ORDER BY marking";
                break;
            //search by document category
//            case 3:
////                return "select zsdocuments.* from zsdocuments LEFT JOIN zscatalog as cat ON
////                        zsdocuments.oxid = cat.oxid WHERE cat.title LIKE '%" . $sSearchParam . "%'";
//
//                return "select zsdocuments.* from zsdocuments LEFT JOIN zscatalog as cat ON
//                        zsdocuments.oxid = cat.oxid WHERE cat.title LIKE '%" . $sSearchParam . "%' ORDER BY zsdocuments.marking";
//                break;
        }
    }
}