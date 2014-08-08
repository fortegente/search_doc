<?php
class zsDocumentslist extends oxList
{
    public function __construct( $sObjectsInListName = 'zsdocuments')
    {
        parent::__construct( 'zsdocuments');
    }

    public function getDocumentsList($iFrom = 0, $iLimit = 20)
    {
        if ($iLimit) {
            $this->setSqlLimit($iFrom, $iLimit);
        }

        return $this->getList();
    }

    public function getCount()
    {
        return $this->getList()->count();
    }

    public function getSearchDocumentsList($sSearchParam, $iFrom = 0, $iLimit = 20)
    {
        if ($iLimit) {
            $this->setSqlLimit($iFrom, $iLimit);
        }

        $sQ = "select zsdocuments.* from zsdocuments LEFT JOIN zsdocuments_nomenclature as nom ON
               zsdocuments.oxid = nom.oxid WHERE nom.title LIKE '%" . $sSearchParam . "%'";

        $this->selectString($sQ);

        return $this;
    }
}