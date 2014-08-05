<?php
class zsDocuments extends oxBase
{
    protected $_sClassName = 'zsdocuments';

    private $_requiredFields = array(
        'zsdocuments__oxid',
        'zsdocuments__name'
    );

    public function __construct()
    {
        parent::__construct();
        $this->init( 'zsdocuments' );
    }

    public function checkIfDocumentExists($sId)
    {
        $oDb = oxDb::getDb();
        $sSelect =  "select oxid from zsdocuments where zsdocuments.oxid = " . $oDb->quote($sId);
        $sUserID = $oDb->getOne($sSelect);

        return $sUserID;
    }

    public function checkEmptyField($sId)
    {
        if (!isset($sId) || is_null($sId) || !$sId) {
            return true;
        }

        return false;
    }
}