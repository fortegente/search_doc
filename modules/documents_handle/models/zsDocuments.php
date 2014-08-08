<?php
class zsDocuments extends oxBase
{
    protected $_sClassName = 'zsdocuments';

    protected $_aSkipSaveFields = array(0 => 'oxtimestamp', 1 => 'last_update');

    protected $_initFields = array();

    public function __construct()
    {
        parent::__construct();
        $this->init( 'zsdocuments' );
    }

    public function checkEmptyField($sId)
    {
        if (!isset($sId) || is_null($sId) || !$sId) {
            return true;
        }

        return false;
    }

    public function onChange($sAction)
    {
        if ($sAction == ACTION_UPDATE && $this->_documentWasChanged()) {
            $this->_sendNotificationToUser();
        }
    }

    private function _documentWasChanged()
    {
        $initFields = $this->_getInitFields();

        foreach ($initFields as $key => $value) {
            if (!in_array($key, $this->_aSkipSaveFields)) {
                $prefix = 'zsdocuments__' . $key;
                if ($this->_isFieldChanged($value, $this->$prefix->value)) {
                    return true;
                }
            }
        }
    }

    private function _isFieldChanged($initFieldValue, $actualFieldValue)
    {
        return md5($initFieldValue) != md5($actualFieldValue);
    }

    private function _sendNotificationToUser()
    {
        $oEmail = oxNew('oxemail');
        $oEmail->sendNotificationAboutDocumentsChange();
    }

    public function assignRecord( $sSelect )
    {
        $blRet = false;

        $rs = oxDb::getDb( oxDb::FETCH_MODE_ASSOC )->select( $sSelect );

        if ($rs != false && $rs->recordCount() > 0) {
            $blRet = true;
            $this->_setInitFields($rs->fields);
            $this->assign($rs->fields);
        }

        return $blRet;
    }

    private function _setInitFields($fields)
    {
        $this->_initFields = $fields;
    }

    private function _getInitFields()
    {
        return $this->_initFields;
    }
}