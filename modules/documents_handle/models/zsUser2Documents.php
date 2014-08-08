<?php
class zsUser2Documents extends oxUBase
{
    protected $_sClassName = 'zsuser_documents';

    protected $_currentUserId = null;

    public function __construct()
    {
        parent::__construct();
        $this->init( 'zsuser_documents' );
        $this->_setCurrentUserId();
    }

    private function _setCurrentUserId()
    {
        $oUser = $this->getUser();
        $sUserId = $oUser->oxuser__oxid->value;
        $this->_currentUserId = $sUserId;
    }

    public function save($documentsCollection)
    {
        $oDb = oxDb::getDb();
        $result = false;

        foreach ($documentsCollection as $documentId) {
            if (!$this->_checkDocumentAlreadyInCollection($documentId)) {
                $sQ  = "INSERT INTO zsuser_documents SET documents_id = " . $oDb->quote($documentId)
                     . ", user_id = " . $oDb->quote($this->_currentUserId) . ",  last_seen = " . $oDb->quote(date("Y-m-d H:i:s"));

                if ($oDb->execute($sQ, false, false)) {
                    $result = true;
                }
            }
        }

        return $result;
    }

    public function getUserDocuments($iFrom = 0, $iLimit = 20)
    {
        $oDocuments = oxNew('zsDocumentslist');
        $oDocuments->init('zsDocuments');

        if ($iLimit !== false) {
            $oDocuments->setSqlLimit($iFrom, $iLimit);
        }

        $oDb = oxDb::getDb();
        $sQ = "SELECT * from zsdocuments LEFT JOIN  zsuser_documents ON
                zsdocuments.oxid = zsuser_documents.documents_id
                WHERE zsuser_documents.user_id = " . $oDb->quote($this->_currentUserId);

        $oDocuments->selectString( $sQ );

        return $oDocuments;
    }

    public function removeUserDocument($document_id)
    {
        $oDb = oxDb::getDb();
        $sQ = "DELETE FROM zsuser_documents WHERE documents_id = " . $oDb->quote($document_id) . " AND user_id = " . $oDb->quote($this->_currentUserId);

        return $oDb->execute($sQ);
    }

    public function getCount()
    {
        $oDb = oxDb::getDb();
        $sQ  = 'select count(*) from zsuser_documents where user_id = ' . $oDb->quote($this->_currentUserId);
        $iCnt = (int) $oDb->getOne($sQ);

        return $iCnt;
    }

    private function _checkDocumentAlreadyInCollection($documentId)
    {
        $oDb = oxDb::getDb();
        $sQ  = "SELECT * FROM zsuser_documents WHERE documents_id = " . $oDb->quote($documentId) . " AND " .
            "user_id = " . $oDb->quote($this->_currentUserId);
        if ($oDb->getOne($sQ, false, false)) {
            return true;
        }
    }
}