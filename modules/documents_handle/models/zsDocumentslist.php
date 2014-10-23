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

    public function getSearchDocumentsList($sSearchParam, $sSearchCategory, $iFrom = 0, $iLimit = 20)
    {
        if ($iLimit) {
            $this->setSqlLimit($iFrom, $iLimit);
        }

        $sQ = $this->_getSuitableSqlQuery($sSearchParam, $sSearchCategory);

        $this->selectString($sQ);

        return $this;
    }

    private function _getSuitableSqlQuery($sSearchParam, $sSearchCategory)
    {
        switch($sSearchCategory) {
            //search by sign and name
            case 0:
                return "select zsdocuments.* from zsdocuments WHERE name LIKE '%" . $sSearchParam . "%' OR marking LIKE '%" . $sSearchParam . "%'";
                break;
            //search by sign
            case 1:
                return "select zsdocuments.* from zsdocuments WHERE marking LIKE '%" . $sSearchParam . "%'";
                break;
            //search by name
            case 2:
                return "select zsdocuments.* from zsdocuments WHERE name LIKE '%" . $sSearchParam . "%'";
                break;
            //search by document category
            case 3:
//                return "select zsdocuments.* from zsdocuments LEFT JOIN zscatalog as cat ON
//                        zsdocuments.oxid = cat.oxid WHERE cat.title LIKE '%" . $sSearchParam . "%'";

                return "select zsdocuments.* from zsdocuments LEFT JOIN zscatalog as cat ON
                        zsdocuments.oxid = cat.oxid WHERE cat.title LIKE '%" . $sSearchParam . "%'";
                break;
        }
    }
}